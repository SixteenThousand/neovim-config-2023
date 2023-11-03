-- ++++++++++ leader key +++++++++++
vim.g.mapleader = " "


-- ++++++++++++ applying new configs ++++++++++++
vim.keymap.set("n","<F12>",function ()
	vim.cmd.source()
	print("Change applied!")
end)


-- +++++++++++++ navigation ++++++++++++
vim.keymap.set("n","<leader>ee",":buffer ")

vim.keymap.set("n","<leader>eh",function ()
	vim.cmd("Drex ~/Documents/Programs")
	vim.cmd.set("number")
end)

vim.keymap.set("n","<leader>ea",function ()
	vim.cmd("Drex ~/Documents/MyApps")
	vim.cmd.set("number")
end)

vim.keymap.set("n","e'",function ()
    vim.cmd("Drex ~/AppData/Local/nvim")
	vim.cmd.set("number")
end)

-- drex stuff
-- for when it inevitably goes wrong
vim.keymap.set("n","<leader>ed",":Drex")
vim.keymap.set("n","-", function ()
	if vim.bo.filetype == "drex" then
		require("drex.elements").open_parent_directory()
	else
		vim.cmd("Drex %:h")
	end
end)
vim.keymap.set("n","<CR>",function ()
	if vim.bo.filetype == "drex" then
		local elems = require("drex.elements")
		local line = vim.api.nvim_get_current_line()
		if require("drex.utils").is_directory(line) then
			elems.open_directory()
		else
			elems.expand_element()
		end
	else
		vim.cmd.normal("j")
	end
end)
-- *** not navigation stuff, but here to be close to the other <CR> remap ***
vim.keymap.set("i","<CR>","<leader><BS><CR>")

-- new tab stuff
function newtabex()
	local parent = vim.fn.expand("%:p:h")
	vim.cmd.tabnew()
	vim.cmd("Drex "..parent)
end
vim.keymap.set("n","<C-t>", newtabex) 
vim.keymap.set("i","<C-t>", newtabex)

-- ++++++++++++ opening a terminal (in a new tab) ++++++++++++
vim.keymap.set("n","<leader>tt",function ()
	vim.cmd("let @\"='cd "..vim.fn.expand("%:p:h").."'")
	vim.cmd.tabnew()
	vim.cmd.terminal()
end)
vim.keymap.set("n","<leader>th",function ()
	vim.cmd.startinsert()
	vim.cmd.stopinsert()
	vim.cmd.normal("p")
end)


-- ++++++++++++ vimtex/latex stuff ++++++++++++
vim.keymap.set("n","<leader>li","o\\item")
vim.keymap.set("n","<leader>le",function ()
	local env = vim.api.nvim_get_current_line():match("\\begin{(.*)}")
	if env == nil then
		print("Error: Not a latex environment!")
	else
		vim.cmd.normal("o\\end{"..env.."}")
		vim.cmd.stopinsert()
		vim.cmd.normal("O	")
	end
end)


-- ++++++++++++ telescope ++++++++++++
local tlscp = require "telescope.builtin"
vim.keymap.set("n","<leader>ff",function ()
	tlscp.find_files({
		["no_ignore"] = true,
		["search_dirs"] = {
			"C:/Users/thoma/Documents/Programs",
			"C:/Users/thoma/Douments/MyApps",
			"C:/Users/thoma/AppData/Local/nvim"
		}
	})
end)
vim.keymap.set("n","<leader>fg",tlscp.live_grep,{})
vim.keymap.set("n","<leader>fb",tlscp.buffers,{})
vim.keymap.set("n","<leader>fh",tlscp.help_tags,{})
vim.keymap.set("n","<leader>fc",tlscp.colorscheme)


