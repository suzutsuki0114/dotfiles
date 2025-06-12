local opt = vim.opt

-- 文字コードをUTF-8に設定
-- opt.fenc = "utf-8"
opt.encoding = 'utf-8'
vim.scriptencoding = 'utf-8'
--  バックアップファイルを作らない
-- opt.backup = false
--  スワップファイルを作らない
opt.swapfile = false
--  編集中のファイルが変更されたら自動で読み直す
opt.autoread = true
--  バッファが編集中でもその他のファイルを開けるように
-- opt.hidden = true
--  入力中のコマンドをステータスに表示する
opt.showcmd = true
--  クリップボード共有
-- opt.clipboard:append({unnamedplus = true})
-- マウス操作を有効化
opt.mousemoveevent = true


--  見た目系
--  行番号を表示
opt.number = true
opt.relativenumber = true
--  現在の行を強調表示
opt.cursorline = true
--  現在の行を強調表示（縦）
-- opt.cursorcolumn = true
--  行末の1文字先までカーソルを移動できるように
opt.virtualedit = "onemore"
--  インデントはスマートインデント
opt.smartindent = true
--  ビープ音を可視化
-- opt.visualbell = true
--  括弧入力時の対応する括弧を表示
opt.showmatch = true
--  ステータスラインを常に表示
opt.laststatus = 2
opt.showmode = false
--  コマンドラインの補完
opt.wildmode = "list:longest"
-- カーソルの回り込み
opt.whichwrap = "hlbs[]<>~"
--  シンタックスハイライトの有効化
opt.syntax = "on"
--  ターミナルでも True Color を使えるようにする。
opt.termguicolors = true
--  補完の透明度
opt.pumblend = 10

--  Tab系
--  不可視文字を可視化(タブが「▸-」と表示される)
opt.list = true
-- opt.listchars = "tab:▸-"
opt.listchars = "space:·"
-- vim.cmd([[set list listchars=space:\·]])
--  Tab文字を半角スペースにする
opt.expandtab = true
--  行頭以外のTab文字の表示幅（スペースいくつ分）
opt.tabstop = 4
--  行頭でのTab文字の表示幅
opt.shiftwidth = 4


--  検索系
--  検索文字列が小文字の場合は大文字小文字を区別なく検索する
opt.ignorecase = true
--  検索文字列に大文字が含まれている場合は区別して検索する
opt.smartcase = true
--  検索文字列入力時に順次対象文字列にヒットさせる
opt.incsearch = true
--  検索時に最後まで行ったら最初に戻る
opt.wrapscan = true
--  検索語をハイライト表示
opt.hlsearch = false


-- 英和辞書の設定
opt.keywordprg = "ejdic"
