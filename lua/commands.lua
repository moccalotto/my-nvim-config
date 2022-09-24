local krh = require("krh")
local cmd = vim.api.nvim_create_user_command

cmd("Trim", krh.trim, {})
cmd("DumpVim", krh.dump, {})
