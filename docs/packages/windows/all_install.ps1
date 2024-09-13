if(!(Get-Command scoop -ea SilentlyContinue)){
    Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression
}

scoop bucket add extras
scoop bucket add izassan https://github.com/izassan/scoop-bucket

foreach($l in Get-Content .\windows.md) {
    if($l.StartsWith("#")){ continue }
    if($l -eq ""){ continue }
    scoop install $l.Replace("- ", "")
}
