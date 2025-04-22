function prompt {
    $version = $PSVersionTable.PSVersion.Major.ToString() + "." + $PSVersionTable.PSVersion.Minor.ToString()
    Write-Output "PS$version $($executionContext.SessionState.Path.CurrentLocation)$('>' * ($nestedPromptLevel + 1)) "
}
