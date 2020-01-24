" leader keyを設定
let g:mapleader = ' '
" Release keymappings for plug-in.
nnoremap <Space> <Nop>

" fileformatの設定
setglobal fileformat=unix

" "vim-polyglot settings"
let g:polyglot_disabled = ['md'] " ~/.vimrc, declare this variable before polyglot is loaded

" vim-plugが無かったら自動でダウンロードする
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" init.vimを編集したら自動で"init.vimをリロードして、PlugInstallする
augroup reload_initvim
    au!
    au BufWritePost init.vim so $MYVIMRC | call LightlineReload() | silent PlugInstall
augroup end

" init.vimをReloadするとLightlineが消えてしまうので、Lightlineをリロードする
command! LightlineReload call LightlineReload()
function! LightlineReload()
  call lightline#init()
  call lightline#colorscheme()
  call lightline#update()
endfunction

" pluginをインストール
call plug#begin('~/.local/share/nvim/plugged')

" NERDTree
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' }

" カラースキーム
Plug 'joshdick/onedark.vim' " Dark Theme
Plug 'itchyny/lightline.vim' " status line

" 空白の可視化
Plug 'ntpeters/vim-better-whitespace'

" インデント可視化
Plug 'Yggdroot/indentLine'

" あいまい検索
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" ルートディレクトリを.gitのあるディレクトリに変更する
Plug 'airblade/vim-rooter'

" Git関連
" Gitと連携する
Plug 'tpope/vim-fugitive'

" Git差分表示
Plug 'airblade/vim-gitgutter'

" 多言語対応
Plug 'sheerun/vim-polyglot'

" Linter
Plug 'dense-analysis/ale'
Plug 'maximbaz/lightline-ale'

" Snippet
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" emmet-vin
Plug 'mattn/emmet-vim'

" 入力補完
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Terminal & REPL
Plug 'kassio/neoterm'

" コメントアウト
" Plug 'tpope/vim-commentary'
Plug 'tomtom/tcomment_vim'

" Undo
Plug 'mbbill/undotree'

" カーソル移動
Plug 'easymotion/vim-easymotion'

" 囲み文字の編集
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'

" 自動で括弧を閉じる
Plug 'jiangmiao/auto-pairs'

" use vim status line in tmux
" Plug 'edkolev/tmuxline.vim'

" Markdown
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

call plug#end()


" Pythonパスの設定
let g:python_host_prog  = $HOME . '/Env/python_env/nvim_env/bin/python'
let g:python3_host_prog  = $HOME . '/Env/python_env/nvim_env/bin/python3'

""" "plugin settings" """
" "lightline settings"
set termguicolors
colorscheme onedark
let g:lightline = {'colorscheme': 'onedark'}

" "ntpeters/vim-better-whitespaceの設定"
" 無駄な空白のハイライトと保存時の削除
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1
let g:strip_whitespace_confirm = 0 "確認なしに空白行を削除する"

" "fzf settings"
" <leader>fでfzfを起動
nnoremap <leader>f :FZF<CR>
" <leader>gfでGFilesを起動
nnoremap <leader>gf :GFiles<CR>



" "ALE Settings"
"ALEKeyMap
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
" ALE Linters
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_python_flake8_options = '--max-line-length 88'
let g:ale_linters = {
    \ 'python': ['flake8'],
    \ 'javascript': ['eslint'],
    \ 'vue': ['eslint']
    \ }
let g:ale_lint_on_save = 1
" ALE Fixers
let g:ale_fixers = {
  \   '*': ['remove_trailing_lines', 'trim_whitespace'],
  \   'python': ['black'],
  \   'html': ['prettier'],
  \   'css': ['prettier'],
  \   'javascript': ['prettier','eslint'],
  \   'vue': ['prettier','eslint'],
  \ }
let g:ale_fix_on_save = 1

" "ALE lightline Settings"
let g:lightline.component_expand = {
  \   'linter_checking': 'lightline#ale#checking',
  \   'linter_warnings': 'lightline#ale#warnings',
  \   'linter_errors': 'lightline#ale#errors',
  \   'linter_ok': 'lightline#ale#ok',
  \ }
let g:lightline.component_type = {
  \   'linter_checking': 'left',
  \   'linter_warnings': 'warning',
  \   'linter_errors': 'error',
  \   'linter_ok': 'left',
  \ }
let g:lightline.active = {
  \   'left': [
  \     ['mode', 'paste'],
  \     ['readonly', 'filename', 'modified'],
  \     ['linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok'],
  \   ]
  \ }

" "ultisnips settings"
let g:UltiSnipsExpandTrigger='<c-j>'

