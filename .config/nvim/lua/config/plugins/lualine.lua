vim.opt.laststatus = 3

require("lualine").setup {
  options = {
    section_separators = { left = '', right = '' },
    component_separators = { left = '', right = '' },
    refresh = {
      statusline = 33,
      tabline = 33,
      winbar = 33,
    },
  },
  sections = {
   lualine_b = {
      {
        "branch",
        icon = '',
      },
      {
        "diff",
        symbols = { added = " ", modified = " ", removed = " " },
      },
      {
        "diagnostics",
      },
    },
    lualine_c = {
      {
        "filename",
        path = 4,
        symbols = {
          modified = " ",
          readonly = "󰏯 ",
          new = " ",
        },
      },
    },
  },
}
