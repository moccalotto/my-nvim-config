local api = vim.api
local fn = vim.fn
local cmd = vim.api.nvim_create_autocmd
local group = vim.api.nvim_create_augroup

cmd(
  { "BufWritePost" },
  {
    pattern = { "*" },
    group = group("NotifySaved", { clear = true }),
    callback = function()
      local dir = fn.expand('<afile>')
      vim.notify(dir, "info", { title = "Buffer saved", })
    end
  }
)

---------------------------
-- BEFORE SAVE
--
-- trim files
-- ensure parent dirs exist
---------------------------
cmd(
  { "BufWritePre" },
  {
    pattern = { "*" },
    group = group("MkDir", { clear = true }),
    callback = function()
      local krh = require("krh")
      krh.mk_parent_dirs()
      krh.trim()
    end,
  }
)


-- cmd(
--   { "BufAdd", --[[ "BufNewFile",  ]]"VimEnter" },
--   {
--     pattern = { "*" },
--     group = group("AlwaysOpenInTabs", { clear = true }),
--     nested = true,
--     callback = function()
--       vim.cmd [[tab sball]]
--     end,
--   }
-- )

-------------------------
-- Cursor Line
-------------------------
local cursorGroup = api.nvim_create_augroup("CursorLine", { clear = true })

api.nvim_create_autocmd(
  { "InsertLeave", "WinEnter", "BufEnter"},
  { pattern = "*", command = "set nocursorline", group = cursorGroup }
)
api.nvim_create_autocmd(
  { "InsertEnter", "WinLeave" },
  { pattern = "*", command = "set cursorline", group = cursorGroup }
)
