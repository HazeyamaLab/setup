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

echo "$log"

echo "[1] installing xcode-select..."
which xcode-select >/dev/null 2>&1 || xcode-select --install

echo "[2] installing homebrew..."
which brew >/dev/null 2>&1 || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

echo "[3] download Brewfile..."
cd "$HOME" && curl -fsSL https://raw.githubusercontent.com/HazeyamaLab/setup/master/macOS/Brewfile > ./Brewfile

echo "[4] installing package..."
brew bundle
