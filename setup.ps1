Param(
    [ValidateSet("init", "link", "clean")]$SubCommand
)

class Config{
    [string]$Name
    [string]$ConfigPath
    [string]$LinkDestPath
    Config([string]$name, [string]$configPath, [string]$linkDestPath){
        $this.Name = $name
        $this.ConfigPath = $configPath
        $this.LinkDestPath = $linkDestPath
    }

    Link(){
        Write-Host "Create $($this.Name) Symbolic Link:  $($this.ConfigPath) -> $($this.LinkDestPath)"
        New-Item -ItemType Directory -Path (Split-Path -Path $this.ConfigPath) -Force | Out-Null
        New-Item -ItemType SymbolicLink -Path $this.ConfigPath -Value $this.LinkDestPath
    }

    Clean(){
        Write-Host "Remove $($this.Name) Symbolic Link: $($this.ConfigPath)"
        if(Test-Path $this.ConfigPath){
            Remove-Item -Recurse -Force $this.ConfigPath
        }
    }
}

function Start-InitializeMyPC(){
    $initPaths = @(
        "$HOME\local\bin",
        "$HOME\local\doc",
        "$HOME\local\etc",
        "$HOME\local\lib",
        "$HOME\local\opt",
        "$HOME\local\projects",
        "$HOME\local_config"
    )
    $initPaths | ForEach-Object { New-Item -ItemType Directory -Force -Path $_ | Out-Null }
}

function Start-ConfigOperation(){
    foreach($c in $config){
        if($SubCommand -eq "init"){
            Start-InitializeMyPC
        }elseif($SubCommand -eq "link"){
            $c.Clean()
            $c.Link()
        }elseif($SubCommand -eq "clean"){
            $c.Clean()
        }
    }
}

# Define this config hashtable
$config = @(
    [Config]::new("powershell", "$HOME\Documents\Powershell", "$PWD\powershell"), # powershell7.x
    [Config]::new("powershell", "$HOME\Documents\WindowsPowershell", "$PWD\powershell"), # powershell5.1
    [Config]::new("git", "$HOME\.config\git", "$PWD\git")
    [Config]::new("git", "$HOME\vimfiles", "$PWD\vim")
)

Start-ConfigOperation
