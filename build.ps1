param(
    [string]$Language = "EN",
    [string]$GameMount = "$PSScriptRoot\..\Anthem_1.0.0.64_x64__8wekyb3d8bbwe\Mount",
    [string]$FfmpegPath = "",
    [switch]$SkipBank
)

$ErrorActionPreference = "Stop"
$root = $PSScriptRoot
$dist = Join-Path $root "dist"
$build = Join-Path $root "build"

if (-not $SkipBank) {
    $stock = Join-Path $GameMount "media\audio\fmodanthem\durango\HZ2_DX_SatNav_$Language.bank"
    $extra = @()
    if ($FfmpegPath) { $extra = @("--ffmpeg", $FfmpegPath) }
    $ErrorActionPreference = "Continue"
    python (Join-Path $root "tools\build_bank.py") --bank $stock --source (Join-Path $root "source") `
        --out (Join-Path $dist "SatNav\HZ2_DX_SatNav_$Language.bank") @extra
    if ($LASTEXITCODE -ne 0) { throw "Bank build failed." }
    $ErrorActionPreference = "Stop"
}

$cmake = (Get-Command cmake.exe -ErrorAction SilentlyContinue).Source
if (-not $cmake) {
    $vswhere = Join-Path ${env:ProgramFiles(x86)} "Microsoft Visual Studio\Installer\vswhere.exe"
    $vs = & $vswhere -latest -products "*" -property installationPath
    $cmake = Join-Path $vs "Common7\IDE\CommonExtensions\Microsoft\CMake\CMake\bin\cmake.exe"
}
& $cmake -S $root -B $build -A x64
if ($LASTEXITCODE -ne 0) { throw "CMake configuration failed." }
& $cmake --build $build --config Release
if ($LASTEXITCODE -ne 0) { throw "Compilation failed." }

Copy-Item (Join-Path $root "SatNavVoice.ini") $dist -Force
Write-Host "Build complete. Copy the contents of '$dist' into fh2-mods."
