local ok, wk = pcall(require, "which-key")
if not ok then
  print("Danm! could not load which-key")
  return
end

wk.setup({
  -- your configuration comes here
  -- or leave it empty to use the default settings
  -- refer to the configuration section below
  marks = true,
  registers = true,
})

vim.wk = wk
