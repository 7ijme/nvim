--[[vim.api.nvim_exec(
	[[
  autocmd BufWritePre *.js,*.jsx,*.ts,*.tsx,*.html,*.css,*scss Prettier
]]
--[[,
	false
)

vim.keymap.set("n", "<leader>pr", ":Prettier<CR>")
--vim.keymap.set ("n", "<leader>p", "<Nop>" )
vim.cmd("unmap <leader>p")
]]
--
