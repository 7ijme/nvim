return {

	"VonHeikemen/lsp-zero.nvim",
	branch = "v1.x",
	dependencies = {
		-- LSP Support
		"neovim/nvim-lspconfig", -- Required
		"williamboman/mason.nvim", -- Optional
		"williamboman/mason-lspconfig.nvim", -- Optional
		"numToStr/prettierrc.nvim",

		-- Autocompletion
		"hrsh7th/nvim-cmp", -- Required
		"hrsh7th/cmp-nvim-lsp", -- Required
		"hrsh7th/cmp-buffer", -- Optional
		"hrsh7th/cmp-path", -- Optional
		"saadparwaiz1/cmp_luasnip", -- Optional
		"evesdropper/luasnip-latex-snippets.nvim",
		"hrsh7th/cmp-nvim-lua", -- Optional

		-- Snippets
		"L3MON4D3/LuaSnip", -- Required
		"rafamadriz/friendly-snippets", -- Optional
	},

	config = function()
		local lsp = require("lsp-zero")

		lsp.preset("recommended")

		lsp.ensure_installed({
			"tsserver",
			"rust_analyzer",
			"lua_ls",
			"emmet_ls",
		})

		lsp.configure("lua_ls", {
			settings = {
				Lua = {
					diagnostics = {
						-- Get the language server to recognize the `vim` global
						globals = { "vim" },
					},
				},
			},
		})

		lsp.configure("ltex", {
			settings = {
				ltex = {
					language = "auto",
				},
			},
		})

		local cmp = require("cmp")
		local cmp_select = { behavior = cmp.SelectBehavior.Select }
		local cmp_mappings = lsp.defaults.cmp_mappings({
			["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
			["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
			["<C-y>"] = cmp.mapping.confirm({ select = true }),
			["<C-Space>"] = cmp.mapping.complete(),
		})

		local cmp_autopairs = require("nvim-autopairs.completion.cmp")
		cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

		cmp_mappings["<Tab>"] = nil
		cmp_mappings["<S-Tab>"] = nil

		lsp.setup_nvim_cmp({
			mapping = cmp_mappings,
		})

		lsp.set_preferences({
			suggest_lsp_servers = true,
			sign_icons = {
				error = "E",
				warn = "W",
				hint = "H",
				info = "I",
			},
		})

		lsp.on_attach(function(client, bufnr)
			local opts = { buffer = bufnr, remap = false }

			vim.keymap.set("n", "gd", function()
				vim.lsp.buf.definition()
			end, opts)
			vim.keymap.set("n", "K", function()
				vim.lsp.buf.hover()
			end, opts)
			vim.keymap.set("n", "<leader>vws", function()
				vim.lsp.buf.workspace_symbol()
			end, opts)
			vim.keymap.set("n", "<leader>vd", function()
				vim.diagnostic.open_float()
			end, opts)
			vim.keymap.set("n", "[d", function()
				vim.diagnostic.goto_next()
			end, opts)
			vim.keymap.set("n", "]d", function()
				vim.diagnostic.goto_prev()
			end, opts)
			vim.keymap.set("n", "<leader>ca", function()
				vim.lsp.buf.code_action()
			end, opts)
			vim.keymap.set("n", "<leader>vrr", function()
				vim.lsp.buf.references()
			end, opts)
			vim.keymap.set("n", "<F2>", function()
				vim.lsp.buf.rename()
			end, opts)
			-- show suggestions on ctrl Space

			--vim.keymap.set("i", "<leader>h", function() vim.lsp.buf.signature_help() end, opts)
		end)

		vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
			virtual_text = true,
			signs = true,
			update_in_insert = true,
			underline = true,
			severity_sort = true,
			float = true,
		})

		--[[
local root_files = {
	"settings.gradle", -- Gradle (multi-project)
	"settings.gradle.kts", -- Gradle (multi-project)
	"build.xml", -- Ant
	"pom.xml", -- Maven
	"package.json", -- npm"
}

local fallback_root_files = {
	"build.gradle", -- Gradle
	"build.gradle.kts", -- Gradle
}
root_dir = function(fname)
	local primary = util.root_pattern(unpack(root_files))(fname)
	local fallback = util.root_pattern(unpack(fallback_root_files))(fname)
	return primary or fallback
end
]]
		--

		require("mason").setup()
		--lsp.setup("rust_analyzer", {
		--cmd = { "C:\\Users\\tijme\\AppData\\Local\\nvim-data\\mason\\packages\\rust-analyzer\\rust-analyzer.exe" },
		--})

		lsp.setup()
	end,
}
