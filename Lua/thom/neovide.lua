-- ++++++++++++ neovide specific configs ++++++++++++
-- (checking whether we are in neovide or not is checked in init.lua)
function neovide_warning()
	print("Currently in neovide!")
end
-- see remap.lua for more details on <C-_>
vim.keymap.set("n","<C-_>",neovide_warning)
vim.keymap.set("i","<C-_>",neovide_warning)
vim.keymap.set("v","<C-_>",neovide_warning)

local commapi = require("Comment.api")
vim.keymap.set("n","<C-/>",commapi.toggle.linewise.current)
vim.keymap.set("i","<C-/>",commapi.toggle.linewise.current)
vim.keymap.set("v","<C-/>",commapi.toggle.linewise.current)


vim.o.guifont = "Agave Nerd Font Mono:h11"

vim.g.neovide_transparency = 0.8
-- vim.api.nvim_create_user_command("Trans",
-- 	function (opts)
-- 		vim.g.neovide_transparency = opts.fargs[1]
-- 	end,
-- 	{nargs="*"}
-- )
