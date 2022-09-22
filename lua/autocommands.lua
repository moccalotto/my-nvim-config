local api = vim.api
local fn = vim.fn


---------------------------
-- CREATE DIRECTORIES
-- when saving files
---------------------------
vim.api.nvim_create_autocmd(
  { "BufWritePre" },
  {
    pattern = { "*" },
    group = api.nvim_create_augroup("MkDir", { clear = true }),
    callback = function()
      local dir = fn.expand('<afile>:p:h')

      -- This handles URLs using netrw. See ':help netrw-transparent' for details.
      if dir:find('%l+://') == 1 then
        return
      end

      if fn.isdirectory(dir) == 0 then
        fn.mkdir(dir, 'p')
      end
    end
  }
)

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
