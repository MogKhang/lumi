# Caveman-mode rebranding: mogkhang/lumi -> mogkhang/lumi
# This script handles text replacements across all source files

$root = "F:\AppDev\0 apps\lumi"

# Define file extensions to process
$extensions = @("*.kt", "*.dart", "*.xml", "*.yaml", "*.yml", "*.md", "*.ps1", "*.cpp", "*.h", "*.plist", "*.pbxproj", "*.go", "*.rb", "*.sh", "*.resolved", "*.kts", "*.rc", "*.properties")

# Skip directories
$skipDirs = @(".git", "build", ".dart_tool", ".gradle", ".kotlin", "pubspec.lock")

function Replace-InFiles {
    param(
        [string]$SearchPath,
        [string]$OldText,
        [string]$NewText,
        [string[]]$FilePatterns
    )
    
    foreach ($pattern in $FilePatterns) {
        Get-ChildItem -Path $SearchPath -Filter $pattern -Recurse -File | 
            Where-Object { 
                $skip = $false
                foreach ($dir in $skipDirs) {
                    if ($_.FullName -match [regex]::Escape("\$dir\")) { $skip = $true; break }
                }
                -not $skip
            } |
            ForEach-Object {
                $content = Get-Content $_.FullName -Raw -ErrorAction SilentlyContinue
                if ($content -and $content.Contains($OldText)) {
                    $newContent = $content.Replace($OldText, $NewText)
                    Set-Content -Path $_.FullName -Value $newContent -NoNewline
                    Write-Host "  Updated: $($_.FullName)"
                }
            }
    }
}

Write-Host "=== STEP 1: Replace package/namespace 'com.mogkhang' -> 'com.mogkhang' ===" -ForegroundColor Cyan
Replace-InFiles -SearchPath $root -OldText "com.mogkhang" -NewText "com.mogkhang" -FilePatterns $extensions

Write-Host ""
Write-Host "=== STEP 2: Replace JNI names 'com_mogkhang_lumi' -> 'com_mogkhang_lumi' ===" -ForegroundColor Cyan
Replace-InFiles -SearchPath $root -OldText "com_mogkhang_lumi" -NewText "com_mogkhang_lumi" -FilePatterns $extensions

Write-Host ""
Write-Host "=== STEP 3: Replace 'Lumi' -> 'Lumi' (case-sensitive, user-facing strings) ===" -ForegroundColor Cyan
Replace-InFiles -SearchPath $root -OldText "Lumi" -NewText "Lumi" -FilePatterns $extensions

Write-Host ""
Write-Host "=== STEP 4: Replace 'lumi' -> 'lumi' (lowercase identifiers) ===" -ForegroundColor Cyan
# Be careful: only replace in specific contexts, not in URLs pointing to edde746 repos
# First do the non-URL replacements
Replace-InFiles -SearchPath $root -OldText "com.lumi" -NewText "com.lumi" -FilePatterns $extensions
Replace-InFiles -SearchPath $root -OldText "'lumi/" -NewText "'lumi/" -FilePatterns $extensions  # method channels
Replace-InFiles -SearchPath $root -OldText "`"lumi/" -NewText "`"lumi/" -FilePatterns $extensions  # method channels in C++
Replace-InFiles -SearchPath $root -OldText "lumi/window" -NewText "lumi/window" -FilePatterns $extensions
Replace-InFiles -SearchPath $root -OldText "Software\\Lumi" -NewText "Software\\Lumi" -FilePatterns $extensions
Replace-InFiles -SearchPath $root -OldText "Software\\\\Lumi" -NewText "Software\\\\Lumi" -FilePatterns $extensions
Replace-InFiles -SearchPath $root -OldText "lumi-windows" -NewText "lumi-windows" -FilePatterns $extensions
Replace-InFiles -SearchPath $root -OldText "lumi.exe" -NewText "lumi.exe" -FilePatterns $extensions
Replace-InFiles -SearchPath $root -OldText "lumi-settings" -NewText "lumi-settings" -FilePatterns $extensions
Replace-InFiles -SearchPath $root -OldText "lumi_downloads" -NewText "lumi_downloads" -FilePatterns $extensions
Replace-InFiles -SearchPath $root -OldText "lumi_legacy_prefs" -NewText "lumi_legacy_prefs" -FilePatterns $extensions
Replace-InFiles -SearchPath $root -OldText "lumi-remote" -NewText "lumi-remote" -FilePatterns $extensions
Replace-InFiles -SearchPath $root -OldText "lumi-session" -NewText "lumi-session" -FilePatterns $extensions
Replace-InFiles -SearchPath $root -OldText "lumi-auth" -NewText "lumi-auth" -FilePatterns $extensions
Replace-InFiles -SearchPath $root -OldText "lumi-app-profile" -NewText "lumi-app-profile" -FilePatterns $extensions
Replace-InFiles -SearchPath $root -OldText "'lumi'" -NewText "'lumi'" -FilePatterns $extensions  # app identifier in JSON
Replace-InFiles -SearchPath $root -OldText "`"plezy`"" -NewText "`"lumi`"" -FilePatterns $extensions
Replace-InFiles -SearchPath $root -OldText ".scheme(`"plezy`")" -NewText ".scheme(`"lumi`")" -FilePatterns $extensions

Write-Host ""
Write-Host "=== STEP 5: Replace GitHub user 'mogkhang/lumi' -> 'mogkhang/lumi' (repo references) ===" -ForegroundColor Cyan
Replace-InFiles -SearchPath $root -OldText "mogkhang/lumi" -NewText "mogkhang/lumi" -FilePatterns $extensions

Write-Host ""
Write-Host "=== STEP 6: Replace remaining 'edde746' -> 'mogkhang' in non-dependency contexts ===" -ForegroundColor Cyan
# Publisher, copyright, etc. (but NOT git dependency URLs since those still point to edde746's forks)
Replace-InFiles -SearchPath "$root\windows" -OldText "`"edde746`"" -NewText "`"mogkhang`"" -FilePatterns $extensions
Replace-InFiles -SearchPath $root -OldText "Copyright (C) 2025 mogkhang" -NewText "Copyright (C) 2025 mogkhang" -FilePatterns $extensions
Replace-InFiles -SearchPath $root -OldText "mogkhang.lumi" -NewText "mogkhang.lumi" -FilePatterns $extensions

Write-Host ""
Write-Host "=== STEP 7: Replace plezy.app domain references ===" -ForegroundColor Cyan
# These are server URLs - keeping the domain but updating the reference context
# ice.plezy.app and bugs.plezy.app are server infrastructure  
# We'll leave these as-is since they're actual server endpoints unless user has their own

Write-Host ""
Write-Host "=== DONE ===" -ForegroundColor Green
