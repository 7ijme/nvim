return {
	"sbdchd/neoformat",
	config = function()
		vim.keymap.set("n", "<C-f>", function()
			vim.cmd("Neoformat | update")
		end)

		vim.g.neoformat_enabled_javascript = { "prettier" }
		vim.g.neoformat_enabled_typescript = { "prettier" }
		vim.g.neoformat_enabled_typescriptreact = { "prettier" }
		vim.g.neoformat_enabled_javascriptreact = { "prettier" }
		vim.g.neoformat_enabled_html = { "prettier" }
		vim.g.neoformat_enabled_css = { "prettier" }
	end,
}
