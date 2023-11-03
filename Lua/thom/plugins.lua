-- the place for all of the plugin configs

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
				local parent = vim.fn.expand("%:p:h")
				vim.cmd.tabnew()
				vim.cmd("Drex "..parent)
				print("We got here!")
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

require("lualine").setup({
    options = {
      section_separators = { left = '', right = '' },
      component_separators = { left = '', right = '' }
    },
	sections = {
		lualine_x = {"encoding","fileformat","filesize","filetype"},
		lualine_y = {"progress"},
		lualine_z = {"location"}
	}
})
