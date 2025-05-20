vim.cmd([[
inoremap <silent> jj <Esc>

" setting
"文字コードをUFT-8に設定
"set fenc=utf-8
" バックアップファイルを作らない
"set nobackup
" スワップファイルを作らない
set noswapfile
" 編集中のファイルが変更されたら自動で読み直す
set autoread
" バッファが編集中でもその他のファイルを開けるように
"set hidden
" 入力中のコマンドをステータスに表示する
set showcmd


" 見た目系
" 行番号を表示
set number
set relativenumber
" 現在の行を強調表示
set cursorline
" 現在の行を強調表示（縦）
"set cursorcolumn
" 行末の1文字先までカーソルを移動できるように
set virtualedit=onemore
" インデントはスマートインデント
set smartindent
" ビープ音を可視化
"set visualbell
" 括弧入力時の対応する括弧を表示
set showmatch
" ステータスラインを常に表示
set laststatus=2
set noshowmode
" コマンドラインの補完
set wildmode=list:longest
" 折り返し時に表示行単位での移動できるようにする
nnoremap j gj
nnoremap k gk
"簡単に大きく移動
noremap <S-h>   ^
noremap <S-j>   }
noremap <S-k>   {
noremap <S-l>   $
"カーソルの回り込み
set whichwrap=h,l,b,s,[,],<,>,~
" シンタックスハイライトの有効化
syntax enable
" カラースキームの変更
"let g:onedark_hide_endofbuffer=1
"colorscheme onedark
"let g:lightline = {
"  \ 'colorscheme': 'onedark',
"  \ }
"highlight Normal ctermbg=None


" Tab系
" 不可視文字を可視化(タブが「▸-」と表示される)
"set list listchars=tab:\▸\-
set list listchars=space:\·
" Tab文字を半角スペースにする
set expandtab
" 行頭以外のTab文字の表示幅（スペースいくつ分）
set tabstop=4
" 行頭でのTab文字の表示幅
set shiftwidth=4


" 検索系
" 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase
" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase
" 検索文字列入力時に順次対象文字列にヒットさせる
set incsearch
" 検索時に最後まで行ったら最初に戻る
set wrapscan
" 検索語をハイライト表示
"set hlsearch
" ESC連打でハイライト解除
"nnoremap <silent> <Esc><Esc> :nohlsearch<CR><Esc>


" タブ操作系
"邪魔なキーマップを削除
nunmap <C-w><C-d>
nunmap <C-w>d
"C-t で新規タブを開く
"nnoremap <silent> <C-t> :tabnew<CR>
"C-w でタブを閉じる
"nnoremap <silent> <C-w> :bd<CR>
nnoremap <silent> <C-c> :close<CR>
"C-tab と C-l で1つ右のタブを開く
"nnoremap <silent> <C-i> :BufferLineCycleNext<CR>
"nnoremap <silent> <C-l> :BufferLineCycleNext<CR>
nnoremap <silent> <C-i> :tabnext<CR>
nnoremap <silent> <C-l> :tabnext<CR>
"Ctrl-h で1つ左のタブを開く
nnoremap <silent> <C-h> :tabprev<CR>


"ファイル操作系
"上書き保存する
nnoremap <silent> <C-s> :w<CR>
"ファイルを開く
nnoremap <C-o> :tabnew<CR>:e 
"新しいファイル
nnoremap <C-n> :tabnew<CR>

"Neotree
" nnoremap <silent> <C-e> :if &filetype != 'neo-tree' \| exe "Neotree focus" \| else \| wincmd p \| endif<CR>
nnoremap <silent> <C-e> :Neotree toggle<CR>
" autocmd BufEnter * Neotree show


"英和辞書の設定
nnoremap <silent> M :Man<CR>
set keywordprg=ejdic

"Neotreeバグ回避
"if expand('%:p')[-1:] == '/'
"  echo "It is a directory"
"  q
"endif

"fzf
"nnoremap <silent> ff <cmd>Telescope find_files<cr>
nnoremap <silent> ff <cmd>Telescope frecency<cr>
nnoremap <silent> fg <cmd>Telescope live_grep<cr>
nnoremap <silent> fb <cmd>Telescope buffers<cr>
nnoremap <silent> fh <cmd>Telescope help_tags<cr>
nnoremap <silent> fc <cmd>Telescope commands<cr>
nnoremap <silent> / <cmd>Telescope current_buffer_fuzzy_find<cr>

"toggleterm
nnoremap <silent> <C-t> <Cmd>exe v:count1 . "ToggleTerm"<CR>
autocmd TermEnter term://*toggleterm#*
\ tnoremap <silent> <C-t> <Cmd>exe v:count1 . "ToggleTerm"<CR>
autocmd TermEnter term://*toggleterm#*
\ tnoremap <silent> jj <C-\><C-n>
command! ToggleTermStart echo
nnoremap <silent> <C-g> <Cmd>exec "ToggleTermStart" \| exec "lua _lazygit_toggle()" \| command! ToggleTermStart echo<CR>

" バッファ再読み込み
function! s:GetBufByte()
  let byte = line2byte(line('$') + 1)
  if byte == -1
    return 0
  else
    return byte - 1
  endif
endfunction
autocmd VimEnter * nested if @% != '' && s:GetBufByte() != 0 | e %:p | endif
]])
