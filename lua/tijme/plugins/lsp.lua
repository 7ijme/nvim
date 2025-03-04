return {
	{
		"VonHeikemen/lsp-zero.nvim",
		dependencies = {
			"mihyaeru21/nvim-ruby-lsp",
		},
		branch = "v4.x",
		config = function()
			local lsp_zero = require("lsp-zero")

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

			lsp_zero.extend_lspconfig({
				sign_text = true,
				lsp_attach = lsp_attach,
				capabilities = require("cmp_nvim_lsp").default_capabilities(),
			})

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

			local nvim_lsp = require("lspconfig")
			nvim_lsp.denols.setup({
				root_dir = nvim_lsp.util.root_pattern("deno.json", "deno.jsonc"),
			})

			--[[ nvim_lsp.ts_ls.setup({
				root_dir = nvim_lsp.util.root_pattern("package.json"),
				single_file_support = true,
			}) ]]

			-- nvim_lsp.typst_lsp.setup({
			-- 	-- offset_encoding = "utf-8",
			-- 	single_file_support = true,
			-- 	settings = {
			-- 		exportPdf = "onType", -- Choose onType, onSave or never.
			-- 		-- serverPath = "" -- Normally, there is no need to uncomment it.
			-- 	},
			-- })

			require("lspconfig").tinymist.setup({
				-- offset_encoding = "utf-8",
				single_file_support = true,
				settings = {
					exportPdf = "never",
					-- formatterMode = "typstyle"
				},
			})

			local cmp = require("cmp")
			local cmp_action = require("lsp-zero").cmp_action()

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
	{ "neovim/nvim-lspconfig" },
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/nvim-cmp" },
}
