function Get-TrashCanInfo(){
    $trashDir = "$HOME\_trash"
    if($null -ne $env:TRASH_ITEM_DIR){
        $trashDir = $env:TRASH_ITEM_DIR
    }
    $info = @{
        dir = $trashDir
    }
    return $info
}

function New-TrashItem(){
    Param(
        [Parameter(Mandatory)]$TrashItems
    )
    $trashInfo = Get-TrashCanInfo
    New-Item -ItemType Directory -Force $trashInfo.dir | Out-Null
    foreach($i in $TrashItems){
        Move-Item $i $trashInfo.dir
    }
}

function Clear-TrashDir(){
    $trashInfo = Get-TrashCanInfo
    if(-Not(Test-Path $trashInfo.dir)){
        return
    }
    Remove-Item -Recurse -Force ("{0}\*" -f $trashInfo.dir)
}
