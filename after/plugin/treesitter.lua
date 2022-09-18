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
