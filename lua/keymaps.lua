local map = vim.keymap.set

vim.g.mapleader = " " -- space
vim.g.maplocalleader = ","

-- Find files
map("n", "å", function() require("telescope.builtin").find_files() end)

-- Grep
map("n", "Å", function() require("telescope.builtin").grep_string() end)

-- Search help docs
map("n", "<leader>ht", function() require("telescope.builtin").help_tags() end)

-- Search open buffers
map("n", "-", function() require("telescope.builtin").buffers() end)

-- Find all symbols IN THE ENTIRE WORKSPACE
map( "n", "<leader>ws",  function() require("telescope.builtin").lsp_workspace_symbols() end)

-- Open files
map("n", "<c-o>", ":tabedit ")
map("i", "<c-o>", "<esc>:tabedit ")

-- Save ALL files
map("n", "<c-s>", "<cmd>wa<cr>")

-- Save ALL files
map("n", "<c-s>", "<cmd>wa<cr>")

-- Cycle tabs
map("n", "gT", "<cmd>BufferLineCyclePrev<cr>")    -- override internal gt
map("n", "gt", "<cmd>BufferLineCycleNext<cr>")    -- override internal gT
map("n", "<c-PageUp>", "<cmd>BufferLineCyclePrev<cr>")
map("n", "<c-PageDown>", "<cmd>BufferLineCycleNext<cr>")

-- Toggle Terminal
map("n", "_", "<cmd>ToggleTerm<cr>")

-- Delete entire word with backspace
map("n", "<backspace>", "vbd") 

-- Select All
map("n", "<c-a>", "gg<s-v>G")

-- LSP Actions
map("n", "ø", vim.lsp.buf.hover)
map("n", "Ø", vim.lsp.buf.code_action)

map("n", ",", ":")

-- vim.lsp.buf.add_workspace_folder
