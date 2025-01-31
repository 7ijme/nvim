return {
	-- Highlighting
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
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("trouble").setup({})
			vim.keymap.set("n", "<leader>tt", function()
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
	{ "numToStr/Comment.nvim",      opts = {} },

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
	{
		"f-person/git-blame.nvim",
		keys = {
			{ "<leader>gb", "<cmd>GitBlameToggle<cr>", desc = "Toggle Git Blame" },
		},
		opts = {
			enabled = false,
			date_format = "%r, %x (%H:%M)",
			message_template = "  <author> • <date> • <summary>",
		},
	},

	-- Extend ai motion
	{ "echasnovski/mini.ai",        version = "*", opts = {} },
	-- { "echasnovski/mini.starter", version = "*", opts = {} },
	-- Extend f and t
	{ "echasnovski/mini.jump",      version = "*", opts = {} },
	-- Split and join objects
	{ "echasnovski/mini.splitjoin", version = "*", opts = {} },
	"lambdalisue/suda.vim",

	-- jupyter notebook
	-- "luk400/vim-jukit"
	{
		"kaarmu/typst.vim",
		ft = "typst",
		lazy = false,
	},
	{
		"PartyWumpus/typst-concealer",
		config = function()
			require("typst-concealer").setup {
				do_diagnostics = false,
				enabled_by_default = false
			}
		end,
		event = "VeryLazy",
	},
	-- "sirver/ultisnips",
	-- { "ckunte/typst-snippets-vim", version = "*" },

	-- discord rich presence
	{ "andweeb/presence.nvim", conf = {} },
	-- {
	-- 	"Pocco81/auto-save.nvim",
	-- 	config = function()
	-- 		require("auto-save").setup({
	-- 			execution_message = {
	-- 				message = "",
	-- 				dim = 0.18, -- dim the color of `message`
	-- 				cleaning_interval = 1250, -- (milliseconds) automatically clean MsgArea after displaying `message`. See :h MsgArea
	-- 			},
	-- 		})
	-- 	end,
	-- },
	"LZDQ/nvim-autocenter",

	{
		"niuiic/typst-preview.nvim",
		dependencies = { "niuiic/core.nvim" },
		config = function()
			vim.keymap.set("n", "<leader>tp", "<cmd>lua require('typst-preview').preview()<cr>",
				{ noremap = true, silent = true })
		end
	},

	{
		"azratul/live-share.nvim",
		dependencies = {
			"jbyuki/instant.nvim",
		},
		config = function()
			vim.g.instant_username = "Tijme"
			require("live-share").setup({
				port_internal = 8765,
				max_attempts = 40, -- 10 seconds
				service = "serveo.net",
			})
		end,
	},

	{ "edluffy/hologram.nvim", conf = { auto_display = true } },

	{
		"folke/lazydev.nvim",
		ft = "lua", -- only load on lua files
		opts = {
			library = {
				-- See the configuration section for more details
				-- Load luvit types when the `vim.uv` word is found
				{ path = "luvit-meta/library", words = { "vim%.uv" } },
			},
		},
	},
}
