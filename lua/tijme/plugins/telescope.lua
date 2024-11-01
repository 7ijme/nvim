return {
		"nvim-telescope/telescope.nvim",
		--tag = "0.1.4",
		-- or                            , branch = '0.1.x',
		dependencies = {
			{
				"nvim-lua/plenary.nvim",
				"nvim-telescope/telescope-project.nvim",
				"nvim-telescope/telescope-file-browser.nvim",
				--"nvim-telescope/telescope-ui-select.nvim"
			},
		},

	config = function()
		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
		vim.keymap.set("n", "<leader>pd", builtin.diagnostics, {})
		vim.keymap.set("n", "<C-p>", builtin.git_files, {})
		vim.keymap.set("n", "<leader>ps", function()
			builtin.grep_string({ search = vim.fn.input("Grep > ") })
		end)
		vim.keymap.set('n', '<leader>pS', builtin.live_grep, { desc = 'Telescope live grep' })
		vim.keymap.set("n", "<leader>pt", function()
			vim.cmd("TodoTelescope")
		end, {})

		require("telescope").load_extension("project")
		vim.keymap.set("n", "<leader>pp", require("telescope").extensions.project.project, {})

		require("telescope").setup({
			extensions = {
				media_files = {
					-- filetypes whitelist
					-- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
					filetypes = { "png", "webp", "jpg", "jpeg", "mp4", "ttf", "webm", "pdf" },
					-- find command (defaults to `fd`)
					find_cmd = "rg",
				},
			},
			pickers = {
				find_files = {
					hidden = true,
				},
			}
		})
		require("telescope").load_extension("media_files")
		vim.keymap.set("n", "<leader>pm", require("telescope").extensions.media_files.media_files, {})
	end,
}
