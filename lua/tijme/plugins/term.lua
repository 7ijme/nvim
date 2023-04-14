return {
	"akinsho/toggleterm.nvim",
	version = "*",
	confog = function()
		require("toggleterm").setup({
			on_open = function(term)
				vim.cmd("startinsert!")
				vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<Esc>", "<cmd>ToggleTerm<cr>", { noremap = true })
				-- leave terminal mode with ctrl-c
				-- vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<C-c>", "<C-\\><C-n>", {noremap = true})
			end,
			direction = "float",
		})

		vim.keymap.set("n", "<C-t>", "<cmd>ToggleTerm<cr>", { noremap = true })
	end,
}
