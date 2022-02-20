"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Last modified: Sun, 20 Feb 2022 03:22:32 +0000
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"colorscheme
colorscheme default
"utf-8 fenc=fileencoding
set termencoding=utf-8
set encoding=utf-8
set fileencodings=utf-8,iso-2022-jp,cp932,euc-jp "utf-8を最優先に
"コードの色
syntax on
"行番号
set number
"カーソル位置表示
set ruler
"ノーマルでブロック、挿入でI型、上書きでアンダーライン型
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
"全体の背景と下線及びコマンドライン及びこの下の文字とか
highlight normal ctermbg=NONE ctermfg=white
"ステータスラインの色
highlight statusline ctermfg=darkgray ctermbg=236 cterm=bold
"コメントアウトの色
highlight comment ctermfg=darkgray
"現在の行を強調
set cursorline
highlight cursorline ctermbg=234 ctermfg=NONE
"現在の列を強調
set cursorcolumn
highlight cursorcolumn ctermbg=234 ctermfg=NONE
"行番号を強調
highlight linenr ctermbg=NONE ctermfg=darkgray
"カレント行番号の色、termは白黒端末、ctermはカラー端末(boldにすると明るくなる)、属性はbold,underline,reverse
highlight cursorlinenr ctermfg=lightyellow ctermbg=NONE
"行末の1文字先までカーソル移動可能
set virtualedit=onemore
"一行が長くても@表示にしない
set display=lastline
"スクロール開始前後の行数
set scrolloff=2
"表示行単位の移動
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k
"不可視文字表示
set list
"不可視文字表示記号設定
"set listchars=tab:▸\ ,eol:↲,trail:$,extends:❯,precedes:❮
set listchars=tab:▸\ ,trail:$
"ファイル名
set title
"2ステータスラインを常に表示0表示しない1ウインドウが2つ以上ある時のみ表示
set laststatus=2
"絶対パス%Freadonly%r変更%m行数%l全行数%L全体に対する割合%p切り詰め%<列数%c左右に分ける%=fenc%{&fileencoding}
set statusline=%F%r%m\ [line=%l/%L(%p%%)][column=%c]%<%=[fenc=%{&fileencoding}]
"入力中のコマンドをステータスに表示
set showcmd
"コマンドラインモードでTabで補完、補完候補を順次表示full
set wildmenu wildmode=full
"コマンドラインモードの保存履歴件数
"set history
"メッセージ欄行
set cmdheight=1
"対応括弧
set showmatch
"対応括弧にカーソルが飛ぶ時間*0.1s
set matchtime=1
"tab入力の表示幅0はtabstopと同じ
set softtabstop=0
"存在するtabの表示幅
set tabstop=4
"自動インデントの表示幅
set shiftwidth=4
"自動インデント
set smartindent
"tabをスペースに変換
set expandtab
"保存されていないファイルがあるときは終了前に確認
"set confirm
"保存されていないファイルがあっても別のファイルを開くことができる
"set hidden
"外部でファイルに変更がされた場合は読み直す
"set autoread
"上書きの前にバックアップを作る(backupがオンでない限り、成功した後削除)
"set writebackup
"バックアップをとる
"set backup
"バックアップを作るディレクトリ
"set backupdir=~/.vim/backup
"スワップを作るディレクトリ
"set directory=~/.vim/swap
"*= /
nnoremap <Space>/ *
"大文字小文字区別せずに検索
set ignorecase
"含大文字の場合は区別
set smartcase
"検索で最後まで行ったら最初に戻る
set wrapscan
"検索文字列入力時に順次対象文字列にヒット
set incsearch
"検索語をハイライト
set hlsearch
"ハイライトを消す
nnoremap <ESC><ESC> :nohlsearch<CR>
"ビープ音を可視化、=表示内容
set visualbell t_vb=
"エラーメッセージ表示時にビープ音を鳴らさない
set noerrorbells
"行末までヤンク
nnoremap Y y$
"ビジュアルモードで選択するとクリップボードに、ヤンクしたら無名レジスタだけではなく*レジスタに、:versionで"+clipboard"でコンパイルされている必要がある
set clipboard=unnamed,autoselect
"挿入からノーマルに
inoremap <silent> qq <ESC>
"ついでに
vnoremap <silent> qq <ESC>
"C-aとC-e
"noremap <C-e> <Esc>$
"noremap <C-a> <Esc>^
noremap <Space>h ^
noremap <Space>l $
"xとかでヤンクが上書きされない(black hole registerに保存される)
noremap x "_x
"noremap <C-k> "_dd
"起動時のメッセージを表示しない
set shortmess+=I
"マウス有効化
"set mouse=a
"deleteキー有効化
set backspace=indent,eol,start
"括弧補完
imap ( ()<LEFT>
imap { {}<LEFT>
inoremap '' ''<LEFT>
inoremap "" ""<LEFT>
imap <> <><LEFT>
imap [ []<LEFT>
inoremap $$ $$<LEFT>
"split
nnoremap s <Nop>
nnoremap S <Nop>
nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>
nnoremap sw <C-w>w
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L
nnoremap sH <C-w>H
nnoremap sr <C-w>r
"tab
nnoremap st :<C-u>tabnew<CR>
nnoremap sp gt
nnoremap sn gT
nnoremap s= <C-w>=
nnoremap s> <C-w>>
nnoremap s< <C-w><
nnoremap s+ <C-w>+
nnoremap s- <C-w>-
"noZZ
nnoremap ZZ <Nop>

"neobundle

"at first
"mkdir -p ~/.vim/bundle
"git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
":NeoBundleInstall

set nocompatible
filetype off

if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim
endif

call neobundle#begin(expand('~/.vim/bundle/'))

"NeoBundleでNeoBundleを管理
NeoBundleFetch 'Shogo/neobundle.vim'

"*/*: repos on github(git://github.com/*/*.git)
"NeoBundle 'jedi-vim'
NeoBundle 'kana/vim-submode'
NeoBundle 'airblade/vim-gitgutter'

call neobundle#end()

NeoBundleCheck

"ファイル形式の検出、拡張子に応じたプラグイン及びインデントファイルのロード
filetype plugin indent on
"neobundle後に書く必要

""jedi-vim
"
""don't show docstring
""autocmd FileType python setlocal completeopt-=preview
"
""start completion on dot
"let g:jedi#popup_on_dot=1

"vim-submode
call submode#enter_with('bufmove', 'n', '', 's>', '<C-w>>')
call submode#enter_with('bufmove', 'n', '', 's<', '<C-w><')
call submode#enter_with('bufmove', 'n', '', 's+', '<C-w>+')
call submode#enter_with('bufmove', 'n', '', 's-', '<C-w>-')
call submode#map('bufmove', 'n', '', '>', '<C-w>>')
call submode#map('bufmove', 'n', '', '<', '<C-w><')
call submode#map('bufmove', 'n', '', '+', '<C-w>+')
call submode#map('bufmove', 'n', '', '-', '<C-w>-')

"gitgutter

"highlight lines
"let g:gitgutter_highlight_lines = 1
"command = :GitGutterLineHighlightsToggle

"signcolumn bgcolor
"let g:gitgutter_override_sign_column_highlight = 0
"highlight SignColumn ctermbg=

"sign
"let g:gitgutter_sign_added = ''
"let g:gitgutter_sign_modified = ''
"let g:gitgutter_sign_removed = ''
"let g:gitgutter_sign_removed_first_line = ''
"let g:gitgutter_sign_modified_removed = ''

"sign color
"highlight GitGutterAdd ctermfg= ctermbg=
"highlight GitGutterChange ctermfg= ctermbg=
"highlight GitGutterDelete ctermfg= ctermbg=
"highlight GitGutterChangeDelete ctermfg= ctermbg=

"line color
"highlight GitGutterAddLine ctermfg= ctermbg=
"highlight GitGutterChangeLine ctermfg= ctermbg=
"highlight GitGutterDeleteLine ctermfg= ctermbg=
"highlight GitGutterChangeDeleteLine ctermfg= ctermbg=

" Use Skeleton for new file.
augroup SkeletonAu
"設定された自動コマンドを削除(重複避け)
autocmd!
"新規ファイル読み込み時に起きる autocmd イベント名 ファイル名 実行コマンド
"0r 行頭からread(貼り付け)
autocmd BufNewFile *.c 0r $HOME/.vim/skel.c
autocmd BufNewFile *.py 0r $HOME/.vim/skel.py
"autocmd BufNewFile *.tex 0r $HOME/.vim/skel.tex

augroup END

"" Insert timestamp after 'Last modified: '
function! LastModified()
if &modified
  let save_cursor = getpos(".")
  let n = min([40, line("$")])
  keepjumps exe '1,' . n . 's#^\(.\{,10}Last modified: \).*#\1' .
        \ strftime('%a, %d %b %Y %H:%M:%S %z') . '#e'
  call histdel('search', -1)
  call setpos('.', save_cursor)
endif
endfun
autocmd BufWritePre * call LastModified()

"changing color entering and leaving insert mode and visual mode
let g:hi_insert = 'highlight StatusLine ctermfg=black ctermbg=darkred cterm=bold'
let g:hi_visual = 'highlight StatusLine ctermfg=black ctermbg=darkblue cterm=bold'
let g:hi_replace = 'highlight StatusLine ctermfg=black ctermbg=darkgreen cterm=bold'
let g:hi_normal = 'highlight StatusLine ctermfg=darkgray ctermbg=236 cterm=bold'

if has('syntax')
  augroup ModeHook
    autocmd!
    autocmd InsertEnter * call s:StatusLine('Enter')
    autocmd InsertLeave * call s:StatusLine('Leave')
    vnoremap <silent> <expr> <SID>SetVisual SetVisual()
    nnoremap <silent> <script> v v<SID>SetVisuall
    nnoremap <silent> <script> V V<SID>SetVisualj
    nnoremap <silent> <script> <C-v> <C-v><SID>SetVisuall
    inoremap <silent> <expr> <SID>SetReplace SetReplace()
    "nnoremap <silent> <script> r r<SID>SetReplace
    nnoremap <silent> <script> R R<SID>SetReplace
    autocmd CursorHold * call SetNormal()
  augroup END
endif

function! SetVisual()
    set updatetime=0
    call s:StatusLine('Venter')
    return ''
endfunction

function! SetReplace()
    set updatetime=0
    call s:StatusLine('Renter')
    return ''
endfunction

function! SetNormal()
    set updatetime=4000
    call s:StatusLine('Leave')
    endfunction

let s:slhlcmd = ''
function! s:StatusLine(mode)
  if a:mode == 'Enter'
    silent! let s:slhlcmd = 'highlight ' . s:GetHighlight('StatusLine')
    silent exec g:hi_insert
  elseif a:mode == 'Venter'
    silent! let s:slhlcmd = 'highlight ' . s:GetHighlight('StatusLine')
    silent exec g:hi_visual
  elseif a:mode == 'Renter'
    silent! let s:slhlcmd = 'highlight ' . s:GetHighlight('StatusLine')
    silent exec g:hi_replace
  else
    "highlight clear StatusLine
    "silent exec s:slhlcmd
    silent! let s:slhlcmd = 'highlight ' . s:GetHighlight('StatusLine')
    silent exec g:hi_normal
  endif
endfunction

function! s:GetHighlight(hi)
  redir => hl
  exec 'highlight '.a:hi
  redir END
  let hl = substitute(hl, '[\r\n]', '', 'g')
  let hl = substitute(hl, 'xxx', '', '')
  return hl
endfunction

"for rc indent
au BufRead,BufNewFile *.*rc set shiftwidth=2
au BufRead,BufNewFile *.html set shiftwidth=2
au BufRead,BufNewFile *.css set shiftwidth=2
au BufRead,BufNewFile *.js set shiftwidth=2
