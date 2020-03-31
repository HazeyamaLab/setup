#!/bin/bash

extensions=(
  MS-CEINTL.vscode-language-pack-ja
  dbaeumer.vscode-eslint
  esbenp.prettier-vscode
  ms-vscode.Go
  CoenraadS.bracket-pair-colorizer
  octref.vetur
  oderwat.indent-rainbow
  PKief.material-icon-theme
  VisualStudioExptTeam.vscodeintellicode
  jebbs.plantuml
  redhat.java
  vscjava.vscode-java-debug
  vscjava.vscode-java-dependency
  vscjava.vscode-java-pack
  vscjava.vscode-java-test
  vscjava.vscode-maven
  ichardwillis.vscode-gradle
  wraith13.background-phi-colors
  wraith13.clairvoyant
  yzhang.markdown-all-in-one
)

if which brew >/dev/null 2>&1; then
  echo "installing Visual Studio Code "
  for extension in "${extensions[@]}"; do
    code --install-extension $extension
  done
else
  echo "code commnad not found."
fi
