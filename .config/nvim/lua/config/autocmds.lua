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
