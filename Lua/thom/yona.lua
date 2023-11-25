-- this file is for project management stuff

local M = {}

local terminal_stuff = require("thom.terminal_stuff")

local yona = " && yona "

function M.call_yona(opts)
	local shell_cmd = "cd "..vim.fn.expand("%:h")..yona..opts.args
	if opts.bang then
		terminal_stuff.make_terminal_window()
		vim.cmd.terminal(shell_cmd)
		vim.cmd.wincmd("h")
	else
		vim.cmd("!"..shell_cmd)
	end
end

vim.api.nvim_create_user_command("Yona",M.call_yona,{nargs=1,bang=true})



return M
