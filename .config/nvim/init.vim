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

" init.vimを編集したら自動でinit.vimをリロードする
augroup reload_initvim
    au!
    au BufWritePost init.vim so $MYVIMRC | call LightlineReload()
augroup end

" init.vimをReloadするとLightlineが消えてしまうので、Lightlineをリロードする
command! LightlineReload call LightlineReload()
function! LightlineReload()
  call lightline#init()
  call lightline#colorscheme()
  call lightline#update()
endfunction

" .tmux.confを編集したら自動で.tmux.confをリロードする "&& tmux refresh-client}
augroup reload_tmuxconf
    autocmd!
    au BufWritePost .tmux.conf :silent! !tmux source-file ~/.tmux.conf && tmux refresh-client
augroup end

" pluginをインストール
call plug#begin('~/.local/share/nvim/plugged')

" PCRE(perlの正規表現)を使えるようにする
" Plug 'othree/eregex.vim'
" regexのプレビューが効かなくなった。完全にPerlライクに書けるわけでもなかった

" NERDTree
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' }

" カラースキーム
Plug 'joshdick/onedark.vim' " Dark Theme
Plug 'itchyny/lightline.vim' " status line

"devicons
Plug 'ryanoasis/vim-devicons', { 'on': 'NERDTreeToggle' }


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


" vim-lsp関連
" Plug 'prabirshrestha/async.vim'
" Plug 'prabirshrestha/vim-lsp'
" Plug 'mattn/vim-lsp-settings'
" Plug 'thomasfaingnaert/vim-lsp-snippets'
" Plug 'thomasfaingnaert/vim-lsp-ultisnips'

" 入力補完
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'prabirshrestha/asyncomplete.vim'
" Plug 'prabirshrestha/asyncomplete-lsp.vim'

" "highlight関連"
" highlight styled-components tag literals
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
"cxx highlighter
Plug 'jackguo380/vim-lsp-cxx-highlight'

" highlight jsx
" Plug 'maxmellon/vim-jsx-pretty' " vim-polyglotをインストールすれば自動的に入る

" semantic-highlight
" styled-componentsにおけるtag literals内のプレースホルダー内のCSSに色をつけてくれるかなと思ったけど無理だった。
" Plug 'jaxbot/semantic-highlight.vim'


" javascript syntax
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx'] }
" javascript向けsyntax file
Plug 'othree/yajs.vim'
" ecma script 関連のsyntax file
Plug 'othree/es.next.syntax.vim'
" JavaScriptライブラリ向けのsyntax file
Plug 'othree/javascript-libraries-syntax.vim'

" Snippet
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" emmet-vin
Plug 'mattn/emmet-vim'

" Terminal & REPL
Plug 'kassio/neoterm'

" コメントアウト
" Plug 'tpope/vim-commentary' " コンテキストを解釈できない
Plug 'tomtom/tcomment_vim' " コンテキストを解釈してコメントアウトしてくれる

" Undo
Plug 'mbbill/undotree'

" カーソル移動
Plug 'easymotion/vim-easymotion'
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-easymotion.vim'
Plug 'haya14busa/incsearch-fuzzy.vim'

" 囲み文字の編集
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'

" 自動で括弧を閉じる
Plug 'jiangmiao/auto-pairs'

" Markdown
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & npm install'  }

" session manager
Plug 'tpope/vim-obsession'

" advanced yank history
Plug 'svermeulen/vim-yoink'


" ctags
Plug 'majutsushi/tagbar', {'on': 'TagbarToggle'}

call plug#end()


" Pythonパスの設定
let g:python_host_prog  = $HOME . '/Env/python_env/nvim_env/bin/python'
let g:python3_host_prog  = $HOME . '/Env/python_env/nvim_env/bin/python3'

""" "plugin settings" """
" "lightline settings"
set termguicolors
colorscheme onedark
function LightlineObsessionStatus()
    return '%{ObsessionStatus("*", "obsession not started")}'
endfunction
let g:lightline = {'colorscheme': 'onedark'}
let g:lightline.tabline = {
    \ 'left': [ [ 'tabs' ] ],
    \ 'right': [ [ 'obsession_status' ] ] }

