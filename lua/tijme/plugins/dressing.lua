return {
 "stevearc/dressing.nvim",	config = {
		input = {
		get_config = function(opts)
			if opts.kind == "netrw" then
				return {
					win_options = {
						winblend = 0,
					},
				}
			end
		end,
	},}

}
