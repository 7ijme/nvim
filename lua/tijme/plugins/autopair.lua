return {
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {}, -- this is equalent to setup({}) function
		config = function()
			local npairs = require("nvim-autopairs")

			npairs.setup({
				fast_wrap = {
					map = "<M-e>",
					chars = { "{", "[", "(", '"', "'" },
					pattern = [=[[%'%"%>%]%)%}%,]]=],
					end_key = "$",
					before_key = "h",
					after_key = "l",
					cursor_pos_before = true,
					keys = "qwertyuiopzxcvbnmasdfghjkl",
					manual_position = true,
					highlight = "Search",
					highlight_grey = "Comment",
				},
			})

			local Rule = require("nvim-autopairs.rule")
			npairs.add_rule(Rule("$$", "$$", "tex"))
			npairs.remove_rule(Rule("$", "$", "typst"))
			npairs.add_rule(Rule("$", "$", "typst"))

			for _, punct in pairs({ "$" }) do
				require("nvim-autopairs").add_rules({
					require("nvim-autopairs.rule")("", punct)
						:with_move(function(opts)
							return opts.char == punct
						end)
						:with_pair(function()
							return false
						end)
						:with_del(function()
							return false
						end)
						:with_cr(function()
							return false
						end)
						:use_key(punct),
				})
			end
		end,
	},
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end,
	},
}
