-----------------------------
-- KEYMAPS
-----------------------------

vim.g.mapleader = " " -- space
vim.g.maplocalleader = ","

-----------------------------
-- command line shortcut
-----------------------------
-- must be mapped this way to work smoothly
vim.keymap.set("n", ",", ":")

local ok, wk = pcall(require, "which-key")
if not ok then return end

local hover_func = function()
  local winid = require('ufo').peekFoldedLinesUnderCursor()
  if not winid then
    -- choose one of them
    -- nvimlsp
    vim.lsp.buf.hover()
  end
end

-----------------------------
-- Which-Key Keymappings
-----------------------------
wk.register({
  -----------------------------
  -- Misc
  -----------------------------
  ["å"]           = { "<cmd>Telescope find_files<cr>", "Find siles by name" },
  ["Å"]           = { "<cmd>Telescope grep_string<cr>", "Find files by content" },
  ["-"]           = { "<cmd>Telescope buffers<cr>", "Search open buffers" },
  ["_"]           = { "<cmd>ToggleTerm<cr>", "Open a terminal in a floeating window" },
  ["<backspace>"] = { "vbd", "Delete word backwards" },
  ["<leader>a"]   = { "ggVG", "Select all" },
  ["<leader>h"]   = { "<cmd>Telescope help_tags<cr>", "Find help tags" },
  ["<leader>t"]   = { "<cmd>Trim<cr>", "Trim trailing whitespace from file" },
  ["<leader>e"]   = { "<cmd>20Vexplore<cr>", "Open file browser" },
  ["<leader>q"]   = { "<cmd>confirm bd<cr>", "Close buffer" },
  ["<leader>Q"]   = { "<cmd>bd!<cr>", "Close buffer without saving" },
  ["<leader>Z"]   = { "<cmd>qa!<cr>", "Close vim without saving!" },
  ["<leader>w"]   = { "<cmd>update<cr>", "Save current buffer" },

  ---------------------------------------
  -- Tab / Buffer navigation
  ---------------------------------------
  ["<c-PageUp>"]   = { "<cmd>BufferLineCyclePrev<cr>", "Next tab/buffer" },
  ["gt"]           = { "<cmd>BufferLineCycleNext<cr>", "Next tab/buffer" },
  ["<c-PageDown>"] = { "<cmd>BufferLineCycleNext<cr>", "Previous tab/buffer" },
  ["gT"]           = { "<cmd>BufferLineCyclePrev<cr>", "Previous tab/buffer" },
  -- ["<c-PageUp>"]   = { "gt", "Next tab/buffer" },
  -- ["gt"]           = { "gt", "Next tab/buffer" },
  -- ["<c-PageDown>"] = { "gT", "Previous tab/buffer" },
  -- ["gT"]           = { "gT", "Previous tab/buffer" },

  ---------------------------------------
  -- VIM HARD MODE
  ---------------------------------------
  ["<leader>m"]  = { name = "VIM Hardcore Mode" },
  ["<leader>me"] = { "<cmd>EasyMode<cr>", "Enable Easy Mode. Allow all vim keys" },
  ["<leader>mh"] = { "<cmd>HardMode<cr>", "Enable Hard Mode. Focus on vim awesomeness'" },

  ---------------------------------------
  -- LSP Code Completion / navigation
  ---------------------------------------
  ["<leader>g"]  = { name = "Code navigation" },
  ["<leader>gc"] = { vim.lsp.buf.declaration, "Go to declaration" },
  ["<leader>gd"] = { vim.lsp.buf.definition, "Go to definition" },
  ["<leader>gt"] = { vim.lsp.buf.type_definition, "Goto type definition", },
  ["<leader>gi"] = { vim.lsp.buf.implementation, "Go to implementation" },
  ["<leader>gr"] = { vim.lsp.buf.references, "Find all references to the current symbol" },
  ["ø"]          = { hover_func, "Pretend mouse cursor is hovering over word" },
  ["Ø"]          = { vim.lsp.buf.code_action, "Choose an LSP action (i.e. code quickfix) to perform" },
  ["<c-k>"]      = { vim.lsp.buf.signature_help, "Show signature help" },
  ["<leader>f"]  = { vim.lsp.buf.formatting, "Code formatting", },
  ["<leader>n"]  = { vim.lsp.buf.rename, "Rename all symbols under cursor" },

  ---------------------------------------
  -- LSP Workspace Folders
  ---------------------------------------
  ["<leader>l"]  = { name = "LSP Workspace Folders" },
  ["<leader>la"] = { vim.lsp.buf.add_workspace_folder, "Add workspace folder" },
  ["<leader>lr"] = { vim.lsp.buf.remove_workspace_folder, "Remove workspace folder" },
  ["<leader>ll"] = { vim.lsp.buf.list_workspace_folders, "List workspace folders" },
  ["<leader>ls"] = { "<cmd>Telescope lsp_workspace_symbols<cr>", "Search symbols in workspace" },
  --
  ---------------------------------------
  -- LSP Workspace Folders
  ---------------------------------------
  ["zR"]         = { require("ufo").openAllFolds, "Open all folds." },
  ["zM"]         = { require("ufo").closeAllFolds, "Close all folds." },
})


wk.register({
  ["´´"] = { "<esc>", "Remap" },
  ["<s-space>"] = { "<esc>", "Remap" },
}, { mode = "i" }
)
