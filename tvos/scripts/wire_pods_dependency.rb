#!/usr/bin/env ruby
# CocoaPods integrates the Pods xcconfig/script phases into the existing
# tvOS Runner.xcodeproj, but on this hand-wired project it does NOT add the
# cross-project target dependency on the `Pods-Runner` aggregate. Without it
# Xcode never builds the plugin pod frameworks (os_media_controls,
# universal_gamepad, wakelock_plus), so Runner fails to link them
# ("no such module 'universal_gamepad'").
#
# This adds that dependency. Idempotent — re-run after every `pod install`.

require 'xcodeproj'

TVOS_DIR = File.expand_path('..', __dir__)
RUNNER_PROJ = File.join(TVOS_DIR, 'Runner.xcodeproj')
PODS_PROJ   = File.join(TVOS_DIR, 'Pods', 'Pods.xcodeproj')

unless File.exist?(File.join(PODS_PROJ, 'project.pbxproj'))
  abort "wire_pods_dependency: #{PODS_PROJ} missing — run scripts/pod_install.sh first"
end

project = Xcodeproj::Project.open(RUNNER_PROJ)
runner = project.targets.find { |t| t.name == 'Runner' }
raise 'Runner target not found' unless runner

pods_project = Xcodeproj::Project.open(PODS_PROJ)
aggregate = pods_project.targets.find { |t| t.name == 'Pods-Runner' }
raise "Pods-Runner aggregate target not found in #{PODS_PROJ}" unless aggregate

# add_dependency on a target from another project requires that project to be
# referenced as a subproject of Runner.xcodeproj. The workspace alone isn't
# enough. Add the file reference if it isn't there yet.
pods_ref = project.reference_for_path(PODS_PROJ)
unless pods_ref
  pods_ref = project.new_file(PODS_PROJ)
  # CocoaPods convention: keep the Pods project reference in a "Pods" group.
  puts '[add ] Pods.xcodeproj subproject reference'
end

already = runner.dependencies.any? { |d| d.name == 'Pods-Runner' || d.target&.name == 'Pods-Runner' }
if already
  puts '[skip] Runner already depends on Pods-Runner'
else
  runner.add_dependency(aggregate)
  puts '[add ] Runner -> Pods-Runner target dependency'
end

# The tvOS engine's simulator Flutter.framework and the plugin pods are
# arm64-only (see Podfile post_install). The Runner target must drop x86_64
# for the simulator too, otherwise a generic "tvOS Simulator" build compiles
# Runner for x86_64 and can't find the arm64-only pod modules
# ("could not find module 'universal_gamepad' for target x86_64-...").
runner.build_configurations.each do |config|
  key = 'EXCLUDED_ARCHS[sdk=appletvsimulator*]'
  unless config.build_settings[key].to_s.split.include?('x86_64')
    config.build_settings[key] = 'x86_64'
    puts "[set ] #{config.name}: #{key} = x86_64"
  end
end

project.save
puts "Saved #{RUNNER_PROJ}"
