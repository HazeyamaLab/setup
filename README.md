# Welcom to Hazeyama Lab !

## for Windows

PowerShellを管理者権限で実行します．  
(スタートボタンを右クリックで「Windows PowerShell(管理者)」を選択します)

![](./windows/windows.gif)

PowerShellで以下のコマンドを実行します．

```ps
Set-ExecutionPolicy RemoteSigned -scope CurrentUser
Invoke-Expression (New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/HazeyamaLab/setup/master/windows/install.ps1')
```

## For macOS

`ターミナル.app`を開きます．  
(`⌘ command` + `space`でSpotlightを開いて「ターミナル」で検索します)

![](./macOS/mac.gif)

ターミナルで以下のコマンドを実行します．

```bash
curl -sf https://raw.githubusercontent.com/HazeyamaLab/setup/master/macOS/install.sh | sh -s
```
