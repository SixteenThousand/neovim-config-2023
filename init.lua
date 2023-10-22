-- ++++++++++++ plugins (this is neovim, after all) ++++++++++++
require("thom.packer")
require("thom.plugins")


-- making it use PowerShell (v7)
require("thom.pwsh")

-- appearance
require("thom.colours")
require("lualine").setup()
require("thom.folding")

-- general settings
require("thom.remap")
require("thom.settings")
require("thom.sessions")
require("thom.yona")

-- misc. user-defined functions
require("thom.functions")


-- ++++++++++++ Some default settings +++++++++++
vim.cmd.colorscheme("sonokai")
vim.cmd.highlight("Folded guibg=bg")
vim.cmd.highlight("Folded guifg=fg")


-- ++++++++++++ start message ++++++++++++
print("...and it goes on...")
for i=1,20 do
	print("~\n")
end
