-- For windows, check this guide: https://github.com/nvim-treesitter/nvim-treesitter/wiki/Windows-support
-- LLVM (clang) via chocolatey seems to work great.
local status, ts = pcall(require, "nvim-treesitter.configs")
if not status then
  print "Damn!. Could not load treesitter"
end


ts.setup {
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = true,
    disable = {},
  },
  ensure_installed = {
    "toml",
    "yaml",
    "json",
    "lua",
    "css",
    "html",
    "javascript",
  }
}
