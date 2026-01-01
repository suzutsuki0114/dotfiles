local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

vim.cmd([[
" ウィンドウの透明度
augroup transparent-windows
  autocmd!
  " autocmd FileType * set winblend=10
  autocmd FileType lazy set winblend=10
  autocmd FileType mason set winblend=10
  autocmd FileType noice set winblend=10
augroup END


" Neotree
 " autocmd BufEnter * Neotree show


" toggleterm
autocmd TermEnter term://*toggleterm#*
\ tnoremap <silent> <C-t> <Cmd>exe v:count1 . "ToggleTerm"<CR>
" autocmd TermEnter term://*toggleterm#*
autocmd TermEnter *
\ tnoremap <silent> jj <C-\><C-n>
autocmd TermEnter term://*lazygit*
\ tunmap jj
autocmd TermEnter term://*lazydocker*
\ tunmap jj

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

vim.api.nvim_create_autocmd('QuitPre', {
  callback = function()
    -- 現在のウィンドウ番号を取得
    local current_win = vim.api.nvim_get_current_win()
    -- すべてのウィンドウをループして調べる
    for _, win in ipairs(vim.api.nvim_list_wins()) do
      -- カレント以外を調査
      if win ~= current_win then
        local buf = vim.api.nvim_win_get_buf(win)
        -- buftypeが空文字（通常のバッファ）があればループ終了
        if vim.bo[buf].buftype == '' then
          return
        end
      end
    end
    -- ここまで来たらカレント以外がすべて特殊ウィンドウということなので
    -- カレント以外をすべて閉じる
    vim.cmd.only({ bang = true })
    -- この後、ウィンドウ1つの状態でquitが実行されるので、Vimが終了する
  end,
  desc = 'Close all special buffers and quit Neovim',
})
