function Confirm-Execution {
  $i = Read-Host ">> "

  if ($i -eq "y" -or $i -eq "Y"){
    return
  } elseif ($i -eq "n" -or $i -eq "N") {
    Write-Output "スクリプトを終了します."
    exit 1
  } else {
    Write-Output "y または n を入力して下さい."
    Confirm-Execution
  }
}


if ($env:SCOOP -eq $null) {
  Write-Output "環境変数 SCOOP は未定義です．Scoopでのアプリケーションのインストール先はデフォルトの設定です．"
} else {
  Write-Output "環境変数 SCOOP は${env:SCOOP}で定義されています．"
}

Write-Warning "Scoopでインストールしたアプリケーションを全てアンインストールしますか？ [y/n]"
Confirm-Execution

