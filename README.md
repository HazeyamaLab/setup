# Welcom to Hazeyama Lab !

研究室で使用するソフトウェアを一括でインストールするスクリプトファイルです．  
本リポジトリはCloneすることなく実行可能です．  

## for Windows

PowerShellを管理者権限で実行し，以下のコマンドを実行します．

<details>
<summary>PowerShellの起動方法</summary>
スタートボタンを右クリックで「Windows PowerShell(管理者)」を選択します．
<img src="./windows/windows.gif">
</details>

```ps
Set-ExecutionPolicy RemoteSigned -scope CurrentUser
iwr -useb raw.githubusercontent.com/HazeyamaLab/setup/master/windows/install.ps1 | iex
```

## for macOS

ターミナルで以下のコマンドを実行します．

<details>
<summary>ターミナルの起動方法</summary>
<code>⌘ command</code> + <code>space</code>でSpotlightを開いて「ターミナル」で検索します．
<img src="./macOS/mac.gif">
</details>

```bash
curl -sf https://raw.githubusercontent.com/HazeyamaLab/setup/master/macOS/install.sh | sh -s
```
