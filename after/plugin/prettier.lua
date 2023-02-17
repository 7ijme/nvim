vim.api.nvim_exec([[
  autocmd BufWritePre *.js,*.jsx,*.ts,*.tsx,*.html,*.css,*scss Prettier
]], false)
