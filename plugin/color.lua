vim.o.background = "dark" -- or "light" for light mode

-- Load and setup function to choose plugin and language highlights
require('lush')(require('apprentice').setup({
  plugins = {
    "buftabline",
    "coc",
    "cmp", -- nvim-cmp
    "fzf",
    "gitgutter",
    "gitsigns",
    "lsp",
    "lspsaga",
    "nerdtree",
    "netrw",
    "nvimtree",
    "neogit",
    "packer",
    "signify",
    "startify",
    "syntastic",
    "telescope",
    "treesitter"
  },
  langs = {
    "c",
    "clojure",
    "coffeescript",
    "csharp",
    "css",
    "elixir",
    "golang",
    "haskell",
    "html",
    "java",
    "js",
    "json",
    "jsx",
    "lua",
    "markdown",
    "moonscript",
    "objc",
    "ocaml",
    "purescript",
    "python",
    "ruby",
    "rust",
    "scala",
    "typescript",
    "viml",
    "xml"
  }
}))

vim.cmd("set background=dark ")
vim.cmd("colorscheme apprentice")

-- vim.cmd([[
-- " Highlight characters of lines over 120 characters.
-- autocmd BufEnter * match OverLength /\%121v/
-- highlight link OverLength Error
--
-- " force background to be unifrm dark, both inside
-- " and »after the end of« the current document.
-- highlight Normal ctermbg=NONE guibg=NONE
-- highlight NonText ctermbg=NONE guibg=NONE
-- ]])