let g:lightline.component_expand = {
  \   'linter_checking': 'lightline#ale#checking',
  \   'linter_warnings': 'lightline#ale#warnings',
  \   'linter_errors': 'lightline#ale#errors',
  \   'linter_ok': 'lightline#ale#ok',
  \   'obsession_status': 'LightlineObsessionStatus',
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

" "ntpeters/vim-better-whitespaceの設定"
" 無駄な空白のハイライトと保存時の削除
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1
let g:strip_whitespace_confirm = 0 "確認なしに空白行を削除する"

" "fzf settings"
" デフォルトで隠しファイルを表示する
let $FZF_DEFAULT_COMMAND = 'rg --glob "!.git/*" --hidden --files --no-ignore-vcs'
" <leader>fでfzfを起動
nnoremap <leader>f :FZF<CR>
" <leader>gfでGFilesを起動
nnoremap <leader>gf :GFiles<CR>



" "ALE Settings"
" jsxのためのファイルタイプを追加
augroup FiletypeGroup
    autocmd!
    au BufNewFile,BufRead *.jsx set filetype=javascript.jsx
augroup END

"ALEKeyMap
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
" ALE Linters
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_linters = {
    \ 'html': ['htmlhint', 'textlint'],
    \ 'css': ['stylelint'],
    \ 'scss': ['stylelint'],
    \ 'sass': ['stylelint'],
    \ 'markdown': ['textlint']
    \ }
let g:ale_lint_on_save = 1
" ALE Fixers
let g:ale_fixers = {
  \   '*': ['remove_trailing_lines', 'trim_whitespace'],
  \   'html': ['prettier'],
  \   'css': ['stylelint'],
  \   'scss': ['stylelint'],
  \   'sass': ['stylelint'],
  \   'markdown': ['textlint'],
  \ }
let g:ale_fix_on_save = 1


" "ultisnips settings"
let g:UltiSnipsExpandTrigger='<c-j>'

" "emmet-vim settings"
" set emmet leader key
let g:user_emmet_leader_key='<C-E>'

" "coc.nvim settings"
" インストールする拡張機能
let g:coc_global_extensions = [
    \  'coc-lists'
    \, 'coc-yank'
    \, 'coc-word'
    \, 'coc-translator'
    \, 'coc-emoji'
    \, 'coc-highlight'
    \, 'coc-markdownlint'
    \, 'coc-json'
    \, 'coc-yaml'
    \, 'coc-marketplace'
    \, 'coc-html'
    \, 'coc-css'
    \, 'coc-tsserver'
    \, 'coc-styled-components'
    \, 'coc-tailwindcss'
    \, 'coc-eslint'
    \, 'coc-prettier'
    \, 'coc-python'
    \, 'coc-snippets'
    \, 'coc-vetur'
    \, 'coc-cmake'
    \, 'coc-clangd'
    \, 'coc-vimlsp'
    \ ]
" Enterで補完候補を決定する
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" ジャンプの設定
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Uでドキュメントの表示
nnoremap <silent> U :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" coc-snippets settings
" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)
" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)
" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'
" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'
" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" coc-yank settings
nnoremap <silent> <space>y  :<C-u>CocList -A --normal yank<cr>

" coc-vimlsp settings
let g:markdown_fenced_languages = [
      \ 'vim',
      \ 'help'
      \]

" coc-translator settings
nmap <Leader>ct <Plug>(coc-translator-p)
vmap <Leader>ct <Plug>(coc-translator-pv)

" "asyncomplete settings"
set completeopt+=preview "preview windowを表示する"

" "semantic-highlight settings"
" nnoremap <leader><ESC> :SemanticHighlightToggle<cr>

" "javascript-libraries-syntax settings"
let g:used_javascript_libs = 'react,vue'

" "vim-javascript settings"
let g:javascript_plugin_jsdoc = 1


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
" incsearch_config
function! s:incsearch_config(...) abort
  return incsearch#util#deepextend(deepcopy({
  \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
  \   'keymap': {
  \     "\<CR>": '<Over>(easymotion)'
  \   },
  \   'is_expr': 0
  \ }), get(a:, 1, {}))
