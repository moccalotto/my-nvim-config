local map = vim.keymap.set
vim.g.mapleader = " " -- space
vim.g.maplocalleader = ","

-----------------------------
-- command line shortcut
-----------------------------
-- must be mapped this way to work smoothly
map("n", ",", ":")

local ok, wk = pcall(require, "which-key")
if not ok then return end

-----------------------------
-- Which-Key Keymappings
-----------------------------
wk.register({
  ["å"]          = { "<cmd>Telescope find_files<cr>", "Find siles by name" },
  ["Å"]          = { "<cmd>Telescope grep_string<cr>", "Find files by content" },
  ["-"]           = { "<cmd>Telescope buffers<cr>", "Search open buffers" },
  ["<c-s>"]       = { "<cmd>wa<cr>", "Save file" },
  ["_"]           = { "<cmd>ToggleTerm<cr>", "Open a terminal in a floeating window" },
  ["<backspace>"] = { "vbd", "Delete word backwards" },
  ["<c-a>"]       = { "ggVG", "Select all" },
  ["<leader>h"]   = { "<cmd>Telescope help_tags<cr>", "Find help tags" },
  ["<leader>t"]   = { "<cmd>Trim<cr>", "Trim trailing whitespace from file" },
  ["<leader>e"]   = { "<cmd>20Vexplore<cr>", "Open File Browser" },
  ["<leader>q"]   = { "<cmd>bd<cr>", "Close buffer" },
  ["<leader>Q"]   = { "<cmd>bd!<cr>", "Close buffer without saving" },
  ["<leader>zz"]   = { "<cmd>qa!<cr>", "Close vim without saving!" },


  ---------------------------------------
  -- Tab / Buffer navigation
  ---------------------------------------
  ["<c-PageUp>"]   = { "<cmd>BufferLineCyclePrev<cr>", "Next tab/buffer" },
  ["gt"]           = { "<cmd>BufferLineCycleNext<cr>", "Next tab/buffer" },
  ["<c-PageDown>"] = { "<cmd>BufferLineCycleNext<cr>", "Previous tab/buffer" },
  ["gT"]           = { "<cmd>BufferLineCyclePrev<cr>", "Previous tab/buffer" },
})

wk.register({
  ["´´"] = { "<esc>", "Remap" },
}, { mode = "i" }
)
