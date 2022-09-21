local map = vim.keymap.set;
local unmap = vim.keymap.del;

local hardmode_keys = {
  { { "n", "v", "i" }, "<up>" },
  { { "n", "v", "i" }, "<down>" },
  { { "n", "v", "i" }, "<left>" },
  { { "n", "v", "i" }, "<right>" },
  { { "n", "v", }, "<pageup>" },
  { { "n", "v", }, "<pagedown>" },
  { { "n", "v", }, "h" },
  { { "n", "v", }, "l" },
}

local EasyMode = function()
  for _, entry in ipairs(hardmode_keys) do
    unmap(entry[1], entry[2])
  end
end

local HardMode = function()
  local action = function()
    print "You suck!. Type :ISuckDonkeyBalls to escape"
  end
  for _, entry in ipairs(hardmode_keys) do
    map(entry[1], entry[2], action)
  end
end

vim.api.nvim_create_user_command("ISuckDonkeyBalls", EasyMode, {})
vim.api.nvim_create_user_command("EasyMode", EasyMode, {})
vim.api.nvim_create_user_command("HardMode", HardMode, {})
