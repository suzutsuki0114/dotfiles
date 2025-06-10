local silent = { noremap = true, silent = true }
local noremap = { noremap = true }

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- vim.keymap.set("n", "<C-w><C-d>", "<Nop>")
vim.keymap.set("i", "jj", "<Esc>", silent)

-- 折り返し時に表示行単位での移動できるようにする
vim.keymap.set("n", "j", "gj", noremap)
vim.keymap.set("n", "k", "gk", noremap)
--簡単に大きく移動
vim.keymap.set("n", "<S-h>", "^", noremap)
-- vim.keymap.set("n", "<S-j>", "}", noremap)
-- vim.keymap.set("n", "<S-k>", "{", noremap)
vim.keymap.set("n", "<S-l>", "$", noremap)


-- ESC連打でハイライト解除
-- vim.keymap.set("n", "<Esc><Esc>", "<CMD>nohlsearch<CR><ESC>", silent)


-- タブ操作系
--C-t で新規タブを開く
--vim.keymap.set("n", "<C-t>", "<CMD>tabnew<CR>", silent)
--C-w でタブを閉じる
--vim.keymap.set("n", "<C-w>", "<CMD>bd<CR>", silnet)
vim.keymap.set("n", "<C-c>", "<CMD>close<CR>", silent)
--C-tab と C-l で1つ右のタブを開く
--vim.keymap.set("n", "<C-i>", "<CMD>BufferLineCycleNext<CR>", silent)
--vim.keymap.set("n", "<C-l>", "<CMD>BufferLineCycleNext<CR>", silent)
vim.keymap.set("n", "<C-i>", "<CMD>tabnext<CR>", silent)
vim.keymap.set("n", "<C-l>", "<CMD>tabnext<CR>", silent)
--Ctrl-h で1つ左のタブを開く
vim.keymap.set("n", "<C-h>", "<CMD>tabprev<CR>", silent)
--バッファ切り替え
vim.keymap.set("n", "<C-j>", "<CMD>bprevious<CR>", silent)
vim.keymap.set("n", "<C-k>", "<CMD>bnext<CR>", silent)


--ファイル操作系
--上書き保存する
vim.keymap.set("n", "<C-s>", "<CMD>w<CR>", silent)
--ファイルを開く
vim.keymap.set("n", "<C-o>", "<CMD>tabnew<CR><CMD>e ", silent)
--新しいファイル
vim.keymap.set("n", "<C-n>", "<CMD>tabnew<CR>", silent)

--Neotree
-- vim.keymap.set("n", "<C-e>", "<CMD>if &filetype != 'neo-tree' \| exe "Neotree focus" \| else \| wincmd p \| endif<CR>", silent)
vim.keymap.set("n", "<C-e>", "<CMD>Neotree toggle<CR>", silent)


--英和辞書の設定
vim.keymap.set("n", "M", "<CMD>Man<CR>", silent)

--fzf
--vim.keymap.set("n", "ff", "<cmd>Telescope find_files<cr>, silent)
vim.keymap.set("n", "ff", "<cmd>Telescope frecency<cr>", silent)
vim.keymap.set("n", "fg", "<cmd>Telescope live_grep<cr>", silent)
vim.keymap.set("n", "fb", "<cmd>Telescope buffers<cr>", silent)
vim.keymap.set("n", "fh", "<cmd>Telescope help_tags<cr>", silent)
vim.keymap.set("n", "fc", "<cmd>Telescope commands<cr>", silent)
vim.keymap.set("n", "fo", "<cmd>Telescope oldfiles<cr>", silent)
vim.keymap.set("n", "fk", "<cmd>Telescope keymaps<cr>", silent)
vim.keymap.set("n", "fm", "<cmd>Telescope man_pages<cr>", silent)
vim.keymap.set("n", "/", "<cmd>Telescope current_buffer_fuzzy_find<cr>", silent)

--toggleterm
vim.keymap.set("n", "<C-t>", "<Cmd>exe v:count1 . \"ToggleTerm\"<CR>", silent)
vim.keymap.set("n", "<C-g>", "<Cmd>exec \"ToggleTermStart\" | exec \"lua _lazygit_toggle()\" | command! ToggleTermStart echo<CR>", silent)
