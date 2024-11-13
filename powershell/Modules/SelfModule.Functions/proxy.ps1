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

