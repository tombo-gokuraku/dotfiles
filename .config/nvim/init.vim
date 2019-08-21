" vim-plugが無かったら自動でダウンロードしてくる
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" init.vimを編集したら自動でinit.vimをリロードして、PlugInstallしてほしい
augroup reload_initvim
    au!
    au BufWritePost init.vim so $MYVIMRC | call LightlineReload() | silent PlugInstall
augroup end

" init.vimをっReloadするとLightlineが消えてしまうので、Lightlineをリロードする
command! LightlineReload call LightlineReload()
function! LightlineReload()
  call lightline#init()
  call lightline#colorscheme()
  call lightline#update()
endfunction

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

call plug#end()

" color
set termguicolors
colorscheme onedark
let g:lightline = {'colorscheme': 'onedark'}

" 反映されるまでの時間を早くする(for vim-gitgutter)
set updatetime=100

" 行番号
set number
set relativenumber

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

" クリップボード
set clipboard+=unnamedplus

" キーバインド
" jjでインサートモードから抜けると同時にファイルを保存する
inoremap <silent> jj <Esc>:<C-u>w<CR>
" C-eでNERDTreeをトグル
map <C-e> :NERDTreeToggle<CR>
" C-pでfzf.vimのHistoryを表示する
nmap <C-p> :History<CR>

" 移動
" 行移動
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" 無駄な空白のハイライトと保存時の削除
" ntpeters/vim-better-whitespaceの設定
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1
" Yes/Noで聞かれるやつを消したい

