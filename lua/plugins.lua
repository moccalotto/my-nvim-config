local status, packer = pcall(require, "packer")
if (not status) then
  print("Packer is not installed. Run git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim")
  return
end

-- Only required if you have packer configured as `opt`
-- vim.cmd [[packadd packer.nvim]]

-- Indicate first time installation

-- Plugins
packer.startup(function(use)
  use { "wbthomason/packer.nvim" }

  -- [dependency]
  -- Also a lazy loader or something
  use { "nvim-lua/plenary.nvim", module = "plenary" }

  -- [dependency]
  -- Better icons
  use { "kyazdani42/nvim-web-devicons", module = "nvim-web-devicons", }

  -- Fast comment/uncomment keyboard shorts
  use { "numToStr/Comment.nvim" }

  -- Searh-window for files, words, tags, help, etc.
  use { 'nvim-telescope/telescope.nvim' }

  -- Fanzy line for all open tabs and buffers
  use { 'akinsho/bufferline.nvim' }

  -- Terminal
  use { "akinsho/toggleterm.nvim" }

  use {
    'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  }

  -- consider junegunn/vim-peekaboo - a plugin that shows you what is in your registers in a large side-split
  use "junegunn/vim-peekaboo"

  use "bluz71/vim-moonfly-colors"

  ------------------------------
  -- COMPLETION
  ------------------------------
  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-calc",
    'L3MON4D3/LuaSnip', -- snippet engine
    'saadparwaiz1/cmp_luasnip', -- snippet engine adapter
    --      "hrsh7th/cmp-buffer",
    --      "hrsh7th/cmp-path",
  }
end)
