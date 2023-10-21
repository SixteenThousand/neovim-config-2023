-- ++++++++++++ this script manages session related stuff ++++++++++++

local popup = require "plenary.popup"
local sessions_loc = "C:/Users/thoma/AppData/Local/nvim/Sessions/"
local ext = ".session.vim"
local pattern = "(.+)%.session.vim"

local function sess_file(name)
	-- takes the name of a session and gives you the full filepath
	-- corresponding to that session
	return sessions_loc..name..ext
end

local function session_menu(title,action)
	local sessions_dir = vim.fs.dir(sessions_loc)
	local sessions = {"continue sans session"}
	for filename,_ in sessions_dir do
		_,_,sessions[#sessions+1] = filename:find(pattern)
	end
	popup.create(sessions,{
		title = title,
		border = true,
		borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
		minwidth = #title + 10,
		callback = action,
	})
end

local function load_session(_,session_name)
	if session_name == "continue sans session" then
		print("No session needed buddy!")
	else
		vim.cmd.quit()
		vim.cmd.source(sess_file(session_name))
	end
end

local function delete_drex_buffers(path)
	local fp = io.open(path,"r")
	local newlines = {}
	for line in fp:lines() do
		if line:find("drex://") == nil then
			newlines[#newlines+1] = line
		end
	end
	fp:close()
	print(newlines)
	fp = io.open(path,"w")
	for i=1,#newlines do
		fp:write(newlines[i])
		fp:write("\n")
	end
	fp:close()
end

local function save_session(_,session_name)
	if session_name == "continue sans session" then
		vim.cmd.quitall()
	else
		vim.cmd.quit()
		vim.cmd("mksession! "..sess_file(session_name))
		delete_drex_buffers(sess_file(session_name))
		vim.cmd("quitall!")
	end
end




-- ++++++++++++ interface ++++++++++++
function LoadSession()
	session_menu("Load Session",load_session)
end
function SaveSession()
	session_menu("Save Session",save_session)
end

vim.api.nvim_create_user_command("LoadSession",LoadSession,{})
vim.api.nvim_create_user_command("SaveSession",SaveSession,{})
vim.api.nvim_create_user_command("NewSession", 
	function (argstable)
		vim.cmd.mksession(sess_file(argstable.args))
		print("New session <<"..argstable.args..">> made!")
	end,
	{ nargs=1}
)
vim.api.nvim_create_user_command("WipeSession",
	function (argstable)
		local fp = io.open(sess_file(argstable.args), "w")
		fp:write(":echo 'This session has been wiped'")
		fp:close()
		print("Session <<"..argstable.args..">> has been wiped clean!")
	end,
	{ nargs=1 }
)
vim.api.nvim_create_user_command("DeleteSession",
	function (argstable)
		os.remove(sess_file(argstable.args))
		print("Session <<"..argstable.args..">> deleted entirely!")
	end,
	{ nargs=1 }
)
