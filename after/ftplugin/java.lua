root_dir = vim.fs.dirname(vim.fs.find({ ".gradlew", ".git", "mvnw", "pom.xml" }, { upward = true })[1])
local workspace_folder = "C:\\Users\\tijme\\.cache\\jdtls\\workspace\\" .. vim.fn.fnamemodify(root_dir, ":p:h:t")

local jdtls = require("jdtls")
vim.keymap.set("n", "<C-o>", jdtls.organize_imports)

require("lspconfig").jdtls.setup({
	cmd = {
		"java",
		"-Declipse.application=org.eclipse.jdt.ls.core.id1",
		"-Dosgi.bundles.defaultStartLevel=4",
		"-Declipse.product=org.eclipse.jdt.ls.core.product",
		"-Dlog.protocol=true",
		"-Dlog.level=ALL",
		"-Xms1g",
		"--add-modules=ALL-SYSTEM",
		"--add-opens",
		"java.base/java.util=ALL-UNNAMED",
		"--add-opens",
		"java.base/java.lang=ALL-UNNAMED",

		"-jar",
		"C:\\Users\\tijme\\AppData\\Local\\nvim-data\\mason\\packages\\jdtls\\plugins\\org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar",
		"-configuration",

		"C:\\Users\\tijme\\AppData\\Local\\nvim-data\\mason\\packages\\jdtls\\config_win",
		"-data",
		workspace_folder,
	},
	single_file_support = true,
	root_dir = function()
		return root_dir
	end,
	flags = {
		debounce_text_changes = 150,
	},
})
