foreach($l in Get-Content .\go.md) {
    if($l.StartsWith("#")){ continue }
    if($l -eq ""){ continue }
    go install $l.Replace("- ", "")
}
