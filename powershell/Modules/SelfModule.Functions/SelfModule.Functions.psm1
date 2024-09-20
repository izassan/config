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

function Set-Proxy(){
    Param(
        [Parameter(Mandatory)][ValidateSet("authproxy", "proxy")]$ProxyType,
        [string]$ProxyHost,
        [string]$ProxyPort,
        [string]$ProxyDomain = "",
        [string]$ProxyUser,
        [string]$ProxyPass
    )
    $proxyFQDN = "${ProxyHost}:${ProxyPort}"
    if($ProxyDomain -ne ""){ $proxyFQDN = $ProxyDomain }
    $proxyAddress = "http://${proxyFQDN}"
    if($ProxyType -eq "authproxy"){
        $proxyAddress = "http://${ProxyUser}:${ProxyPass}@${proxyFQDN}"
        $securePass = ConvertTo-SecureString $ProxyPass -AsPlainText -Force
        $cred = New-Object System.Management.Automation.PSCredential `
                $ProxyUser, $securePass
    }

    $proxy = New-Object System.Net.WebProxy $proxyAddress
    if($ProxyType -eq "authproxy"){
        $proxy.Credentials = $cred
    }
    [System.Net.WebRequest]::DefaultWebProxy = $proxy
    [System.Environment]::SetEnvironmentVariable("http_proxy", $proxyAddress, "User")
    [System.Environment]::SetEnvironmentVariable("https_proxy", $proxyAddress, "User")
}

function Copy-SshId(){
    Param(
        [Parameter(Mandatory)]$Destination,
        $PublicKeyPath = "$HOME\.ssh\id_rsa.pub"
    )
    if(-Not(Test-Path $PublicKeyPath)){
        Write-Error "$PublicKeyPath is not exist"
        return
    }
    Get-Content $PublicKeyPath | ssh $Destination `
    " `
    mkdir -p ~/.ssh && chmod 700 ~/.ssh && `
    cat >> ~/.ssh/authorized_keys && chmod 600 ~/.ssh/authorized_keys `
    "
}
