#!/bin/bash

# command
# curl -sf https://raw.githubusercontent.com/HazeyamaLab/setup/master/settings/zsh.sh | bash -s

SHELL=$SHELL
ZSH="/usr/local/bin/zsh"

if [ $SHELL = $ZSH ]; then
  echo "zsh is already installed!"
else
  echo "installing zsh..."
  brew install zsh
  echo "installing oh-my-zhs..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  echo "change default shell"
  sudo sh -c "echo '/usr/local/bin/zsh' >> /etc/shells"
  chsh -s /usr/local/bin/zsh
  /usr/local/bin/zsh
  echo "setting zshrc..."
  touch ~/.zshrc
  curl -sf https://raw.githubusercontent.com/HazeyamaLab/setup/master/settings/config/.zshrc > ~/.zshrc
  source ~/.zshrc
fi

echo "Complete!"
