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

