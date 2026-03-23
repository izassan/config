Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser

curl.exe -Lo get.scoop.sh https://get.scoop.sh
$s = Get-Content get.scoop.sh -Raw
Remove-Item get.scoop.sh
Invoke-Expression -Command $s
