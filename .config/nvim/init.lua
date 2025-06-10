-- Vimの時の設定
-- require('config.vim')
require('config.options')
require('config.keymaps')
require('config.autocmds')

-- プラグイン設定
require('config.lazy')

vim.opt.encoding = 'utf-8'
vim.scriptencoding = 'utf-8'
