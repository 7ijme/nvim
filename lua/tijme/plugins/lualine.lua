return {
	"nvim-lualine/lualine.nvim",
	config = function()
		require("lualine").setup({
			options = {
				theme = "onedark",
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch", "diff", "diagnostics" },
				lualine_c = { "filename" },
				lualine_x = {
					"filetype",
				},
				lualine_y = {
					{
						require("noice").api.status.command.get_hl,
						cond = require("noice").api.status.command.has,
						color = { fg = "#ff9e64" },
					},
					"location",
					"progress",
				},
				lualine_z = { "os.date('!%H:%M:%S', os.time()+get_timezone())" },
			},
		})

		-- Compute the difference in seconds between local time and UTC.
		function get_timezone()
			local now = os.time()
			return os.difftime(now + 3600, os.time(os.date("!*t", now)))
		end

		--[[ if _G.Statusline_timer == nil then
			_G.Statusline_timer = vim.loop.new_timer()
		else
			_G.Statusline_timer:stop()
		end
		_G.Statusline_timer:start(
			0, -- never timeout
			1000, -- repeat every 1000 ms
			vim.schedule_wrap(function() -- updater function
				vim.api.nvim_command("redrawstatus")
			end)
		) ]]
	end,
}
