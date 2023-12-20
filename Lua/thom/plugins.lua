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
	hijack_netrw = true,
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


-- autoclose html/xml tags
vim.g.closetag_filenames = "*.html,*.xml,*.svg,*.js"
vim.g.closetag_filetypes = "html,xml,svg"
vim.g.closetag_emptyTags_caseSensitive = 1
vim.g.closetag_shortcut = ">"
vim.g.closetag_close_shortcut = "<C-A-F1>"
-- this one is designed to never be used

-- require("vim-jsx-pretty").setup()
