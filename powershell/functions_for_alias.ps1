function Invoke-GitStatus { git status $Args }
function Invoke-GitLog { git log $Args }
function Invoke-GitAdd { git add $Args }
function Invoke-GitCommit { git commit $Args }
function Invoke-GitCommitAmend { git commit --amend $Args }
function Invoke-GitReset { git reset $Args }
function Invoke-GitDiff { git diff $Args }
function Invoke-GitDiffCached { git diff --cached $Args }
function Invoke-GitSwitch { git switch $Args }
function Invoke-GitSwitchCreate { git switch -c $Args }
function Invoke-GitBranch { git branch $Args }
function Invoke-GitMerge { git merge $Args }
function Invoke-GitPull { git pull $Args }