-- ++++++++++++ git stuff (vim-fugitive) ++++++++++++
vim.keymap.set("n","<leader>gg",":Git ")
vim.keymap.set("n","<leader>gs",function () vim.cmd("Git status") end)
vim.keymap.set("n","<leader>ga",function ()
	vim.cmd("Git add -A")
	print("All Changes Staged! Proceed to commit!")
end)
vim.keymap.set("n","<leader>gc",":Git commit -m \"")
vim.keymap.set("n","<leader>gf",function ()
	vim.cmd("Git commit -F CommitMsg.txt")
	print("Committed from file <<CommitMsg.txt>>!")
end)
vim.keymap.set("n","<leader>gb",":Git branch ")


-- ++++++++++++ reload current file ++++++++++++
vim.keymap.set("n","<A-r>",function ()
	local current = vim.fn.expand("%:p")
	vim.cmd.Explore()
	vim.cmd.edit(current)
end)


-- +++++++++++++ comments ++++++++++++
local commapi = require("Comment.api")
-- for some reason, "<C-_>" translates to "Ctrl+/"
vim.keymap.set("n","<C-_>",commapi.toggle.linewise.current)
vim.keymap.set("i","<C-_>",commapi.toggle.linewise.current)
vim.keymap.set("v","<C-_>",commapi.toggle.linewise.current)
-- vim.keymap.set("n","<leader>--[[ _ ]]",commapi.call("toggle.linewise","g@"), {expr =  true})


-- ++++++++++++ copy & paste ++++++++++++
vim.keymap.set("n","<leader>y","\"+y")
vim.keymap.set("n","<leader>p","\"+p")
vim.keymap.set("v","<leader>y","\"+y")
vim.keymap.set("v","<leader>p","\"+p")
	-- these let me copy & paste with the outside world
vim.keymap.set("n", "<leader>d","\"_d")
vim.keymap.set("v", "<leader>d","\"_d")
	-- these send things to the void registry, never to be seen again
vim.keymap.set("n","<leader>xx","\"xd")
vim.keymap.set("n","<leader>xp","\"xp")
vim.keymap.set("v","<leader>xx","\"xd")
vim.keymap.set("v","<leader>xp","\"xp")


-- ++++++++++++ suggestions & completion ++++++++++++
vim.keymap.set("i","<C-c>","<C-n>")
vim.keymap.set("i","<C-d>","<C-y>")


-- ++++++++++++ sometimes I just can't be bothered to write stuff, y'know? ++++++++++++
-- print statements
local print_statements = {
	["java"] = "System.out.println(",
	["cs"] = "Console.WriteLine(",
	["rs"] = "println!(",
	["hs"] = "putStrLn ",
	["js"] = "console.log(",
	["html"] = "console.log(",
	["py"] = "print(",
	["lua"] = "print(",
	["c"] = "printf(\"%d\\n\", "
}
local function write_print_statement()
	vim.cmd.normal("i"..print_statements[vim.fn.expand("%:e")])
end
vim.keymap.set("i","<C-p>",write_print_statement)

-- comment headers
local function write_custom_message()
	vim.cmd.normal("i++++++++++++  ++++++++++++")
	vim.cmd.stopinsert()
	vim.cmd.normal("12h")
end
vim.keymap.set("i","<A-m>",write_custom_message)

-- highlight a place to be completed
vim.keymap.set("i","<A-S-m>","************")
-- end of line comments
local function debug_comment()
	vim.cmd.normal("gcAdebug") -- nice!!
end
vim.keymap.set("i","<A-/>",debug_comment)
vim.keymap.set("n","<A-/>",debug_comment)

local function tbc_comment()
	vim.cmd.normal("gcATBC")
end
vim.keymap.set("n","<A-b>",tbc_comment)
vim.keymap.set("i","<A-b>",tbc_comment)


-- ++++++++++++ searching/highlighting ++++++++++++
vim.keymap.set("n","<leader>\\",vim.cmd.nohlsearch)
	-- gets rid of any pesky search highlighting


-- ++++++++++++ set line numbering (& relativise it!) ++++++++++++
vim.keymap.set("n","<leader>#",function ()
	vim.cmd.set("number")
	vim.cmd.set("rnu!")
end)


