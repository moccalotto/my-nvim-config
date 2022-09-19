local ok, mason, mlp
ok, mason = pcall(require, "mason")
if not ok then
  print "Damn. Canot load mason"
end

ok, mlp = pcall(require, "mason-lspconfig")
if not ok then
  print "Damn. Cannot load mason-lspconfig"
end

mlp.setup()
mason.setup()
