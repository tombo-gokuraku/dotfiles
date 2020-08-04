# tombo gokuraku dotfiles

## Install

リポジトリをホームにクローンする。

```bash
cd
git clone https://github.com/tombo-gokuraku/dotfiles
cd dotfiles
```

install.sh を実行する。

```bash
./install.sh
```

link.sh を実行する。

```bash
./link.sh
```

### deb をダウンロードしてインストールするプログラムを入れる(Optional)

- [ Chrome ](https://www.google.com/chrome/)
- [ Discord ](https://discordapp.com/download)
- [ Slack ](https://slack.com/intl/ja-jp/downloads/linux)
- [ Steam ](https://store.steampowered.com/about/)

## Keybinds

### tmux

#### tmux-sessionist

- `prefix + g` - prompts for session name and switches to it. Performs 'kind-of'
  name completion.<br/>
  Faster than the built-in `prefix + s` prompt for long session lists.
- `prefix + C` (shift + c) - prompt for creating a new session by name.
- `prefix + X` (shift + x) - kill current session without detaching tmux.
- `prefix + S` (shift + s) - switches to the last session.<br/>
  The same as built-in `prefix + L` that everyone seems to override with
  some other binding.
- `prefix + @` - promote current pane into a new session.<br/>
  Analogous to how `prefix + !` breaks current pane to a new window.
- `prefix + t<secondary-key>` - join currently marked pane (`prefix + m`) to current session/window, and switch to it
  - secondary-keys
    - `h`, `-`, `"`: join horizontally
    - `v`, `|`, `%`: join vertically
    - `f`, `@`: join full screen

#### tmux-logging

##### 1. Logging

Toggle (start/stop) logging in the current pane.

- Key binding: `prefix + shift + p`
- File name format: `tmux-#{session_name}-#{window_index}-#{pane_index}-%Y%m%dT%H%M%S.log`
- File path: `$HOME` (user home dir)
  - Example file: `~/tmux-my-session-0-1-20140527T165614.log`

##### 2. "Screen Capture"

Save visible text, in the current pane. Equivalent of a "textual screenshot".

- Key binding: `prefix + alt + p`
- File name format: `tmux-screen-capture-#{session_name}-#{window_index}-#{pane_index}-%Y%m%dT%H%M%S.log`
- File path: `$HOME` (user home dir)
  - Example file: `tmux-screen-capture-my-session-0-1-20140527T165614.log`

##### 3. Save complete history

Save complete pane history to a file. Convenient if you retroactively remember
you need to log/save all the work.

- Key binding: `prefix + alt + shift + p`
- File name format: `tmux-history-#{session_name}-#{window_index}-#{pane_index}-%Y%m%dT%H%M%S.log`
- File path: `$HOME` (user home dir)
  - Example file: `tmux-history-my-session-0-1-20140527T165614.log`

**NOTE**: this functionality depends on the value of `history-limit` - the number
of lines Tmux keeps in the scrollback buffer. Only what Tmux kept will also be saved,
to a file.

Use `set -g history-limit 50000` in .tmux.conf, with modern computers
it is ok to set this option to a high number.

##### 4. Clear pane history

Key binding: `prefix + alt + c`

This is just a convenience key binding.

#### tmux-fingers

Press ( <kbd>prefix</kbd> + <kbd>F</kbd> ) to enter **[fingers]** mode, it will highlight relevant stuff in the current
pane along with letter hints. By pressing those letters, the highlighted match
will be copied to the clipboard.

- <kbd>a</kbd>-<kbd>z</kbd>: copies selected match to the clipboard
- <kbd>CTRL</kbd> + <kbd>a</kbd>-<kbd>z</kbd>: copies selected match to the clipboard and triggers [@fingers-ctrl-action](#fingers-ctrl-action). By default it triggers `:open:` action, which is useful for opening links in the browser for example.
- <kbd>SHIFT</kbd> + <kbd>a</kbd>-<kbd>z</kbd>: copies selected match to the clipboard and triggers [@fingers-shift-action](#fingers-shift-action). By default it triggers `:paste:` action, which automatically pastes selected matches.
- <kbd>ALT</kbd> + <kbd>a</kbd>-<kbd>z</kbd>: copies selected match to the clipboard and triggers [@fingers-alt-action](#fingers-alt-action). There is no default, configurable by the user.
- <kbd>TAB</kbd>: toggle multi mode. First press enters multi mode, which allows to select multiple matches. Second press will exit with the selected matches copied to the clipboard.
- <kbd>SPACE</kbd>: toggle compact hints ( see [@fingers-compact-hints](#fingers-compact-hints) ).
- <kbd>CTRL</kbd> + <kbd>c</kbd>: exit **[fingers]** mode
- <kbd>ESC</kbd>: exit help or **[fingers]** mode
- <kbd>?</kbd>: show help.

#### tmux-coycat

##### Search

- `prefix + /` - regex search (strings work too)

Example search entries:

- `foo` - searches for string `foo`
- `[0-9]+` - regex search for numbers

Grep is used for searching.<br/>
Searches are case insensitive.<br/>

##### Predefined searches

- `prefix + ctrl-f` - simple *f*ile search
- `prefix + ctrl-g` - jumping over *g*it status files (best used after `git status` command)
- `prefix + alt-h` - jumping over SHA-1/SHA-256 hashes (best used after `git log` command)
- `prefix + ctrl-u` - *u*rl search (http, ftp and Git urls)
- `prefix + ctrl-d` - number search (mnemonic d, as digit)
- `prefix + alt-i` - *i*p address search

These start "copycat mode" and jump to first match.

##### "Copycat mode" bindings

These are enabled when you search with copycat:

- `n` - jumps to the next match
- `N` - jumps to the previous match

To copy a highlighted match:

- `Enter` - if you're using Tmux `vi` mode
- `ctrl-w` or `alt-w` - if you're using Tmux `emacs` mode

Copying a highlighted match will take you "out" of copycat mode. Paste with
`prefix + ]` (this is Tmux default paste).

## Todo

- 階層整理
  - リンクする dotfiles を settings ディレクトリ内に格納
  - install 用のスクリプトと install するパッケージのリストのテキストを scripts ディレクトリ内に格納
  - link.sh を settings ディレクトリ内の dotfiles に向ける
- settings ファイル内のファイルを探索して、自動的にリンクする link.sh を書く
- log を自動で作成するようにする
- error が発生した場所だけハイライトして表示する
- ~~最新版の Node.js をインストールするスクリプト(nvm を使うことにした)~~
- minimum install(必要最低限のアプリ) と full install(ほしい物全部載せ)を作る
