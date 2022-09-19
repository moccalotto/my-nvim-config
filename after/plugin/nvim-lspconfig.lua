local ok, lspconfig = pcall(require, "lspconfig")
if not ok then
  print("Damn lspconfig not loaded")
  return
end

lspconfig.pyright.setup({})

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  wk = require "which-key"

  local buf = vim.lsp.buf

  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
  wk.register({
    ["gD"]         = { buf.declaration, "Go to declaration" },
    ["gd"]         = { buf.definition, "Go to definition" },
    ["gT"]         = { buf.type_definition, "Goto type definition", },
    ["gi"]         = { buf.implementation, "Go to implementation" },
    ["ø"]         = { vim.lsp.buf.hover, "Pretend mouse cursor is hovering over word" },
    ["Ø"]         = { vim.lsp.buf.code_action, "Choose an LSP action (i.e. code quickfix) to perform" },
    ["<c-k>"]      = { vim.lsp.buf.signature_help, "Show signature help" },
    ["<leader>f"]  = { buf.formatting, "Code formatting", },
    ["<leader>w"]  = { name = "LSP Workspace Folders" },
    ["<leader>wa"] = { buf.add_workspace_folder, "Add workspace folder" },
    ["<leader>wr"] = { buf.remove_workspace_folder, "Remove workspace folder" },
    ["<leader>wl"] = { buf.list_workspace_folders, "List workspace folders" },
    ["<leader>ws"] = { "<cmd>Telescope lsp_workspace_symbols<cr>", "Search symbols in workspace" },
    ["<leader>rn"] = { buf.rename, "Rename all symbols under cursor" },
    ["<leader>rf"] = { buf.references, "Find all references to the current symbol" },
  }, { buffer = bufnr })
end

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}

lspconfig["pyright"].setup({
  on_attach = on_attach,
  flags = lsp_flags,
})

lspconfig["tsserver"].setup({
  on_attach = on_attach,
  flags = lsp_flags,

})

lspconfig["sumneko_lua"].setup({
  on_attach = function(client, bufnr)
    -- client.resolved_capabilities.document_formatting = false
    -- client.resolved_capabilities.document_range_formatting = false
    on_attach(client, bufnr)
  end,
  flags = lsp_flags,
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = {
          [vim.fn.expand "$VIMRUNTIME/lua"] = true,
          -- [astronvim.install.home .. "/lua"] = true,
          -- [astronvim.install.config .. "/lua"] = true,
        },
      },
    },
  },
})

lspconfig["rust_analyzer"].setup({
  on_attach = on_attach,
  flags = lsp_flags,
  settings = {
    -- Server-specific settings
    ["rust-analyzer"] = {},
  },
})
