--vim.opt.guicursor = ""
-- on neovim start press j and enter
vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
--vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

--vim.opt.swapfile = false
--vim.opt.backup = false
-- vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
--vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
--vim.opt.signcolumn = "yes"
--vim.opt.isfname:append("@-@")

--vim.opt.updatetime = 50

vim.cmd("autocmd InsertLeave * if &readonly == 0 && filereadable(bufname('%')) | write | endif")

--vim.cmd("autocmd BufWritePre * undojoin | silent Neoformat")
-- create keybind to format code
vim.keymap.set("n", "<C-f>", ":Neoformat<CR> | :update<CR>", { noremap = true, silent = true })

vim.cmd("autocmd FileType * set formatoptions-=cro")

-- save file once created
vim.cmd("autocmd BufNewFile * silent! write")

function MultipleEdit(p_list)
	for _, p in ipairs(p_list) do
		local files = vim.fn.glob(p, 0, 1)
		for _, c in ipairs(files) do
			vim.cmd("edit " .. c)
		end
	end
end

function EditMultipleFiles(...)
	-- Convert the variable arguments to a table
	local input_table = { ... }

	-- Call the MultipleEdit function with the input table
	MultipleEdit(input_table)
end

vim.cmd("command! -bar -bang -nargs=+ -complete=file Edit call v:lua.EditMultipleFiles(<f-args>)")

vim.g.AutoPairsCenterLine = 0
--vim.g.AutoPairsFlyMode = 1

vim.cmd[[function! IndentWithI()
    if len(getline('.')) == 0
        return "\"_cc"
    else
        return "i"
    endif
endfunction

nnoremap <expr> i IndentWithI()]]
-- done

-- set env variable $env:TERM_PROGRAM = "nvim"
vim.cmd("let $TERM_PROGRAM = 'nvim'")
