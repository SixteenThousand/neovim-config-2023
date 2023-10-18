-- this file is for project management stuff

local terminal_stuff = require("thom.terminal_stuff")

local yona = " && yona "

local function call_yona(argstable)
	local move = "cd "..vim.fn.expand("%:h")
	terminal_stuff.make_terminal_window()
	vim.cmd.terminal(move..yona..argstable.args)
	vim.cmd.wincmd("h")
end

local function Yona(cmd)
	local move = "cd "..vim.fn.expand("%:h")
	terminal_stuff.make_terminal_window()
	vim.cmd.terminal(move..yona..cmd)
	vim.cmd.wincmd("h")
end


vim.api.nvim_create_user_command("Yona",call_yona,{nargs=1})


local exports = {
	["Yona"] = Yona
}

return exports
