return {
	"mbbill/undotree",
	config = function()
		vim.o.undofile = true
		vim.g.persistent_undo = true
		vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
	end,
}
