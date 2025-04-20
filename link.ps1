$links = @(
    @{ "src" = "$PWD\powershell"; "dest" = "$HOME\Documents\Powershell" },
    @{ "src" = "$PWD\vim"; "dest" = "$HOME\vimfiles" }
)

$links | ForEach-Object {
    $link = [PSCustomObject]$_
    New-Item -ItemType Directory -Path (Split-Path -Path $link.dest ) -Force | Out-Null
    New-Item -ItemType SymbolicLink -Path $link.dest -Value $link.src
}
