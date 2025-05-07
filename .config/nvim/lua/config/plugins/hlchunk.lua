require('hlchunk').setup({
  chunk = {
    enable = true,
    style = "#c678dd",
    -- style = "#56b6c2",
  },
  indent = {
    enable = true,
  },
  blank = {
    enable = false, -- なんか動かない
    chars = {
      "․",
    },
    style = {
      { vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID("Whitespace")), "fg", "gui"), "" },
    },
  },
  line_num = {
    enable = false,
    style = "#c678dd",
  },
})

