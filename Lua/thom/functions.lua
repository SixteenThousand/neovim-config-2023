-- honetsly this is just miscellaneous stuff
local termstuff = require("thom.terminal_stuff")


local function validate(arg,default)
	if arg == "" then 
		return default
	else
		return arg
	end
end

local function Firefox(argstable)
	-- opens the current buffer in firefox
	local file = validate(argstable.args,vim.fn.expand("%:p"))
	-- termstuff.make_terminal_window()
	-- vim.cmd.terminal("firefox -htmlfile "..file)
	vim.fn.jobstart("firefox -htmlfile "..file)
end
vim.api.nvim_create_user_command("Firefox",Firefox,{nargs="?"})

local function CopyPath(argstable)
	-- puts the current buffer's full path in the spcified register,
	-- or into the default register if none is given
	local register = validate(argstable.args,"\"")
	vim.cmd("let @"..register.."=expand(\"%:p\")")
	print("Path copied!")
end
vim.api.nvim_create_user_command("Path",CopyPath,{nargs="?"})

local function Tohtml()
	vim.cmd("runtime! syntax/2html.vim")
end
vim.api.nvim_create_user_command("Tohtml",Tohtml,{})

local function Help()
	vim.cmd.edit("~/Documents/Programs/0-Notes")
end
vim.api.nvim_create_user_command("Help",Help,{})

vim.cmd("command! Visual normal! v")


local exports = {
	["validate"] = validate
}

return exports
