local ok, bufferline = pcall(require, "bufferline")
if not ok then
  return
end

bufferline.setup({
  options = {
    numbers = "none",
    diagnostics = "nvim_lsp",
  },
})
