vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
require("gitsigns").setup({
	signs = {
		untracked = { text = "" },
	},
})
