-- ++++++++++++ plugins (this is neovim, after all) ++++++++++++
require("thom.packer")
require("telescope").setup({
	vimgrep_arguments = {
		"rg",
		"--color=never",
		"--no-heading",
		"--with-filename",
		"--line-number",
		"--column",
		"--smart-case"
	}
})

require("drex.config").configure({
	-- hijack_netrw = true,
	keybindings = {
		["n"] = {
			["<C-t>"] = function ()
				vim.cmd.tabnew("~/Documents/MyApps")
			end
		}
	}
})

-- VimTeX stuff
vim.cmd("filetype plugin on")
-- this bit SHOULD be covered in packer.lua
-- require 'nvim-treesitter.configs'.setup {
-- 	ignore_install = { "latex" },
-- 	-- more stuff here
-- }


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
