-- Indicate first time installation

local packer_bootstrap = false

-- packer.nvim configuration
local conf = {
  profile = {
    enable = true,
    threshold = 1, -- the amount in ms that a plugins load time must be over for it to be included in the profile
  },

  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Check if packer.nvim is installed
-- Run PackerCompile if there are changes in this file
local function packer_init()
  local fn = vim.fn
  local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system {
      "git",
      "clone",
      "--depth",
      "1",
      "https://github.com/wbthomason/packer.nvim",
      install_path,
    }
    vim.cmd [[packadd packer.nvim]]
  end
  vim.cmd "autocmd BufWritePost plugins.lua source <afile> | PackerCompile"
end

-- Plugins
local function plugins(use)
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
  use { 'nvim-telescope/telescope.nvim', tag = '0.1.0', requires = { {'nvim-lua/plenary.nvim'} }, }

  -- Fanzy line for all open tabs and buffers
  use {
    'akinsho/bufferline.nvim', 
    tag = "v2.*", 
    requires = 'kyazdani42/nvim-web-devicons', 
    -- event = "BufWinEnter",
  }

  -- Terminal
  use { "akinsho/toggleterm.nvim" }

  -- File browser
  use {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = { 
      "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    }
  }

  -- consider junegunn/vim-peekaboo - a plugin that shows you what is in your registers in a large side-split

  ------------------------------
  -- COMPLETION
  ------------------------------
  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    'L3MON4D3/LuaSnip', -- snippet engine
    'saadparwaiz1/cmp_luasnip', -- snippet engine adapter
    --      "hrsh7th/cmp-buffer",
    --      "hrsh7th/cmp-calc",
    --      "hrsh7th/cmp-path",
    'nvim-treesitter/nvim-treesitter'
  }


  -----------------------------
  -- Color
  -----------------------------
  use {
    "adisen99/apprentice.nvim",
    requires = { "rktjmp/lush.nvim" }
  }

  -- Bootstrap Neovim
  if packer_bootstrap then
    require("packer").sync()
  end
end

packer_init()

local packer = require "packer"
packer.init(conf)
packer.startup(plugins)
