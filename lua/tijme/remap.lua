--vim.keymap.set("n", "<F8>", ":w <CR> :!gcc % -o %< && %<.exe <CR>")

--[[ vim.keymap.set("n", "<C-Left>", "<C-w>h")
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-Right>", "<C-w>l")
vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<C-Up>", "<C-w>k")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-Down>", "<C-w>j") ]]
-- vim.keymap.set("n", "<C-j>", "<C-w>j")

--[[ vim.keymap.set("n", "<A-h>", "<cmd>vertical resize -1<CR>")
vim.keymap.set("n", "<A-l>", "<cmd>vertical resize +1<CR>")
vim.keymap.set("n", "<A-k>", "<cmd>resize -1<CR>")
vim.keymap.set("n", "<A-j>", "<cmd>resize +1<CR>") ]]
vim.keymap.set("n", "<A-Left>", "<cmd>vertical resize -1<CR>")
vim.keymap.set("n", "<A-Right>", "<cmd>vertical resize +1<CR>")
vim.keymap.set("n", "<A-Up>", "<cmd>resize -1<CR>")
vim.keymap.set("n", "<A-Down>", "<cmd>resize +1<CR>")


vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

-- join lines
vim.keymap.set("v", "gj", "J")
-- move lines up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set("n", "<leader>fml", "<cmd>CellularAutomaton make_it_rain<CR>")

vim.keymap.set("n", "<C-B>", "<C-V>")
