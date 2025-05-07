require("onedarkpro").setup({
  highlights = {
    Comment = { fg = "#5C6370", italic = true },
  },
  styles = {
    comments = "italic",
    functions = "bold",
    variables = "italic",
  },
  options = {
    cursorline = true,
  },
})

vim.cmd("colorscheme onedark")
