local recover_command = "HelpMeBackToEasyMode"

local hardmode_keys = {
  { { "n", "v", "i" }, "<up>" },
  { { "n", "v", "i" }, "<down>" },
  { { "n", "v", "i" }, "<left>" },
  { { "n", "v", "i" }, "<right>" },
  { { "n", "v", }, "<pageup>" },
  { { "n", "v", }, "<pagedown>" },
  { { "n", "v", }, "<home>" },
  { { "n", "v", }, "<end>" },

  { { "n", "v", }, "h" },
  { { "n", "v", }, "l" },
}

local EasyMode = function()
  for _, entry in ipairs(hardmode_keys) do
    pcall(function ()  -- Fail silently if we cannot delete the keymapping
      vim.keymap.del(entry[1], entry[2])
    end)
  end
end

local HardMode = function()
  local action = function()
    print("HardMode enabled. Type :" .. recover_command .. " to escape to n00b mode")
  end
  for _, entry in ipairs(hardmode_keys) do
    vim.keymap.set(entry[1], entry[2], action)
  end
end

local make_command = vim.api.nvim_create_user_command
make_command(recover_command, EasyMode, {})
make_command("EasyMode", EasyMode, {})
make_command("HardMode", HardMode, {})

HardMode()
