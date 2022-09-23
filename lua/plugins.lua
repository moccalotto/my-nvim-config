local status, packer = pcall(require, "packer")
if (not status) then
  print("Packer is not installed. Run git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim")
  return
end

local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local should_sync = ensure_packer()

-- Plugins
packer.startup(function(use)
  use { "wbthomason/packer.nvim" }

  use {
    ------------------------------
    -- MISCELLANEOUS
    ------------------------------
    "nvim-lua/plenary.nvim",                   -- [dependency] Also a lazy loader or something
    "kyazdani42/nvim-web-devicons",            -- [dependency] Better icons
    "numToStr/Comment.nvim",                   -- Fast comment/uncomment keyboard shorts
    'nvim-telescope/telescope.nvim',           -- Searh-window for files, words, tags, help, etc.
    'nvim-telescope/telescope-ui-select.nvim', -- Replace nvims "choice/select" UI with telescope selector.
    'akinsho/bufferline.nvim',                 -- Fanzy line for all open tabs and buffers
    "akinsho/toggleterm.nvim",                 -- In-window terminal
    "folke/which-key.nvim",                    -- Keyboard help
    "junegunn/vim-peekaboo",                   -- Show what's in your registers
    'nvim-treesitter/nvim-treesitter',         -- IMPORTANT!: Run :TSUpdateSync after install
    "rcarriga/nvim-notify",                    -- Notification popup

    ------------------------------
    -- COMPLETION
    ------------------------------
    "williamboman/mason.nvim",              -- Insaller for linters, stylers, TS, etc.
    "williamboman/mason-lspconfig.nvim",    -- Installer for LSP servers
    "neovim/nvim-lspconfig",                -- Config library for most LSP servers
    "hrsh7th/nvim-cmp",                     -- Completion engine (popup window when typing text)
    "hrsh7th/cmp-nvim-lsp",                 -- Bridge: cmp <-> lsp
    "hrsh7th/cmp-calc",                     -- Do math when typing numbers (e.g. 77*23 = 1771)
    "hrsh7th/cmp-nvim-lsp-signature-help",  -- mehod call arg help
    'L3MON4D3/LuaSnip',                     -- Snippet engine
    'saadparwaiz1/cmp_luasnip',             -- Bridge: cmp <-> luasnip
    --      "hrsh7th/cmp-buffer",
    --      "hrsh7th/cmp-path",
    "jose-elias-alvarez/null-ls.nvim",      -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua

    ------------------------
    -- COLORS
    ------------------------
    "rktjmp/lush.nvim",
    "metalelf0/jellybeans-nvim",
    -- "bluz71/vim-moonfly-colors",
    -- "kabouzeid/nvim-jellybeans",
  }

  if should_sync then
    packer.sync()
  end
end)
