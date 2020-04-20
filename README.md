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

### ppaを追加してインストールするプログラムを入れる(Optional)
#### [ CopyQ ](https://github.com/hluk/CopyQ)
クロスプラットホームなクリップボードマネージャー
```
sudo add-apt-repository ppa:hluk/copyq
sudo apt update
sudo apt install copyq
```
### debをダウンロードしてインストールするプログラムを入れる(Optional)
 - [ Chrome ](https://www.google.com/chrome/)
 - [ Discord ](https://discordapp.com/download)
 - [ Slack ](https://slack.com/intl/ja-jp/downloads/linux)
 - [ Steam ](https://store.steampowered.com/about/)
### binaryをインストールする
aptで入らない、もしくは最新版を入れたいプログラム
#### [ lazygit ](https://github.com/jesseduffield/lazygit)
[ lazygit ]( https://github.com/jesseduffield/lazygit/releases )へアクセス
```
wget https://github.com/jesseduffield/lazygit/releases/download/vxx.yy.zz/lazygit_xx.yy.zz_Linux_x86_64.tar.gz
targzx lazygit_xx.yy.zz_Linux_x86_64.tar.gz
sudo cp lazygit /usr/bin/
lg --version
```

#### [ OBS ](https://github.com/obsproject/obs-studio)
[ install-instructions ](https://obsproject.com/wiki/install-instructions#linux)のDebian-based Build Directionsを参考にインストールする

### IMEの設定
1. `./google_ime_keymap.txt`をインポートしてキーバインドの設定をする
1. `./ime_dictionary`をインポートして辞書を設定する

## Todo
- 階層整理
  - リンクするdotfilesをsettingsディレクトリ内に格納
  - install用のスクリプトとinstallするパッケージのリストのテキストをscriptsディレクトリ内に格納
- link.shをsettingsディレクトリ内のdotfilesに向ける
- settingsファイル内のファイルを探索して、自動的にリンクするようにlink.shを書き直す
- ~~最新版のNode.jsをインストールするスクリプト(nvmを使うことにした)~~
