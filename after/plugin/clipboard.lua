---------------------------------
-- system clipboard integration
---------------------------------


-- https://github.com/neovim/neovim/issues/19204
--
-- vim.opt.clipboard:prepend { 'unnamed', 'unnamedplus' }
-- vim.opt.clipboard = "clipboard" -- standard 
-- vim.opt.clipboard = "unnamedplus"

if vim.fn.has("wsl") == 1 then

  vim.g.clipboard = {
      name = "win32yank-wsl",
      copy = {
           ["+"] = "win32yank.exe -i --crlf",
           ["*"] = "win32yank.exe -i --crlf"
      },
      paste = {
          ["+"] = "win32yank.exe -o --lf",
          ["*"] = "win32yank.exe -o --lf"
      },
      cache_enabled = false
  }

end
