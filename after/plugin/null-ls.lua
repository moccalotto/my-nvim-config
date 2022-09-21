local ok, nuls = pcall(require, "null-ls")
if not ok then
  print "Damn! Null-ls not loaded"
  return
end

nuls.setup({
  sources = {
    nuls.builtins.formatting.stylua,
    -- nuls.builtins.completion.spell,
  },
})