" "coc.nvim settings"
" tab で補完候補選択 C-nのほうが好きなのでそのままにする
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
"
" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~# '\s'
" endfunction
" Enterで補完候補を決定する
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" ジャンプの設定
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Uでドキュメントの表示
" なぜかホバー表示にならない
nnoremap <silent> U :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" "neoterm settings"
let g:neoterm_default_mod='belowright' "neotermの起動位置の設定
let g:neoterm_size=10 "neotermのサイズの設定
let g:neoterm_autoscroll=1 "autoscroll
"<C-w>でターミナルの挿入モードを抜ける
tnoremap <silent> <C-w> <C-\><C-n><C-w>
" REPLの設定
nnoremap <leader>x :TREPLSendLine<CR>
vnoremap <leader>x V:TREPLSendSelection<CR>
nnoremap <leader><leader>x :TREPLSendFile<CR>
" 3<leader>tl will clear neoterm-3.
nnoremap <leader>tl :<c-u>exec v:count.'Tclear'<cr>

" "undotree settings"
nnoremap <leader>u :UndotreeToggle<cr>

" "vim-easymotion settings"
" s{char}{char} to move to {char}{char}
map <leader>s <Plug>(easymotion-bd-f2)
nmap <leader>s <Plug>(easymotion-overwin-f2)
" Move to line
map <leader>l <Plug>(easymotion-bd-jk)
nmap <leader>l <Plug>(easymotion-overwin-line)

" "NERDTree settings"
" デフォルトで隠しファイルを表示する (Iでトグルできる)
let g:NERDTreeShowHidden=1
" C-eでNERDTreeをトグル
map <leader>e :NERDTreeToggle<CR>

" "tmuxline settings"
" let g:tmuxline_preset = 'full'

" "vim-markdown settings"
let g:vim_markdown_conceal = 0 " 全てのconcealを無効化
" let g:vim_markdown_conceal_code_blocks = 0 " markdownのコードブロックの``を隠さないように設定する

" 反映されるまでの時間を早くする(for vim-gitgutter)
set updatetime=100

" "NeoVim関連の設定"
" syntax
syntax on

" 行番号
set number
" set relativenumber

" インデント
set autoindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set smarttab
set shiftround

" 検索と置換
set ignorecase
set smartcase
set wrapscan
set incsearch
set inccommand=split " 置換をインタラクティブにする insubstitude?とかいうのになったらしい?

" 全角文字で2文字分の幅を使用する
set ambiwidth=double

" クリップボード
set clipboard+=unnamedplus

" ファイル関連設定
set confirm "終了時に未保存のファイルがある場合、警告する"
set hidden "未保存のファイルがあっても別のファイルを開ける"
set autoread "外部でファイルが変更されたら自動的にリロードする"

" キーバインド
" C-pでHistoryを表示する
nmap <C-p> :History<CR>
" jjでインサートモードから抜ける
inoremap <silent> jj <Esc>
" <ESC><ESC> で検索ハイライトをトグル
nnoremap <ESC><ESC> :set hlsearch!<CR>
" <leader>wで保存
nnoremap <leader>w :w<CR>
" 移動
" 行移動
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
" タブ移動
nnoremap <c-h> gT
nnoremap <c-l> gt
" タブ自体の移動
nnoremap <A-h> :tabmove-<CR>
nnoremap <A-l> :tabmove+<CR>
" 行頭、行末に移動
nnoremap H ^
nnoremap L $
vnoremap H ^
vnoremap L $
onoremap H ^
onoremap L $

" "言語ごとの設定"
set runtimepath+='~/.config/nvim/ftplugin/javascript.vim'
set runtimepath+='~/.config/nvim/ftplugin/css.vim'
set runtimepath+='~/.config/nvim/ftplugin/html.vim'
set runtimepath+='~/.config/nvim/ftplugin/vue.vim'
set runtimepath+='~/.config/nvim/ftplugin/csv.vim'
set runtimepath+='~/.config/nvim/ftdetect/cloudformation.vim'
filetype plugin indent on

" "WSL用の設定"
" Linux DESKTOP-8MJMAB0 4.19.67-microsoft-standard #1 SMP Sun Aug 18 13:37:54 UTC 2019 x86_64 x86_64 x86_64 GNU/Linux
if system('uname -a | grep microsoft') != ""
  let g:clipboard = {
        \   'name': 'wslClipboard',
        \   'copy': {
        \      '+': 'win32yank.exe -i',
        \      '*': 'win32yank.exe -i',
        \    },
        \   'paste': {
        \      '+': 'win32yank.exe -o',
        \      '*': 'win32yank.exe -o',
        \   },
        \   'cache_enabled': 1,
        \ }
  " set t_Co=256
  set t_ut=""
  " colorscheme onedark
  " highlight Normal ctermbg=NONE
  " highlight nonText ctermbg=NONE
endif
