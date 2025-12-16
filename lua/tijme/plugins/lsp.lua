return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"mihyaeru21/nvim-ruby-lsp",
			"sigmasd/deno-nvim",
			-- "mfussenegger/nvim-jdtls",
			{
				"ravibrock/spellwarn.nvim",
				event = "VeryLazy",
				config = true,
			},
		},
		config = function()
			-- lsp_attach is where you enable features that only work
			-- if there is a language server active in the file

			local lsp_attach = function(client, bufnr)
				local opts = { buffer = bufnr }

				vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
				vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
				vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
				vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
				vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
				vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
				vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
				vim.keymap.set("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
				vim.keymap.set({ "n", "x" }, "<F3>", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", opts)
				vim.keymap.set("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
			end

			require("mason").setup({})
			require("mason-lspconfig").setup({
				handlers = {
					function(server_name)
						require("lspconfig")[server_name].setup({})
					end,
				},
				ensure_installed = { "tinymist", "denols", "emmet_ls", "lua_ls" },
				automatic_installation = true,
			})

			vim.lsp.config("emmet_ls", {
				cmd = { "emmet-ls", "--stdio" },
				filetypes = { "html", "css", "javascriptreact", "typescriptreact", "vue", "svelte" },
			})

			vim.lsp.config("denols", {
				cmd = { "deno", "lsp" },
				filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "json" },
				root_markers = { "deno.json", "deno.jsonc" },
				settings = {
					deno = {
						lint = true,
						unstable = false,
					},
				},
				on_attach = lsp_attach,
			})

			vim.lsp.config("lua_ls", {
				cmd = { "lua-language-server" },
				filetypes = { "lua" },
				root_markers = { ".luarc.json", ".luarc.jsonc", "stylua.toml", ".git" },
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
					},
				},
				on_attach = lsp_attach,
			})
			vim.lsp.config("rust_analyzer", {
				cmd = { "rust-analyzer" },
				filetypes = { "rust" },
				root_markers = { "Cargo.toml" },
				on_attach = lsp_attach,
			})

			vim.lsp.config("tinymist", {
				cmd = { "tinymist" },
				filetypes = { "typst" },
				root_markers = { ".git", "main.typ" },
				settings = {
					exportPdf = "never", -- Choose onType, onSave or never.
				},
				on_attach = lsp_attach,
			})

			local cmp = require("cmp")

			cmp.setup({
				preselect = cmp.PreselectMode.Item, -- Automatically preselect the first item.
				sources = {
					{ name = "nvim_lsp" },
				},
				completion = {
					completeopt = "menu,menuone,noinsert",
					-- autocomplete = false,
				},
				mapping = cmp.mapping.preset.insert({
					-- Navigate between completion items
					["<C-p>"] = cmp.mapping.select_prev_item({ behavior = "select" }),
					["<C-n>"] = cmp.mapping.select_next_item({ behavior = "select" }),

					-- `Enter` key to confirm completion
					["<CR>"] = cmp.mapping.confirm({ select = true }),

					-- Ctrl+Space to trigger completion menu
					["<C-Space>"] = cmp.mapping.complete(),

					-- -- Navigate between snippet placeholder
					-- ["<C-f>"] = cmp_action.vim_snippet_jump_forward(),
					-- ["<C-b>"] = cmp_action.vim_snippet_jump_backward(),

					-- Scroll up and down in the completion documentation
					["<C-u>"] = cmp.mapping.scroll_docs(-4),
					["<C-d>"] = cmp.mapping.scroll_docs(4),
					["<C-e>"] = cmp.mapping.close(),
				}),
				snippet = {
					expand = function(args)
						vim.snippet.expand(args.body)
					end,
				},
			})

			vim.filetype.add({
				pattern = { [".*/hypr/.*%.conf"] = "hyprlang" },
			})
		end,
	},
	{ "williamboman/mason.nvim" },
	{ "williamboman/mason-lspconfig.nvim" },
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/nvim-cmp" },
}
