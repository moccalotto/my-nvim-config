local ok, bufferline = pcall(require, "bufferline")
if not ok then
  print "SHIT! could not load bufferlne"
  return
end

bufferline.setup({
  options = {
    numbers = "none",
    diagnostics = "nvim_lsp",
  },
})
