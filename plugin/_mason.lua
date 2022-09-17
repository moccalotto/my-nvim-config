local ok, mason = pcall(require, "mason")
if ok then
  mason.setup()
end

local ok, mlp = pcall(require, "mason-lspconfig")
if not ok then
  mlp.setup()
end


