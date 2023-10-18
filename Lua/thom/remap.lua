-- ++++++++++ leader key +++++++++++
vim.g.mapleader = " "


-- ++++++++++++ applying new configs ++++++++++++
function apply_config()
	vim.cmd.source()
	vim.cmd.echo('"Change applied!"')
end
vim.keymap.set("n","<F12>",apply_config)


-- +++++++++++++ navigation ++++++++++++
vim.keymap.set("n","<leader>-",function()
	vim.cmd.Ex()
	vim.cmd.set("number")
end)

vim.keymap.set("n","<leader>hh",function ()
	vim.cmd.edit("~/Documents/Programs")
	vim.cmd.set("number")
end)

vim.keymap.set("n","<leader>ha",function ()
	vim.cmd.edit("~/Documents/MyApps")
	vim.cmd.set("number")
end)

vim.keymap.set("n","@",function ()
    vim.cmd("edit ~/AppData/Local/nvim")
	vim.cmd.set("number")
end)

vim.keymap.set("n","<leader>e",":buffer ")

vim.keymap.set("n","<leader>t",function ()
	vim.cmd("let @\"='cd C:/Users/thoma/"..vim.fn.expand("%:h").."'")
	vim.cmd.tabnew()
	vim.cmd.terminal()
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
vim.keymap.set("n","<leader>fc",tlscp.colorscheme,{})


-- ++++++++++++ git stuff ++++++++++++
vim.keymap.set("n","<leader>gg",":Git ")
vim.keymap.set("n","<leader>gs",function () vim.cmd("Git status") end)
vim.keymap.set("n","<leader>ga",function ()
	vim.cmd("Git add -A")
	print("All Changes Staged! Proceed to commit!")
end)
vim.keymap.set("n","<leader>gc",":Git commit -m ")
vim.keymap.set("n","<leader>gb",":Git branch ")
vim.keymap.set("n","<leader>gp",function ()
	vim.cmd("Git push")
end)
vim.keymap.set("n","<leader>gf",function ()
	vim.cmd("Git commit -F CommitMsg.txt")
	print("Committed from file <<CommitMsg.txt>>!")
end)


-- ++++++++++++ reload current file ++++++++++++
vim.keymap.set("n","<A-r>",function ()
	local current = vim.fn.expand("%:p")
	vim.cmd.Ex()
	vim.cmd.edit(current)
end)


-- ++++++++++++ new tab ++++++++++++
function newtabex()
	local parent = vim.fn.expand("%:h")
    vim.cmd.tabnew()
    vim.cmd("edit "..parent)
end
vim.keymap.set("n","<C-t>", newtabex) 
vim.keymap.set("i","<C-t>", newtabex)


-- +++++++++++++ comments ++++++++++++
local commapi = require("Comment.api")
-- for some reason, "<C-_>" translates to "Ctrl+/"
vim.keymap.set("n","<C-_>",commapi.toggle.linewise.current)
vim.keymap.set("i","<C-_>",commapi.toggle.linewise.current)
vim.keymap.set("v","<C-_>",commapi.toggle.linewise.current)
-- vim.keymap.set("n","<leader>--[[ _ ]]",commapi.call("toggle.linewise","g@"), {expr =  true})


-- ++++++++++++ copy & paste ++++++++++++
vim.keymap.set("n", "<leader>y","\"+y")
vim.keymap.set("n","<leader>p","\"+p")
vim.keymap.set("v","<leader>y","\"+y")
vim.keymap.set("v","<leader>p","\"+p")
	-- these let me copy & paste with the outside world
vim.keymap.set("n", "<leader>d","\"_d")
vim.keymap.set("v", "<leader>d","\"_d")
	-- these send things to the void registry, never to be seen again
vim.keymap.set("n","<leader>xx","\"xd")
vim.keymap.set("n","<leader>xp","\"xp")


-- ++++++++++++ suggestions & completion ++++++++++++
vim.keymap.set("i","<C-c>","<C-n>")
vim.keymap.set("i","<C-d>","<C-y>")
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


-- ++++++++++++ sometimes I just can't be bothered to write stuff, y'know? ++++++++++++
-- print statements
local print_statements = {
	["java"] = "System.out.println(",
	["cs"] = "Console.WriteLine(",
	["rs"] = "println!(",
	["hs"] = "putStrLn ",
	["js"] = "console.log(",
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

-- latex stuff
vim.keymap.set("n","<leader>li","a\\item")


-- ++++++++++++ searching/highlighting/colours ++++++++++++
vim.keymap.set("n","<leader>\\",vim.cmd.nohlsearch)
	-- gets rid of any pesky search highlighting


-- ++++++++++++ set line numbering (& relativise it!) ++++++++++++
vim.keymap.set("n","<leader>#",function ()
	vim.cmd.set("number")
	vim.cmd.set("rnu!")
end)


-- ++++++++++++ changing modes +++++++++++++
vim.keymap.set("i","<CR>","<leader><BS><CR>")
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
vim.keymap.set("n","<A-l>",function()
	vim.cmd.wincmd("10>")
end)
vim.keymap.set("n","<A-h>",function()
	vim.cmd.wincmd("10<")
end)

vim.keymap.set("n","<A-w>",function ()
	local layout = vim.fn.winlayout()
	if layout[1] == "row" then
		vim.cmd.wincmd("l")
	elseif layout[1] == "col" then
		vim.cmd.wincmd("j")
	end
	vim.cmd.quit()
end)
basic_motions = {"h","j","k","l"}
for i = 1,4 do
	local mymap = string.format("<C-%s>",basic_motions[i])
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


-- ++++++++++++ buffers ++++++++++++
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


-- ++++++++++++ using other modules that i wrote ++++++++++++


local terminal_stuff = require("thom.terminal_stuff")
vim.keymap.set("n","<A-o>",terminal_stuff.compile)
vim.keymap.set("i","<A-o>",terminal_stuff.compile)
vim.keymap.set("n","<A-p>",terminal_stuff.run)
vim.keymap.set("i","<A-p>",terminal_stuff.run)
vim.keymap.set("n","<A-e>",terminal_stuff.run_exe)
vim.keymap.set("i","<A-e>",terminal_stuff.run_exe)



local sessions = require "thom.sessions"
vim.keymap.set("n","<A-s>",LoadSession)
vim.keymap.set("n","<A-q>",SaveSession)


vim.keymap.set("n","<A-i>",function () vim.cmd("Yona build") end)

-- ++++++++++++ colours ++++++++++++
local colours = require("thom.colours")

vim.keymap.set("n","<leader>c",colours.colourscheme_popup)
-- see telescope for another keymap that does something very similar

vim.keymap.set("n","<F2>",function()
	vim.cmd.set("background=dark")
end)

vim.keymap.set("n","<F3>",function()
	vim.cmd.set("background=light")
end)
