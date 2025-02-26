return {
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			local npairs = require("nvim-autopairs")

			npairs.setup({
				check_ts = true,
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
			-- npairs.remove_rule(Rule("$", "$", "typst"))
			-- npairs.add_rule(Rule("$", "$", "typst"))
			--

			-- Voeg $-autopair toe voor Typst
			npairs.add_rules({
				Rule("$", "$", "typst"):with_cr(function()
					return true
				end):replace_map_cr(function()
					return "<C-o>x<CR><CR>$<C-o>k<tab>"
				end),
			})

			npairs.add_rules({
				Rule("$", "$", "typst"):replace_endpair(function(opts)
					if opts.next_char == "$" then
						return "  <C-o>h"
					end
					return " "
				end):use_key("<space>"),
			})

			npairs.add_rules({
				Rule("$ ", " $", "typst")
					:with_del(function()
						return false
					end)
					:replace_endpair(function(opts)
						if opts.next_char == " $" then
							return "<BS><C-o>x"
						end
						return " "
					end)
					:replace_map_cr(function()
						return "<C-o>x<CR><CR><C-o>k<tab>"
					end)
					:use_key("<space>"),
			})
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
