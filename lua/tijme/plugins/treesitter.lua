return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	dependencies = { "windwp/nvim-ts-autotag" },
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = { "lua", "vim", "vimdoc", "rust", "javascript", "typescript", "css" },
			sync_install = true,
			auto_install = true,
			highlight = { enable = true },
			autotag = { enable = true },
		})
	end,
}
