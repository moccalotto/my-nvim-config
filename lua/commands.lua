_G.dump = function(...)
  print(vim.inspect(...))
end

local api = vim.api
local lsp = vim.lsp

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

--[[
    vim.api.nvim_create_autocmd('LspAttach', {
      callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client.server_capabilities.hoverProvider then
          vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = args.buf })
        end
      end,
    })
]]
