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
--keymap("n", "ff", "<CMD>Telescope find_files<cr>, silent)
keymap("n", "ff", "<CMD>Telescope frecency<CR>", silent)
keymap("n", "fg", "<CMD>Telescope live_grep<CR>", silent)
keymap("n", "fb", "<CMD>Telescope buffers<CR>", silent)
keymap("n", "fh", "<CMD>Telescope help_tags<CR>", silent)
keymap("n", "fc", "<CMD>Telescope commands<CR>", silent)
keymap("n", "fo", "<CMD>Telescope oldfiles<CR>", silent)
keymap("n", "fk", "<CMD>Telescope keymaps<CR>", silent)
keymap("n", "fm", "<CMD>Telescope man_pages<CR>", silent)
keymap("n", "/", "<CMD>Telescope current_buffer_fuzzy_find<CR>", silent)

--toggleterm
keymap("n", "<C-t>", "<CMD>exe v:count1 . \"ToggleTerm\"<CR>", silent)
keymap("n", "<C-g>", "<CMD>lua require(\"toggleterm.terminal\").Terminal:new({ cmd = \"lazygit\", direction = \"float\", hidden = true }):toggle()<CR>", silent)
