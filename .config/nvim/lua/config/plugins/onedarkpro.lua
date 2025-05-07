require("onedarkpro").setup({
  highlights = {
    Comment = { italic = true },
    Directory = { bold = true },
    ErrorMsg = { italic = true, bold = true }
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
