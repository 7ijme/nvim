return {
	"mfussenegger/nvim-jdtls",
	module = "jdtls",
	ft = "java",

	config = function()
		local root_dir = vim.fs.dirname(vim.fs.find({ ".gradlew", ".git", "mvnw", "pom.xml" }, { upward = true })[1])
		local workspace_folder = "/home/tijme/.cache/jdtls/workspace/" .. vim.fn.fnamemodify(root_dir, ":p:h:t")

		local jdtls = require("jdtls")
		vim.keymap.set("n", "<C-i>", jdtls.organize_imports)

		require("jdtls").start_or_attach({
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
				vim.fn.glob(
					"~/.local/share/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_1.6.600.v20231106-1826.jar"
				),
				"-configuration",
				vim.fn.glob("~/.local/share/nvim/mason/packages/jdtls/config_linux"),
				"-data",
				workspace_folder,
			},
			single_file_support = true,
			--[[ root_dir = function()
				return root_dir
			end, ]]
			root_dir = root_dir,
			flags = {
				debounce_text_changes = 150,
			},
		})
	end,
}