-- ++++++++++++ changing modes +++++++++++++
vim.keymap.set("i","<C-v>",function ()
	vim.cmd.stopinsert()
	vim.cmd.Visual()
end)
vim.keymap.set("t","<C-[>","<C-\\><C-N>")
vim.keymap.set("t","<C-PageUp>","<C-\\><C-N><C-PageUp>")
vim.keymap.set("t","<C-PageDown>","<C-\\><C-N><C-PageDown>")


-- ++++++++++++ folding & scrollling +++++++++++++
vim.keymap.set("n","zf",function() vim.cmd.set("foldlevel="..vim.v.count) end)
vim.keymap.set("n","zh",function () vim.cmd("highlight Folded guibg=bg") end)
vim.keymap.set("n","J","<C-e>")
vim.keymap.set("n","K","<C-y>")
vim.keymap.set("n","<A-j>","<C-d>")
vim.keymap.set("n","<A-k>","<C-u>")


-- +++++++++++++ window stuff +++++++++++++
vim.keymap.set("n","<A-=>",function()
	vim.cmd.wincmd("10>")
end)
vim.keymap.set("n","<A-->",function()
	vim.cmd.wincmd("10<")
end)
-- exiting a buffer/window
vim.keymap.set("n","<A-w>",function ()
	local layout = vim.fn.winlayout()
	if layout[1] == "row" then
		vim.cmd.wincmd("l")
	elseif layout[1] == "col" then
		vim.cmd.wincmd("j")
	end
	vim.cmd.quit()
end)
vim.keymap.set("n","<C-A-w>",function ()
	local layout1 = vim.fn.winlayout()[1]
	if layout1 == "row" then 
		vim.cmd.wincmd("l")
	elseif layout1 == "col" then
		vim.cmd.wincmd("j")
	end
	vim.cmd.bdelete()
end)
vim.keymap.set("n","<C-A-d>",":bdelete term*<C-a><CR>")
-- navigating windows
basic_motions = {"h","j","k","l"}
for i = 1,4 do
	local mymap = string.format("<leader>w%s",basic_motions[i])
	vim.keymap.set("n",mymap,function ()
		vim.cmd.wincmd(basic_motions[i])
	end)
end


-- ++++++++++++ save a file ++++++++++++
vim.keymap.set("i","<C-s>",function()
	vim.cmd.stopinsert()
	vim.cmd.write()
end)
vim.keymap.set("n","<C-s>",vim.cmd.write)


-- ++++++++++++ using other modules that i wrote ++++++++++++

-- terminal stuff
local term = require("thom.terminal_stuff")
vim.keymap.set("n","<A-o>",term.compile_cmd)
vim.keymap.set("i","<A-o>",term.compile_cmd)
vim.keymap.set("n","<A-p>",term.run_cmd)
vim.keymap.set("i","<A-p>",term.run_cmd)
vim.keymap.set("n","<A-e>",term.runexe_cmd)
vim.keymap.set("i","<A-e>",term.runexe_cmd)
vim.keymap.set("n","<A-S-o>",term.compile_win)
vim.keymap.set("i","<A-S-o>",term.compile_win)
vim.keymap.set("n","<A-S-p>",term.run_win)
vim.keymap.set("i","<A-S-p>",term.run_win)
vim.keymap.set("n","<A-S-e>",term.runexe_win)
vim.keymap.set("i","<A-S-e>",term.runexe_win)


-- session stuff
local sessions = require "thom.sessions"
vim.keymap.set("n","<A-s>",LoadSession)
vim.keymap.set("n","<A-q>",SaveSession)

-- yona
vim.keymap.set("n","<A-i>",function () vim.cmd("Yona build") end)

-- colours
local colours = require("thom.colours")
vim.keymap.set("n","<leader>c",colours.colourscheme_popup)
-- see telescope for another keymap that does something very similar
vim.keymap.set("n","<F2>",function()
	vim.cmd.set("background=dark")
end)
vim.keymap.set("n","<F3>",function()
	vim.cmd.set("background=light")
end)
