return {
	-- Highlighting
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				auto_install = true,
				highlight = {
					enable = true,
				},
			})
		end,
	},
	"nvim-treesitter/nvim-treesitter-context",

	-- Git
	"tpope/vim-fugitive",
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end,
	},

	-- Debugging
	"mfussenegger/nvim-dap",
	{
		"mfussenegger/nvim-jdtls",
		module = "jdtls",
		ft = "java",
	},

	{ "sbdchd/neoformat", keys = {
		{ "<C-f>", ":Neoformat<CR> | :update<CR>" },
	} },

	"neoclide/npm.nvim",

	-- color highlighting
	{
		"brenoprata10/nvim-highlight-colors",
		config = function()
			require("nvim-highlight-colors").turnOn()
		end,
	},

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
			require("trouble").setup({})
		end,
	},

	-- show how long i have been coding
	"wakatime/vim-wakatime",

	-- Auto bracket pairs
	"cohama/lexima.vim",

	-- formatter
	{ "wesleimp/stylua.nvim" },

	-- better commenting
	{
		"folke/todo-comments.nvim",
		dependencies = "nvim-lua/plenary.nvim",
		config = function()
			require("todo-comments").setup({})
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

	"7ijme/telescope-media-files.nvim",
	"nvim-telescope/telescope-file-browser.nvim",
	"nvim-lua/popup.nvim",

	"christoomey/vim-tmux-navigator",

	{
		"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
		keys = {
			{ "<A-l>", ":lua require('lsp_lines').toggle()<CR>", "Toggle lsp_lines" },
		},
		config = function()
			require("lsp_lines").setup()
			require("lsp_lines").toggle()
		end,
	},

	"vimpostor/vim-tpipeline",
}
