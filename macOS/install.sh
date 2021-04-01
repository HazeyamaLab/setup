#!/bin/bash

log='
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
echo "$log"

# Command Line Developper Toolsのインストール
if which xcode-select >/dev/null 2>&1; then
  echo "[1/4] xcode-select is already installed! skipping this step."
else
  echo "[1/4] installing xcode-select..."
  xcode-select --install
fi

# Homebrewのインストール
if which brew >/dev/null 2>&1; then
  echo "[2/4] homebrew is already installed! skipping this step."
else
  echo "[2/4] installing homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

# GitHubからBrewfileをダウンロード (とりあえずHOMEディレクトリに配置する．)
echo "[3/4] download Brewfile..."
cd "$HOME" && curl -fsSL https://raw.githubusercontent.com/HazeyamaLab/setup/master/macOS/Brewfile > ./Brewfile

# M1チップではない場合にインストールするソフトウェア
if [ ! "$(uname -m)" = "arm64" ]; then
  cd "$HOME" && echo 'cask "virtualbox"\ncask "vagrant"' >> ./Brewfile
fi

# 取得したBrewfileをもとにパッケージをインストール
echo "[4/4] installing package..."
cd "$HOME" && brew bundle && rm ./Brewfile
