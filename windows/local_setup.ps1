# Install Chocolatey if it's not already installed
if (!(Get-Command choco.exe -ErrorAction SilentlyContinue)) {
    Set-ExecutionPolicy Bypass -Scope Process -Force; 
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; 
    iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
}

# List of programs to install
$programs = @(
    "firefox",
    "7zip",
    "vlc",
    "vscode",
    "git",
    "miniconda3",
    "github-desktop",
    "spotify",
    "zotero",
    "steam",
    "nvidia-display-driver",
    "geforce-experience",
    "zoom",
    "notion",
    "putty",
    "sumatrapdf",
    "nvm",
    "r.studio",
    "r",
    "rtools"
)

# Install each program using Chocolatey
foreach ($program in $programs) {
    choco install $program -y
}