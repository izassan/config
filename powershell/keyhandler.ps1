Set-PSReadLineKeyHandler -Key Ctrl+g -ScriptBlock {
    $destinationPath = (ghq list -p | fzf)
    if(($null -eq $destinationPath) -Or ("" -eq $destinationPath)){
        return
    }
    [Microsoft.PowerShell.PSConsoleReadLine]::DeleteLine()
    [Microsoft.PowerShell.PSConsoleReadLine]::Insert("Set-Location $destinationPath")
    [Microsoft.PowerShell.PSConsoleReadLine]::AcceptLine()
    Clear-Host
}

Set-PSReadLineKeyHandler -Key Ctrl+f -ScriptBlock {
    [Microsoft.PowerShell.PSConsoleReadLine]::DeleteLine()
    [Microsoft.PowerShell.PSConsoleReadLine]::Insert("lf")
    [Microsoft.PowerShell.PSConsoleReadLine]::AcceptLine()
}

Set-PSReadLineKeyHandler -Key Ctrl+z -ScriptBlock {
    [Microsoft.PowerShell.PSConsoleReadLine]::DeleteLine()
    [Microsoft.PowerShell.PSConsoleReadLine]::Insert("vim .")
    [Microsoft.PowerShell.PSConsoleReadLine]::AcceptLine()
}
