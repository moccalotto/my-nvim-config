local api = vim.api

api.nvim_create_user_command("Trim", [[%s/\s\+$//e]], {})


-------------------------
-- Cursor Line
-------------------------
local cursorGroup = api.nvim_create_augroup("CursorLine", { clear = true })

api.nvim_create_autocmd(
  { "InsertLeave", "WinEnter" },
  { pattern = "*", command = "set cursorline", group = cursorGroup }
)
api.nvim_create_autocmd(
  { "InsertEnter", "WinLeave" },
  { pattern = "*", command = "set nocursorline", group = cursorGroup }
)
