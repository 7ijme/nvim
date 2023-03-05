-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.1',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim', 'nvim-telescope/telescope-project.nvim', 'nvim-telescope/telescope-file-browser.nvim'} }
  }

  use('tyrannicaltoucan/vim-deep-space')
  use('joshdick/onedark.vim')

 --  use({
--	  'rose-pine/neovim',
--	  as = 'rose-pine',
--	  config = function()
--		  require("rose-pine").setup()
--		  vim.cmd('colorscheme rose-pine')
--	  end
  --})

  use ('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  use ('nvim-treesitter/playground' )
  use ('theprimeagen/harpoon' )
  use ('mbbill/undotree')
  use ('tpope/vim-fugitive')
  use  'mhinz/vim-signify'
  use {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v1.x',
  requires = {
    -- LSP Support
    {'neovim/nvim-lspconfig'},             -- Required
    {'williamboman/mason.nvim'},           -- Optional
    {'williamboman/mason-lspconfig.nvim'}, -- Optional

    -- Autocompletion
    {'hrsh7th/nvim-cmp'},         -- Required
    {'hrsh7th/cmp-nvim-lsp'},     -- Required
    {'hrsh7th/cmp-buffer'},       -- Optional
    {'hrsh7th/cmp-path'},         -- Optional
    {'saadparwaiz1/cmp_luasnip'}, -- Optional
    {'hrsh7th/cmp-nvim-lua'},     -- Optional

    -- Snippets
    {'L3MON4D3/LuaSnip'},             -- Required
    {'rafamadriz/friendly-snippets'}, -- Optional
  }
}

use 'mfussenegger/nvim-dap'
use({
  "mfussenegger/nvim-jdtls",
  module = "jdtls",
  ft = "java" ,
})

--use 'prettier/vim-prettier'
use 'sbdchd/neoformat'

use 'neoclide/npm.nvim'

use 'Shougo/denite.nvim'

use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
})

use 'gko/vim-coloresque'

use {
  'gelguy/wilder.nvim',
  config = function()
    -- config goes here
  end,
}

use 'nvim-tree/nvim-web-devicons'

use 'romgrk/fzy-lua-native'

use 'prichrd/netrw.nvim'

use 'nvim-lualine/lualine.nvim'

--use "Pocco81/auto-save.nvim"

use {
  "folke/trouble.nvim",
  requires = "nvim-tree/nvim-web-devicons",
  config = function()
    require("trouble").setup {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  end
}

use {'romgrk/barbar.nvim', requires = 'nvim-web-devicons'}

use 'wakatime/vim-wakatime'

use 'Raimondi/delimitMate'

use({ "wesleimp/stylua.nvim" })

end)
