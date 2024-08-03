function Test-CommandExist([string]$cmd){
    Get-Command $cmd -ea SilentlyContinue | Out-Null; return $?
}

function ConvertTo-Base64String([string]$plainText){
    $b64Str = [Convert]::ToBase64String(([System.Text.Encoding]::Default).GetBytes($plainText))
    return $b64Str
}

function ConvertFrom-Base64String([string]$b64Str){
    $plainText = [System.Text.Encoding]::Default.GetString(
        [System.Convert]::FromBase64String($b64Str))
    return $plainText
}

function Expand-ZipArchive(){
    Param(
        [string][Parameter(Mandatory)]$zipFilePath,
        [string]$extractToDirectory = ""
    )
    if(-Not(Test-Path $zipFilePath)){
        Write-Error "not found $zipFilePath"
        return
    }
    $p = Convert-Path $zipFilePath
    if($extractToDirectory -eq ""){
        $extractToDirectory = Join-Path $PWD (Split-Path $zipFilePath -LeafBase)
    }elseif(-Not(Split-Path -IsAbsolute $extractToDirectory)){
        $extractToDirectory = Join-Path $PWD (Split-Path $extractToDirectory -LeafBase)
    }
    $e = [Uri]::new($extractToDirectory).LocalPath
    Write-Host "Extracting..."
    [System.IO.Compression.ZipFile]::ExtractToDirectory($p, $e)
    Write-Host "Extracted to $extractToDirectory"
}

function Compress-ZipArchive(){
    Param(
        [string][Parameter(Mandatory)]$compressDirectory,
        [string]$zipFilePath = ""
    )
    if(-Not(Test-Path $compressDirectory)){
        Write-Error "not found $compressDirectory"
        return
    }
    $c = Convert-Path $compressDirectory
    if($zipFilePath -eq ""){
        $zipFilePath = (Join-Path $PWD (Split-Path $compressDirectory -Leaf)) + ".zip"
    }elseif(-Not(Split-Path -IsAbsolute $zipFilePath)){
        if((Split-Path $zipFilePath -Extension) -eq ".zip"){
            $zipFilePath = (Join-Path $PWD (Split-Path $zipFilePath -Leaf))
        }else{
            $zipFilePath = (Join-Path $PWD (Split-Path $zipFilePath -Leaf)) + ".zip"
        }
    }
    $z = [Uri]::new($zipFilePath).LocalPath
    Write-Host "Compressing..."
    [System.IO.Compression.ZipFile]::CreateFromDirectory($c, $z)
    Write-Host "compressed to $zipFilePath"
}

function Set-RepositoryLocation(){
    if(-Not(Test-CommandExist "fzf")){
        Write-Host "require 'fzf'"
        return
    }elseif(-Not(Test-CommandExist "ghq")){
        Write-Host "require 'ghq'"
        return
    }
    $rp = ghq list -p | fzf
    if($null -ne $rp){
        Set-Location $rp
    }
}