endfunction
" fuzzy search config
function! s:config_easyfuzzymotion(...) abort
  return extend(copy({
  \   'converters': [incsearch#config#fuzzyword#converter()],
  \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
  \   'keymap': {"\<CR>": '<Over>(easymotion)'},
  \   'is_expr': 0,
  \   'is_stay': 1
  \ }), get(a:, 1, {}))
endfunction

noremap <silent><expr> / incsearch#go(<SID>incsearch_config())
noremap <silent><expr> ? incsearch#go(<SID>incsearch_config({'command': '?'}))
noremap <silent><expr> g/ incsearch#go(<SID>incsearch_config({'is_stay': 1}))
noremap <silent><expr> <Space>/ incsearch#go(<SID>config_easyfuzzymotion())

" "NERDTree settings"
" デフォルトで隠しファイルを表示する (Iでトグルできる)
let g:NERDTreeShowHidden=1
" C-eでNERDTreeをトグル
map <leader>e :NERDTreeToggle<CR>

" "vim-markdown settings"
let g:vim_markdown_conceal = 0 " 全てのconcealを無効化
let g:vim_markdown_conceal_code_blocks = 0 " markdownのコードブロックの``を隠さないように設定する

" "markdown-preview.nvim settings"
" set to 1, nvim will open the preview window after entering the markdown buffer
" default: 0
let g:mkdp_auto_start = 0
" set to 1, the MarkdownPreview command can be use for all files,
" by default it can be use in markdown file
" default: 0
let g:mkdp_command_for_global = 0
" set to 1, echo preview page url in command line when open preview page
" default is 0
let g:mkdp_echo_preview_url = 1
map <leader>mp :MarkdownPreview<CR>

" "tpope/vim-obsession settings"
" https://gist.github.com/robmiller/5135652
" Autoload sessions created by tpope's vim-obsession when starting Vim.
" 引数なしで`nvim`のように起動した時、Session.vimがあればsourceする
" Obsessionが起動しておらず、Session.vimがあれば、Obsessionを起動する
augroup sourcesession
  autocmd!
  autocmd VimEnter * nested
  \ if empty(v:this_session) && filereadable('Session.vim') |
  \     source Session.vim |
  \ endif |
  \ if !exists('g:this_obsession') && filereadable('Session.vim') |
  \   Obsess |
  \ endif
augroup END
map <leader>os :Obsess<CR>

" "vim-yoink settings"
" cycle yank history
nmap <c-p> <plug>(YoinkPostPasteSwapBack)
nmap <c-n> <plug>(YoinkPostPasteSwapForward)

" paste below
nmap p <plug>(YoinkPaste_p)
" paste above
nmap P <plug>(YoinkPaste_P)

" show yank history
nmap <leader>yh :Yanks<CR>

" delete operations such as x or d or s will also be added to the yank history.
let g:yoinkIncludeDeleteOperations = 1

" the yank history will be saved persistently across sessions of Vim. Note: Requires Neovim.
let g:yoinkSavePersistently = 1
set shada=!,'100,<50,s10,h

" the cursor will always be placed at the end of the paste.
let g:yoinkMoveCursorToEndOfPaste = 1

" When set to 0, it will cycle back to the other end of the history so you can swap in the same direction forever.
let g:yoinkSwapClampAtEnds = 1
" 1週したかどうかが分かりづらいので0にするのは微妙

" "tagbar settings"
nmap <leader>t :TagbarToggle<CR>

" "NeoVim関連の設定"

" 反映されるまでの時間を早くする(for vim-gitgutter)
set updatetime=100

" syntax
syntax on

" 行番号
set number
set relativenumber

" splitwindow
set splitbelow
set splitright

" インデント
set autoindent
set tabstop=2
set shiftwidth=2
set softtabstop=2
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
" enable xsel
let g:clipboard = {
      \   'name': 'xsel_override',
      \   'copy': {
      \      '+': 'xsel --input --clipboard',
      \      '*': 'xsel --input --primary',
      \    },
      \   'paste': {
      \      '+': 'xsel --output --clipboard',
      \      '*': 'xsel --output --primary',
      \   },
      \   'cache_enabled': 1,
      \ }
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
set clipboard+=unnamedplus

" ファイル関連設定
set encoding=utf-8
set guifont=DroidSansMono\ Nerd\ Font\ 11
set confirm "終了時に未保存のファイルがある場合、警告する"
set hidden "未保存のファイルがあっても別のファイルを開ける"
set autoread "外部でファイルが変更されたら自動的にリロードする"
au FocusGained * :checktime

" keymappings
" <leader>hでHistoryを表示する
nmap <leader>h :History<CR>
" jjでインサートモードから抜ける
inoremap <silent> jj <Esc>
" <ESC><ESC> で検索ハイライトをトグル
nnoremap <ESC><ESC> :set hlsearch!<CR>
" <leader>wで保存
nnoremap <leader>w :w<CR>
" <leader>rでvimrcをリロード
nnoremap <leader>r :so $MYVIMRC<CR>
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
" splitwindow関連
nnoremap <c-w>_ <c-w>v
nnoremap <c-w>- <c-w>s
nmap <silent> <c-w>J :resize +2<CR>
nmap <silent> <c-w>K :resize -2<CR>
nmap <silent> <c-w>H :vertical resize +2<CR>
nmap <silent> <c-w>L :vertical resize -2<CR>

" comment outの自動挿入を無効
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" ROS launch fileをxmlとして読み込み
au BufNewFile,BufRead *.launch setf xml

" "ファイルごとの設定"
set runtimepath+='~/.config/nvim/ftplugin/javascript.vim'
set runtimepath+='~/.config/nvim/ftplugin/css.vim'
set runtimepath+='~/.config/nvim/ftplugin/scss.vim'
set runtimepath+='~/.config/nvim/ftplugin/sass.vim'
set runtimepath+='~/.config/nvim/ftplugin/html.vim'
set runtimepath+='~/.config/nvim/ftplugin/vue.vim'
set runtimepath+='~/.config/nvim/ftplugin/csv.vim'
set runtimepath+='~/.config/nvim/ftdetect/cloudformation.vim'
" autocmd BufWritePost *template.y*ml silent !cfn-format -w % 2>/dev/null " 保存時にCloudFormationのFormatterを実行
filetype plugin indent on
