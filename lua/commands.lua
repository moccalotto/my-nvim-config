_G.dump = function(...)
  print(vim.inspect(...))
end

local api = vim.api

api.nvim_create_user_command("Trim", [[%s/\s\+$//e]], {})
api.nvim_create_user_command("DumpVim", function() dump(vim) end, {})
