local keymap = vim.keymap.set
local silent = { noremap = true, silent = true }
local noremap = { noremap = true }

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- keymap("n", "<C-w><C-d>", "<Nop>")
keymap("i", "jj", "<Esc>", silent)

-- 折り返し時に表示行単位での移動できるようにする
keymap("n", "j", "gj", noremap)
keymap("n", "k", "gk", noremap)
--簡単に大きく移動
keymap("n", "<S-h>", "^", noremap)
-- keymap("n", "<S-j>", "}", noremap)
-- keymap("n", "<S-k>", "{", noremap)
keymap("n", "<S-l>", "$", noremap)


-- ESC連打でハイライト解除
-- keymap("n", "<Esc><Esc>", "<CMD>nohlsearch<CR><ESC>", silent)


-- タブ操作系
--C-t で新規タブを開く
--keymap("n", "<C-t>", "<CMD>tabnew<CR>", silent)
--C-w でタブを閉じる
--keymap("n", "<C-w>", "<CMD>bd<CR>", silnet)
keymap("n", "<C-c>", "<CMD>close<CR>", silent)
--C-tab と C-l で1つ右のタブを開く
--keymap("n", "<C-i>", "<CMD>BufferLineCycleNext<CR>", silent)
--keymap("n", "<C-l>", "<CMD>BufferLineCycleNext<CR>", silent)
keymap("n", "<Tab>", "<CMD>tabnext<CR>", silent)
keymap("n", "<S-Tab>", "<CMD>tabprev<CR>", silent)

keymap("n", "<C-l>", "<CMD>tabnext<CR>", silent)
--Ctrl-h で1つ左のタブを開く
keymap("n", "<C-h>", "<CMD>tabprev<CR>", silent)
--バッファ切り替え
keymap("n", "<C-j>", "<CMD>bprevious<CR>", silent)
keymap("n", "<C-k>", "<CMD>bnext<CR>", silent)


--ファイル操作系
--上書き保存する
keymap("n", "<C-s>", "<CMD>w<CR>", silent)
--ファイルを開く
keymap("n", "<C-o>", "<CMD>tabnew<CR><CMD>e ", silent)
--新しいファイル
keymap("n", "<C-n>", "<CMD>tabnew<CR>", silent)

--Neotree
-- keymap("n", "<C-e>", "<CMD>if &filetype != 'neo-tree' \| exe "Neotree focus" \| else \| wincmd p \| endif<CR>", silent)
keymap("n", "<C-e>", "<CMD>Neotree toggle<CR>", silent)


--英和辞書の設定
keymap("n", "M", "<CMD>Man<CR>", silent)

--fzf
--keymap("n", "ff", "<cmd>Telescope find_files<cr>, silent)
keymap("n", "ff", "<cmd>Telescope frecency<cr>", silent)
keymap("n", "fg", "<cmd>Telescope live_grep<cr>", silent)
keymap("n", "fb", "<cmd>Telescope buffers<cr>", silent)
keymap("n", "fh", "<cmd>Telescope help_tags<cr>", silent)
keymap("n", "fc", "<cmd>Telescope commands<cr>", silent)
keymap("n", "fo", "<cmd>Telescope oldfiles<cr>", silent)
keymap("n", "fk", "<cmd>Telescope keymaps<cr>", silent)
keymap("n", "fm", "<cmd>Telescope man_pages<cr>", silent)
keymap("n", "/", "<cmd>Telescope current_buffer_fuzzy_find<cr>", silent)

--toggleterm
keymap("n", "<C-t>", "<Cmd>exe v:count1 . \"ToggleTerm\"<CR>", silent)
keymap("n", "<C-g>", "<Cmd>exec \"ToggleTermStart\" | exec \"lua _lazygit_toggle()\" | command! ToggleTermStart echo<CR>", silent)
