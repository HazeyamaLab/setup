# Welcom to Hazeyama Lab !

## for Windows

PowerShellを管理者権限で実行します．

```
Set-ExecutionPolicy RemoteSigned -scope CurrentUser
Invoke-Expression (New-Object System.Net.WebClient).DownloadString('https://get.scoop.sh')
```

## For macOS

`ターミナル.app`を開きます．

```
curl -sf https://raw.githubusercontent.com/HazeyamaLab/setup/master/macOS/install.sh | sh -s
```
