" vim-plugが無かったら自動でダウンロードしてきて欲しい
call plug#begin('~/.local/share/nvim/plugged')

" NERDTree
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" カラースキーム
Plug 'joshdick/onedark.vim' " Dark Theme
Plug 'itchyny/lightline.vim' " status line

" 空白の可視化
Plug 'ntpeters/vim-better-whitespace'

" インデント可視化

call plug#end()


" color
set termguicolors
colorscheme onedark
let g:lightline = {'colorscheme': 'onedark'}

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
inoremap <silent> jj <Esc>:<C-u>w<CR> " jjでインサートモードから抜けると同時にファイルを保存する
map <C-e> :NERDTreeToggle<CR>

" 移動
" 行移動
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" 無駄な空白のハイライトと保存時の削除
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1

