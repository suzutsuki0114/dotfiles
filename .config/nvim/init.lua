-- Vimの時の設定
require('config.vim')

-- プラグイン設定
require('config.lazy')

require('config.keymap')
vim.opt.encoding = 'utf-8'
vim.scriptencoding = 'utf-8'

-- バッファ再読み込み
vim.cmd([[
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
