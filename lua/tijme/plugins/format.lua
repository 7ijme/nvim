return {
	-- "sbdchd/neoformat",
	-- config = function()
	-- 	vim.keymap.set("n", "<C-f>", function()
	-- 		vim.cmd("Neoformat | update")
	-- 	end)
	--
	-- 	vim.g.neoformat_enabled_javascript = { "prettier" }
	-- 	vim.g.neoformat_enabled_typescript = { "prettier" }
	-- 	vim.g.neoformat_enabled_typescriptreact = { "prettier" }
	-- 	vim.g.neoformat_enabled_javascriptreact = { "prettier" }
	-- 	vim.g.neoformat_enabled_html = { "prettier" }
	-- 	vim.g.neoformat_enabled_css = { "prettier" }
	-- 	-- vim.g.neoformat_enabled_typst = { "typstyle" }
	-- end,
	{
		"stevearc/conform.nvim",
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					lua = { "stylua" },
					javascript = { "prettierd", "prettier", stop_after_first = true },
					typescript = { "prettierd", "prettier", stop_after_first = true },
					rust = { "rustfmt" },
					html = { "prettierd", "prettier", stop_after_first = true },
					css = { "prettierd", "prettier", stop_after_first = true },
					json = { "prettierd", "prettier", stop_after_first = true },
					yaml = { "prettierd", "prettier", stop_after_first = true },
					toml = { "prettierd", "prettier", stop_after_first = true },
					markdown = { "prettierd", "prettier", stop_after_first = true },
				},
			})

			vim.api.nvim_create_user_command("Format", function(args)
				local range = nil
				if args.count ~= -1 then
					local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
					range = {
						start = { args.line1, 0 },
						["end"] = { args.line2, end_line:len() },
					}
				end
				require("conform").format({ async = true, lsp_format = "fallback", range = range }--[[, function()
					vim.cmd("update")
				end ]])
			end, { range = true })
			-- set keybind <C-f> to format the file

			vim.keymap.set({ "n", "i" }, "<C-f>", function()
				vim.cmd("Format")
			end)
		end,
	},
}
