# Fix remaining plezy references
$root = "F:\AppDev\0 apps\lumi"

$patterns = @("*.pbxproj", "*.plist", "*.ps1", "*.md", "*.go", "*.rb", "*.sh", "*.resolved")
$skipDirs = @(".git", "build", ".dart_tool", ".gradle", ".kotlin", "pubspec.lock")

$replacements = @(
    @{Old = 'com.mogkhang.lumi'; New = 'com.mogkhang.lumi'},
    @{Old = 'lumi-macos.dmg'; New = 'lumi-macos.dmg'},
    @{Old = 'lumi-bin'; New = 'lumi-bin'},
    @{Old = 'install --cask lumi'; New = 'install --cask lumi'},
    @{Old = 'yay -S lumi-bin'; New = 'yay -S lumi-bin'},
    @{Old = 'cd lumi'; New = 'cd lumi'},
    @{Old = 'lumi.app/'; New = 'lumi.app/'},
    @{Old = 'FOLDER_PATH)/lumi'; New = 'FOLDER_PATH)/lumi'},
    @{Old = 'ASSETCATALOG_COMPILER_APPICON_NAME = lumi'; New = 'ASSETCATALOG_COMPILER_APPICON_NAME = lumi'},
    @{Old = 'query=lumi'; New = 'query=lumi'}
)

foreach ($pattern in $patterns) {
    Get-ChildItem -Path $root -Filter $pattern -Recurse -File | 
        Where-Object { 
            $skip = $false
            foreach ($dir in $skipDirs) {
                if ($_.FullName -match [regex]::Escape("\$dir\")) { $skip = $true; break }
            }
            -not $skip
        } |
        ForEach-Object {
            $content = Get-Content $_.FullName -Raw -ErrorAction SilentlyContinue
            if (-not $content) { return }
            $changed = $false
            foreach ($r in $replacements) {
                if ($content.Contains($r.Old)) {
                    $content = $content.Replace($r.Old, $r.New)
                    $changed = $true
                    Write-Host "  [$($r.Old) -> $($r.New)] in $($_.Name)"
                }
            }
            if ($changed) {
                Set-Content -Path $_.FullName -Value $content -NoNewline
            }
        }
}

Write-Host "Done with remaining fixes" -ForegroundColor Green
