# tombo gokuraku dotfiles

## Install
インストール手順

### リポジトリをホームにクローンする
```
cd
git clone https://github.com/tombo-gokuraku/dotfiles
cd dotfiles
```
### install.shを実行する
```
./install.sh
```
### link.shを実行する
```
./link.sh
```

### debをダウンロードしてインストールするプログラムを入れる(Optional)
 - [ Chrome ](https://www.google.com/chrome/)
 - [ Discord ](https://discordapp.com/download)
 - [ Slack ](https://slack.com/intl/ja-jp/downloads/linux)
 - [ Steam ](https://store.steampowered.com/about/)

## Todo
- 階層整理
  - リンクするdotfilesをsettingsディレクトリ内に格納
  - install用のスクリプトとinstallするパッケージのリストのテキストをscriptsディレクトリ内に格納
- link.shをsettingsディレクトリ内のdotfilesに向ける
- settingsファイル内のファイルを探索して、自動的にリンクするようにlink.shを書き直す
- logを自動で作成するようにする
- errorが発生した場所だけハイライトして表示する
- ~~最新版のNode.jsをインストールするスクリプト(nvmを使うことにした)~~
- minimum install(必要最低限のアプリ) と full install(ほしい物全部載せ)を作る
