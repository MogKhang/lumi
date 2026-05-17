# Fix plezy.icon references in pbxproj files
$files = @(
    "F:\AppDev\0 apps\lumi\macos\Runner.xcodeproj\project.pbxproj",
    "F:\AppDev\0 apps\lumi\ios\Runner.xcodeproj\project.pbxproj"
)
foreach ($f in $files) {
    $c = Get-Content $f -Raw
    if ($c.Contains('plezy.icon')) {
        $c = $c.Replace('plezy.icon','lumi.icon')
        Set-Content $f -Value $c -NoNewline
        Write-Host "Updated: $f"
    }
}

# Also fix linux packaging script
$linuxFile = "F:\AppDev\0 apps\lumi\linux\packaging\plezy.sh"
if (Test-Path $linuxFile) {
    $c = Get-Content $linuxFile -Raw
    $changed = $false
    if ($c.Contains('plezy')) { $c = $c.Replace('plezy','lumi'); $changed = $true }
    if ($changed) { Set-Content $linuxFile -Value $c -NoNewline; Write-Host "Updated linux packaging" }
}

# Rename the Casks file
$casksFile = "F:\AppDev\0 apps\lumi\Casks\plezy.rb"
if (Test-Path $casksFile) {
    Rename-Item $casksFile "lumi.rb"
    Write-Host "Renamed Casks/plezy.rb to lumi.rb"
}

# Rename linux packaging script
if (Test-Path "F:\AppDev\0 apps\lumi\linux\packaging\lumi.sh") {
    Write-Host "linux packaging already renamed"
} elseif (Test-Path "F:\AppDev\0 apps\lumi\linux\packaging\plezy.sh") {
    Rename-Item "F:\AppDev\0 apps\lumi\linux\packaging\plezy.sh" "lumi.sh"
    Write-Host "Renamed linux packaging script"
}

Write-Host "Done" -ForegroundColor Green
