[string]$log='
   _   _                                             _          _     
  | | | | __ _ _______ _   _  __ _ _ __ ___   __ _  | |    __ _| |__  
  | |_| |/ _` |_  / _ \ | | |/ _` | `_ ` _ \ / _` | | |   / _` | `_ \ 
  |  _  | (_| |/ /  __/ |_| | (_| | | | | | | (_| | | |__| (_| | |_) |
  |_| |_|\__,_/___\___|\__, |\__,_|_| |_| |_|\__,_| |_____\__,_|_.__/ 
                       |___/                                        

  See the README for documentation.
    https://github.com/HazeyamaLab/setup

  Copyright (c) 2020 "Tokyo Gakugei University - Hazeyamalab"
'

# アスキーアートの表示
Write-Host "$log"

# Init-Scoop: bucketを追加する
function Init-Scoop {
  scoop bucket add extras
  scoop bucket add java
}

# Insatll-Package: cui関連のツールをインストールする
function Install-Package {
  scoop install sudo
  scoop install curl
  scoop install wget
  scoop install gibo
  scoop install nvm yarn
  scoop install python
  scoop install go
  scoop install adopt8-hotspot
  scoop install adopt11-hotspot
  scoop install adopt14-hotspot
  scoop install mysql
}

# Install-GUI-Application-By-Scoop: scoopでGUIツールをインストールする
function Install-GUI-Application-By-Scoop {
  scoop install slack
  scoop install skype
  scoop install vscode
  scoop install mysql-workbench
  scoop install tableplus
  scoop install vagrant
}

# Install-GUI-Application-By-Choco: chocolateyでGUIツールをインストールする (scoopで取得できないもの)
function Install-GUI-Application-By-Choco {
  choco install -y googlechrome
  choco install -y virtualbox
}

# scoopでのソフトウェアのインストールに失敗する場合があるので，対処法法について出力するようにする．
function Print-Note {
  Write-Host "[NOTE-INFO] Some software may fail to install."  -ForegroundColor Yellow
  scoop status
  Write-Host "If outputs"
  Write-Host '
    These apps failed to install:
        app-name
  ' -ForegroundColor Red
  Write-host "Use" -NoNewLine; Write-Host ' "scoop uninstall app-name" ' -ForegroundColor Red -NoNewLine; Write-Host "to uninstall fail app."
  Write-host "And" -NoNewLine; Write-Host ' "scoop install app-name" ' -ForegroundColor Red -NoNewLine; Write-Host "to reinstall manually."
}


# main
# scoopのインストール
if (gcm scoop -ea SilentlyContinue) {
  Write-Host "[1/4] scoop is already installed! skipping this step."
} else {
  Write-Host "[1/4] installing scoop..."
  Invoke-Expression (New-Object System.Net.WebClient).DownloadString('https://get.scoop.sh')
}

# chocolateyのインストール
if (gcm choco -ea SilentlyContinue) {
  Write-Host "[2/4] chocolatey is already installed! skipping this step."
} else {
  Write-Host "[2/4] installing chocolatey..."
  Set-ExecutionPolicy Bypass -Scope Process -Force;[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
}

# gitのインストール (scoopのbucketの追加に必要なため優先的にインストールする)
if (gcm git -ea SilentlyContinue) {
  Write-Host "[3/4] git is already installed! skipping this step."
} else {
  Write-Host "[3/4] installing git..."
  scoop install git
}

# パッケージをインストール
if (gcm scoop -and gcm choco -ea SilentlyContinue) {
  Write-Host "[4/4] installing package..."
  Init-Scoop
  Install-Package
  Install-GUI-Application-By-Scoop
  Install-GUI-Application-By-Choco
} else {
  [string]$err='
  [ERROR] command not found! The installation procedure may have changed.

  See the chocolatey documentation.
    https://chocolatey.org/install

  See the scoop documentation.
    https://scoop.sh/
  '
  $Host.UI.WriteErrorLine("$err")
  exit 1
}

Print-Note
