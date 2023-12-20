local popup = require "plenary.popup"


local colourschemes = {
	-- "delek",
	"desert",
	"elflord",
	"everforest; hard",
	-- "everforest; medium",
	-- "everforest; soft",
	"kanagawa-dragon",
	"kanagawa-lotus",
	"kanagawa-wave",
	"material-darker",
	"material-deep-ocean",
	"material-lighter",
	"material-oceanic",
	"material-palenight",
	"miasma",
	"murphy",
	"nord",
	"peachpuff",
	"rose-pine-dawn",
	"rose-pine-main",
	"rose-pine-moon",
	"sonokai",
	"summerfruit256",
	-- "tokyonight-day",
	-- "tokyonight-moon",
	-- "tokyonight-storm",
	"zellner"
}


local function change_colourscheme(_,scheme_option)
	if scheme_option:find(";") ~= nil then
		_,_,scheme_name,other_option = scheme_option:find("(.+); (.+)")
		if scheme_name == "everforest" then
			vim.g.everforest_background = other_option
		end
		vim.cmd.colorscheme(scheme_name)
	else
		vim.cmd.colorscheme(scheme_option)
	end
	vim.cmd("highlight Folded guibg=background")
end


local function colourscheme_popup()
	window = popup.create(colourschemes,{
		title = "Colourscheme",
		border = true,
		borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
		minwidth = 30,
		callback = change_colourscheme,
	})
	vim.cmd.set("number")
	vim.cmd.set("relativenumber")
end


-- user-defined syntax highlighting
vim.api.nvim_create_autocmd({"BufEnter"}, {
	pattern = {"*.podon"},
	command = "set syntax=podon"
})
vim.api.nvim_create_autocmd({"BufEnter"}, {
	pattern = {"*.fruit"},
	command = "set syntax=fruit"
})



local exports = {
	["colourscheme_popup"] = colourscheme_popup
}

return exports
