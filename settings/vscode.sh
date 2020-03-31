#!/bin/bash

# command
# curl -sf https://raw.githubusercontent.com/HazeyamaLab/setup/master/settings/vscode.sh | bash -s

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

if which code >/dev/null 2>&1; then
  echo "[main] installing Visual Studio Code extensions..."
  for extension in "${extensions[@]}"; do
    code --install-extension $extension
  done
else
  echo "code commnad not found. please check https://github.com/HazeyamaLab/setup/issues/2"
fi
