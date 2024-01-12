return {
	-- Highlighting
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		dependencies = {
			"windwp/nvim-ts-autotag"
		},
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = { "lua", "vim", "vimdoc", "rust"},
				sync_install = true,
				auto_install = true,
				highlight = {
					enable = true,
				},
				autotag = {
					enable = true,
				}
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
	{
		"mfussenegger/nvim-dap",
	},
	{
		"mfussenegger/nvim-jdtls",
		module = "jdtls",
		ft = "java",
	},

	{
		"sbdchd/neoformat",
		keys = {
			{ "<C-f>", "<cmd>Neoformat | update<cr>", desc = "Format" },
			config = function() end,
		},
	},

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
		dependencies = {"nvim-tree/nvim-web-devicons"},
		config = function()
			require("trouble").setup({})
			vim.keymap.set("n", "<leader>tt", function ()
				require("trouble").toggle()
			end)
		end,
	},

	-- show how long i have been coding
	"wakatime/vim-wakatime",

	-- Auto bracket pairs
	-- "cohama/lexima.vim",

	-- formatter
	"wesleimp/stylua.nvim",

	-- better commenting
	{
		"folke/todo-comments.nvim",
		dependencies = "nvim-lua/plenary.nvim",
		config = function()
			require("todo-comments").setup({
				keywords = {
					FIX = {
						icon = " ", -- icon used for the sign, and in search results
						color = "error", -- can be a hex color, or a named color (see below)
						alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
						-- signs = false, -- configure signs for some keywords individually
					},
					TODO = { icon = " ", color = "info" },
					HACK = { icon = " ", color = "warning" },
					WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
					PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
					NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
					TEST = { icon = "", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
				},
			})
		end,
	},

	-- search (f) highlighting
	"unblevable/quick-scope",

	-- signatures (for lsp)
	-- {
	-- 	"simrat39/rust-tools.nvim",
	-- 	config = function()
	-- 		require("rust-tools").setup()
	-- 		-- excecute when rust file is opened
	-- 		vim.cmd([[
	-- 		  augroup rust_buffer_keymap
	-- 			autocmd!
	-- 			autocmd BufEnter *.rs lua vim.api.nvim_buf_set_keymap(0, 'n', 'K', ':RustHoverActions<CR>', { noremap = true, silent = true })
	-- 		  augroup END
	-- 		]])
	-- 	end,
	-- },

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

	{
		"christoomey/vim-tmux-navigator",
		cond = function()
			-- return vim.loop.os_uname().sysname == "Linux"
			return true
		end,
	},

	{
		"ErichDonGubler/lsp_lines.nvim",
		keys = {
			{ "<A-l>", "<cmd>lua require('lsp_lines').toggle()<cr>", "Toggle lsp_lines" },
		},
		config = function()
			require("lsp_lines").setup()
			require("lsp_lines").toggle()
		end,
	},

	"vimpostor/vim-tpipeline",
	{"laytan/cloak.nvim",
		config = function ()
			require('cloak').setup({
				enabled = true,
				cloak_character = '*',
				-- The applied highlight group (colors) on the cloaking, see `:h highlight`.
				highlight_group = 'Comment',
				-- Applies the length of the replacement characters for all matched
				-- patterns, defaults to the length of the matched pattern.
				cloak_length = nil, -- Provide a number if you want to hide the true length of the value.
				-- Wether it should try every pattern to find the best fit or stop after the first.
				try_all_patterns = true,
				patterns = {
					{
						-- Match any file starting with '.env'.
						-- This can be a table to match multiple file patterns.
						file_pattern = '.env*',
						-- Match an equals sign and any character after it.
						-- This can also be a table of patterns to cloak,
						-- example: cloak_pattern = { ':.+', '-.+' } for yaml files.
						cloak_pattern = '=.+',
						-- A function, table or string to generate the replacement.
						-- The actual replacement will contain the 'cloak_character'
						-- where it doesn't cover the original text.
						-- If left emtpy the legacy behavior of keeping the first character is retained.
						replace = nil,
					},
				},
			})
		end
	}
}
