return {
	"mbbill/undotree",
	keys = {
		{ "<leader>u", "UndotreeToggle" },
	},
	config = function()
		vim.o.undofile = true
		vim.g.persistent_undo = true
	end,
}
