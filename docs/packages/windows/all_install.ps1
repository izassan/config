if(!(Get-Command scoop -ea SilentlyContinue)){
    Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression
}

scoop bucket add extras

foreach($l in Get-Content .\windows.md) {
    if($l.StartsWith("#")){ continue }
    if($l -eq ""){ continue }
    scoop install $l.Replace("- ", "")
}
