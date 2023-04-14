return {
	-- Highlighting
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
	"nvim-treesitter/nvim-treesitter-context",

	-- Git
	"tpope/vim-fugitive",
	"lewis6991/gitsigns.nvim",

	-- Debugging
	"mfussenegger/nvim-dap",
	{
		"mfussenegger/nvim-jdtls",
		module = "jdtls",
		ft = "java",
	},

	--use 'prettier/vim-prettier'
	{ "sbdchd/neoformat", keys = {
		{ "<C-f>", ":Neoformat<CR> | :update<CR>" },
	} },

	"neoclide/npm.nvim",

	-- color highlighting
	"gko/vim-coloresque",

	"nvim-tree/nvim-web-devicons",

	-- fuzzy finder
	"romgrk/fzy-lua-native",

	-- better file eplorer

	--use "Pocco81/auto-save.nvim"

	-- error tab
	{
		"folke/trouble.nvim",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			require("trouble").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
	},

	-- show how long i have been coding
	"wakatime/vim-wakatime",

	-- auto close brackets
	--"Raimondi/delimitMate",
	--"jiangmiao/auto-pairs",
	--"rstacruz/vim-closer",
	--"LunarWatcher/auto-pairs",
	"cohama/lexima.vim",

	-- formatter
	{ "wesleimp/stylua.nvim" },

	-- better commenting
	{
		"folke/todo-comments.nvim",
		dependencies = "nvim-lua/plenary.nvim",
		config = function()
			require("todo-comments").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
	},

	-- search (f) highlighting
	"unblevable/quick-scope",

	-- signatures (for lsp)

	-- comment shortcuts
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	},

	-- yeah useless fun bullshit
	"eandrju/cellular-automaton.nvim",

	"github/copilot.vim",

	"nvim-telescope/telescope-media-files.nvim",
	"nvim-lua/popup.nvim",

	--[[ use({
		"folke/noice.nvim",
		config = function()
			require("noice").setup({
				-- add any options here
			})
		end,
		dependencies = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			-- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
			"rcarriga/nvim-notify",
		},
	}) ]]
}
