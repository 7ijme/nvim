local workspace_dir = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')

print(workspace_dir)

local config = {
    cmd = {
		'java',
		'-Declipse.application=org.eclipse.jdt.ls.core.id1',
		'-Dosgi.bundles.defaultStartLevel=4',
		'-Declipse.product=org.eclipse.jdt.ls.core.product',
		'-Dlog.level=ALL',
		'-noverify',
		'-Xmx1G',
		'-jar', '~/Library/Java/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar',
		'-configuration', '~/Library/Java/config_win',
		'-data', '%',
	},
    root_dir = vim.fs.dirname(vim.fs.find({'.gradlew', '.git', 'mvnw'}, { upward = true })[1]),
}

require('jdtls').start_or_attach(config)
