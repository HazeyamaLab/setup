[string]$log='
   _   _                                         	_      	_ 	
  | | | | __ _ _______ _   _  __ _ _ __ ___   __ _  | |	__ _| |__ 
  | |_| |/ _` |_  / _ \ | | |/ _` | `_ ` _ \ / _` | | |   / _` | `_ \
  |  _  | (_| |/ /  __/ |_| | (_| | | | | | | (_| | | |__| (_| | |_) |
  |_| |_|\__,_/___\___|\__, |\__,_|_| |_| |_|\__,_| |_____\__,_|_.__/
                       |___/                                      	
  See the README for documentation.
    https://github.com/HazeyamaLab/setup
  
  Copyright (c) 2020 "Tokyo Gakugei University - Hazeyamalab"
'

echo "$log"

# function is components install package with scoop & Chocolatey
function Init-Scoop {
  scoop bucket add extras
  scoop bucket add java
}

function Install-Package {
  scoop install sudo
  scoop install curl
  scoop install wget
  scoop install gibo
  scoop install nvm yarn
  scoop install python
  scoop install go
  scoop install openjdk
  scoop install mysql
}

function Install-GUI-Application {
  choco install -y googlechrome
  choco install -y virtualbox
  scoop install slack
  scoop install skype
  scoop install vscode
  scoop install mysql-workbench
  scoop install tableplus
  scoop install vagrant
}

# scoop
if (gcm scoop -ea SilentlyContinue) {
  echo "[1] scoop is already installed! skipping this step."
} else {
  echo "[1] installing scoop..."
  Invoke-Expression (New-Object System.Net.WebClient).DownloadString('https://get.scoop.sh')
}

# Chocolatey
if (gcm choco -ea SilentlyContinue) {
  echo "[2] Chocolatey is already installed! skipping this step."
} else {
  echo "[2] installing scoop..."
  Set-ExecutionPolicy Bypass -Scope Process -Force;[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
}

# setup - git
if (gcm git -ea SilentlyContinue) {
  echo "[3] git is already installed! skipping this step."
} else {
  scoop install git
}

if (gcm scoop -ea SilentlyContinue) {
  echo "[4] installing package..."
  Init-Scoop
  Install-Package
  Install-GUI-Application
} else {
  $Host.UI.WriteErrorLine("[4] scoop command is not found!")
  exit 1
}
