
# this is a standalone script that reads the corresponding packages.yml
# it does not use Ansible, Ansible is only supported through WSL in windows

# Install Chocolatey if it's not already installed
if (!(Get-Command choco.exe -ErrorAction SilentlyContinue)) {
    Write-Host "Installing chocolatey..."
    Set-ExecutionPolicy Bypass -Scope Process -Force; 
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; 
    Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
}

# Check if Powershell-Yaml module is installed
if (!(Get-Module -ListAvailable -Name Powershell-Yaml)) {
    # Install Powershell-Yaml module
    Write-Host "Installing Powershell-Yaml..."
    Install-Module -Name Powershell-Yaml -Scope CurrentUser
}

# Read YAML file
Write-Host "Reading packages from file..."
$packages = ConvertFrom-Yaml (Get-Content "packages.yml" -Raw)

# Install packages using Chocolatey
foreach ($package in $packages.packages) {
    $installedPackages = choco list --local-only --id-only
    if ($installedPackages -contains $package) {
        Write-Host "$package is already installed. Skipping..."
    }
    else {
        Write-Host "Installing $package..."
        choco install $package -y
    }
}

Write-Host "Done."
Write-Host "Press any key to exit..."
$Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown") | Out-Null