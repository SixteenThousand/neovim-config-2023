-- module for terminal functions, including compiling and running the current program
-- project building functionality may be built here later, or it may be put into project_manager.lua


function make_terminal_window()
	local has_terminal = vim.fn.winlayout()[1] == "row"
	if has_terminal then
		vim.cmd.wincmd("l")
	else
		vim.cmd.new()
		vim.cmd.wincmd("L")
	end
end


local function compile_win()
	local current_dir = vim.fn.expand("%:h")
	local current_file = vim.fn.expand("%:t")
	local current_ext = vim.fn.expand("%:e")
	make_terminal_window()
	vim.cmd.terminal(string.format("compile -dir %s -file %s -ext %s",current_dir,current_file,current_ext))
	vim.cmd.wincmd("h")
end

local function run_win()
	local current_file = vim.fn.expand("%:t")
	local current_dir = vim.fn.expand("%:h")
	local current_ext = vim.fn.expand("%:e")
	make_terminal_window()
	vim.cmd.terminal(string.format("run -dir %s -file %s -ext %s",current_dir,current_file,current_ext))
	vim.cmd.wincmd("h")
end

local function runexe_win()
	local current_dir = vim.fn.expand("%:h")
	local current_file = vim.fn.expand("%:t")
	local current_ext = vim.fn.expand("%:e")
	make_terminal_window()
	vim.cmd.terminal(string.format("runexe -dir %s -file %s -ext %s",current_dir,current_file,current_ext))
	vim.cmd.wincmd("h")
end


local function compile_cmd()
	vim.cmd(string.format(
		"!compile -dir %s -file %s -ext %s",
		vim.fn.expand("%:h"),
		vim.fn.expand("%:t"),
		vim.fn.expand("%:e")
	))
end

local function run_cmd()
	vim.cmd(string.format(
		"!run -dir %s -file %s -ext %s",
		vim.fn.expand("%:h"),
		vim.fn.expand("%:t"),
		vim.fn.expand("%:e")
	))
end

local function runexe_cmd()
	vim.cmd(string.format(
		"!runexe -dir %s -file %s -ext %s",
		vim.fn.expand("%:h"),
		vim.fn.expand("%:t"),
		vim.fn.expand("%:e")
	))
end


vim.api.nvim_create_user_command("Run",run_win,{})
vim.api.nvim_create_user_command("Compile",compile_win,{})
vim.api.nvim_create_user_command("RunExe",runexe_win,{})



local exports = {
	["make_terminal_window"] = make_terminal_window,
	["compile_cmd"] = compile_cmd,
	["run_cmd"] = run_cmd,
	["runexe_cmd"] = runexe_cmd,
	["compile_win"] = compile_win,
	["run_win"] = run_win,
	["runexe_win"] = runexe_win
}


return exports
