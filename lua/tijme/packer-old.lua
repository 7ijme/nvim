-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	-- Searcher
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.1",
		-- or                            , branch = '0.1.x',
		requires = {
			{
				"nvim-lua/plenary.nvim",
				"nvim-telescope/telescope-project.nvim",
				"nvim-telescope/telescope-file-browser.nvim",
				--"nvim-telescope/telescope-ui-select.nvim"
			},
		},
	})

	-- insert & code actions UI (f2)
	use({ "stevearc/dressing.nvim" })

	-- Themes
	use("tyrannicaltoucan/vim-deep-space")
	--use("joshdick/onedark.vim")
	use("navarasu/onedark.nvim")

	--  use({
	--	  'rose-pine/neovim',
	--	  as = 'rose-pine',
	--	  config = function()
	--		  require("rose-pine").setup()
	--		  vim.cmd('colorscheme rose-pine')
	--	  end
	--})

	-- Highlighting
	use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })
	use("nvim-treesitter/nvim-treesitter-context")
	use("nvim-treesitter/playground")

	-- Quick file move
	use("theprimeagen/harpoon")

	-- Project changes
	use("mbbill/undotree")

	-- Git
	use("tpope/vim-fugitive")
	--use("mhinz/vim-signify")
	use("lewis6991/gitsigns.nvim")

	-- LSP
	use({
		"VonHeikemen/lsp-zero.nvim",
		branch = "v1.x",
		requires = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" }, -- Required
			{ "williamboman/mason.nvim" }, -- Optional
			{ "williamboman/mason-lspconfig.nvim" }, -- Optional

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" }, -- Required
			{ "hrsh7th/cmp-nvim-lsp" }, -- Required
			{ "hrsh7th/cmp-buffer" }, -- Optional
			{ "hrsh7th/cmp-path" }, -- Optional
			{ "saadparwaiz1/cmp_luasnip" }, -- Optional
			{ "hrsh7th/cmp-nvim-lua" }, -- Optional

			-- Snippets
			{ "L3MON4D3/LuaSnip" }, -- Required
			{ "rafamadriz/friendly-snippets" }, -- Optional
		},
	})
	use("mfussenegger/nvim-dap")
	use({
		"mfussenegger/nvim-jdtls",
		module = "jdtls",
		ft = "java",
	})

	--use 'prettier/vim-prettier'
	use("sbdchd/neoformat")

	use("neoclide/npm.nvim")

	-- color highlighting
	use("gko/vim-coloresque")

	-- better command highlighting
	use({
		"gelguy/wilder.nvim",
		config = function()
			-- config goes here
		end,
	})

	use("nvim-tree/nvim-web-devicons")

	-- fuzzy finder
	use("romgrk/fzy-lua-native")

	-- better file eplorer
	use("prichrd/netrw.nvim")

	-- better statusline
	use("nvim-lualine/lualine.nvim")

	--use "Pocco81/auto-save.nvim"

	-- error tab
	use({
		"folke/trouble.nvim",
		requires = "nvim-tree/nvim-web-devicons",
		config = function()
			require("trouble").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
	})

	-- better bufferline
	use({ "romgrk/barbar.nvim", requires = "nvim-web-devicons" })

	-- show how long i have been coding
	use("wakatime/vim-wakatime")

	-- auto close brackets
	--use("Raimondi/delimitMate")
	--use("jiangmiao/auto-pairs")
	--use("rstacruz/vim-closer")
	--use("LunarWatcher/auto-pairs")
	use("cohama/lexima.vim")

	-- formatter
	use({ "wesleimp/stylua.nvim" })

	-- better commenting
	use({
		"folke/todo-comments.nvim",
		requires = "nvim-lua/plenary.nvim",
		config = function()
			require("todo-comments").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
	})

	-- search (f) highlighting
	use("unblevable/quick-scope")

	-- signatures (for lsp)
	use("ray-x/lsp_signature.nvim")

	-- comment shortcuts
	use({
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	})

	-- yeah useless fun bullshit
	use("eandrju/cellular-automaton.nvim")

	use("github/copilot.vim")

	use({
		"folke/zen-mode.nvim",
		config = function()
			require("zen-mode").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
	})

	-- refactoring
	use({
		"ThePrimeagen/refactoring.nvim",
		requires = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-treesitter/nvim-treesitter" },
		},
	})

	-- file utils
	use("kovetskiy/neovim-move")

	use("nvim-telescope/telescope-media-files.nvim")
	use("nvim-lua/popup.nvim")

	--[[ use({
		"folke/noice.nvim",
		config = function()
			require("noice").setup({
				-- add any options here
			})
		end,
		requires = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			-- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
			"rcarriga/nvim-notify",
		},
	}) ]]

	use({
		"akinsho/toggleterm.nvim",
		tag = "*",
		config = function()
			require("toggleterm").setup()
		end,
	})
end)
