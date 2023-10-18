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

-- sometimes it's nice to just jump back into powershell
function ToTerminal()
	-- local dir = vim.fn.expand("%:h")
	make_terminal_window()
end




local function compile()
	local current_dir = vim.fn.expand("%:h")
	local current_file = vim.fn.expand("%:t")
	local current_ext = vim.fn.expand("%:e")
	make_terminal_window()
	vim.cmd.terminal(string.format("compile -dir %s -file %s -ext %s",current_dir,current_file,current_ext))
	vim.cmd.wincmd("h")
end

local function run()
	local current_file = vim.fn.expand("%:t")
	local current_dir = vim.fn.expand("%:h")
	local current_ext = vim.fn.expand("%:e")
	make_terminal_window()
	vim.cmd.terminal(string.format("run -dir %s -file %s -ext %s",current_dir,current_file,current_ext))
	vim.cmd.wincmd("h")
end

local function run_exe()
	local current_dir = vim.fn.expand("%:h")
	local current_file = vim.fn.expand("%:t")
	local current_ext = vim.fn.expand("%:e")
	make_terminal_window()
	vim.cmd.terminal(string.format("runexe -dir %s -file %s -ext %s",current_dir,current_file,current_ext))
	vim.cmd.wincmd("h")
end


local exports = {
	["make_terminal_window"] = make_terminal_window,
	["compile"] = compile,
	["run"] = run,
	["run_exe"] = run_exe,
}


return exports
