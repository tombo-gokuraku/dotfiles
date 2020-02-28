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
#### lazygit
[ lazygit ]( https://github.com/jesseduffield/lazygit/releases )へアクセス
```
wget https://github.com/jesseduffield/lazygit/releases/download/vxx.yy.zz/lazygit_xx.yy.zz_Linux_x86_64.tar.gz
targzx lazygit_xx.yy.zz_Linux_x86_64.tar.gz
sudo cp lazygit /usr/bin/
lg --version
```

#### OBS
[ install-instructions ](https://obsproject.com/wiki/install-instructions#linux)のDebian-based Build Directionsを参考にインストールする

### IMEの設定
1. `./google_ime_keymap.txt`をインポートしてキーバインドの設定をする
1. `./ime_dictionary`をインポートして辞書を設定する

## Usage

## Todo
- 階層整理
  - リンクするdotfilesをsettingsディレクトリ内に格納
  - install用のスクリプトとinstallするパッケージのリストのテキストをscriptsディレクトリ内に格納
- link.shをsettingsディレクトリ内のdotfilesに向ける
- settingsファイル内のファイルを探索して、自動的にリンクするようにlink.shを書き直す
- 最新版のNode.jsをインストールするスクリプト
```bash
#!/bin/bash

# バージョン番号の比較をしようとしている。上手くいっていない。bashわからん。
# nodeが見つからないか、v12.13.1より古いバージョンだったらnを使ってインストールしたい
verlte() {
    [  "$1" = "`echo -e '$1\n$2' | sort -V | head -n1`" ]
}

verlt() {
    [ "$1" = "$2" ] && return 1 || verlte $1 $2
}

node_version=`node --version`
echo $node_version
verlt "$node_version" "v12.13.1" && echo "yes" || echo "no"
# if (verlt "$node_version" "v12.13.1"); then
if (verlt "v12.13.1" "$node_version"); then
    echo "install"
fi

# node,npmが無かった時に実行するコマンド
## sudo apt install -y nodejs npm

# 以下、バージョンが古かった時に実行するコマンド
## sudo npm install n -g
## sudo n stable
## sudo apt purge -y nodejs npm


# dpkg --compare-versionsはバージョン番号が数字から始まってない!って怒られた
# if $(dpkg --compare-versions "$node_version" "lt" "v12.13.1"); then echo true; fi

# 参考
# https://stackoverflow.com/questions/4023830/how-to-compare-two-strings-in-dot-separated-version-format-in-bash
```
