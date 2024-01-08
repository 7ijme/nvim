return {
	"prichrd/netrw.nvim",

	config = function()
		local function del(payload)
			print(payload.node)
			vim.ui.select({ "yes", "no" }, {
				prompt = "Delete " .. payload.node .. "?",
				default = "no",
				telescope = require("telescope.themes").get_cursor(),
			}, function(answer)
				if answer == "yes" then
					vim.cmd("silent !rm -rf " .. payload.dir .. "/" .. payload.node)
					-- use native vim api to delete file
					--vim.fn.delete(payload.dir .. "/" .. payload.node, "rf")
				end
			end)
		end

		require("netrw").setup({
			-- Put your configuration here, or leave the object empty to take the default
			-- configuration.
			icons = {
				symlink = "", -- Symlink icon (directory and file)
				directory = "", -- Directory icon
				file = "", -- File icon
			},
			use_devicons = true, -- Uses nvim-web-devicons if true, otherwise use the file icon specified above
			mappings = {
				["R"] = function(payload)
					print(payload.node)
					vim.ui.input({
						prompt = "Rename " .. payload.node .. " to: ",
						default = payload.node,
						kind = "netrw",
					}, function(new_name)
						if new_name == nil or new_name == "" then
							print("No name provided, aborting")
							return
						end
						-- payload.dir is the directory of the file
						-- payload.node is the name of the file
						-- new_name is the new name of the file
						vim.cmd(
							"silent !mv " .. payload.dir .. "/" .. payload.node .. " " .. payload.dir .. "/" .. new_name
						)
					end)
				end,
				["D"] = del,
				["<del>"] = del,

--[[ 				["%"] = function(payload)
					-- create file with input name
					vim.ui.input({
						prompt = "Create file in " .. payload.dir .. " with name: ",
						default = "",
						kind = "netrw",
					}, function(new_name)
						if new_name == nil or new_name == "" then
							print("No name provided, aborting")
							return
						end
						vim.cmd("silent !touch " .. payload.dir .. "/" .. new_name)
						-- open file in new buffer
						vim.cmd("e " .. payload.dir .. "/" .. new_name)
					end)
				end,
	 ]]			["d"] = function(payload)
					-- create directory with input name
					vim.ui.input({
						prompt = "Create directory in " .. payload.dir .. " with name: ",
						default = "",
						kind = "netrw",
					}, function(new_name)
						if new_name == nil or new_name == "" then
							print("No name provided, aborting")
							return
						end
						vim.cmd("silent !mkdir " .. payload.dir .. "/" .. new_name)
					end)
				end,
			}, -- Custom key mappings
		})

		--vim.g.netrw_liststyle = 3
	end,
}
