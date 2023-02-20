require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the four listed parsers should always be installed)
  ensure_installed = { "rust", "javascript", "typescript", "lua", "vim", "help" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  -- ignore_install = { "c", "cc", "gcc", "clang", "cl", "zig" },


  highlight = {
	  -- `false` will disable the whole extension
	  enable = true,
	  additional_vim_regex_highlighting = true,
  },
}

--require 'nvim-treesitter.install'.compilers = { 'zig' }
