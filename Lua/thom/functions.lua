-- honetsly this is just miscellaneous stuff
local termstuff = require("thom.terminal_stuff")

local M = {}


M.validate = function(arg,default)
	if arg == "" then 
		return default
	else
		return arg
	end
end

local function Firefox(opts)
	-- opens the current buffer in firefox
	local file = M.validate(opts.args,vim.fn.expand("%:p"))
	-- termstuff.make_terminal_window()
	-- vim.cmd.terminal("firefox -htmlfile "..file)
	vim.fn.jobstart("firefox -htmlfile '"..file.."'")
end
vim.api.nvim_create_user_command("Firefox",Firefox,{nargs="?"})

local function CopyPath(opts)
	-- puts the current buffer's full path in the spcified register,
	-- or into the default register if none is given
	local register = M.validate(opts.args,"\"")
	local path = vim.fn.expand("%:p")
	vim.fn.setreg(register,path)
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

-- telescope
local function find_in_folder()
	local here = vim.fn.expand("%:p:h")
	if vim.bo.filetype == "drex" then
		here = here:sub(("drex://"):len()+1)
	end
	require("Telescope.builtin").find_files({
		["no_ignore"] = true,
		["search_dirs"] = {here}
	})
end
vim.api.nvim_create_user_command("Scope",find_in_folder,{})


vim.cmd("command! Visual normal! v")


-- ++++++++++++ abbreviations ++++++++++++
vim.api.nvim_create_user_command("Spell",
	function ()
		vim.cmd.setlocal("spell spelllang=en_gb")
	end,
	{}
)
vim.api.nvim_create_user_command("Nospell",
	function ()
		vim.cmd.setlocal("nospell")
	end,
	{}
)

vim.api.nvim_create_user_command("Jaeha",
	function (opts)
		print(opts.fargs[1])
		print(opts.fargs[2])
		print(opts.fargs[3])
		print(opts.bang)
	end,
	{nargs="*"}
)



return M
