-- the place for all of the plugin configs


-- ++++++++++++ TELESCOPE ++++++++++++
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


-- ++++++++++++ VIMTEX ++++++++++++
vim.cmd("filetype plugin on")
-- this bit SHOULD be covered in packer.lua
-- require 'nvim-treesitter.configs'.setup {
-- 	ignore_install = { "latex" },
-- 	-- more stuff here
-- }


-- ++++++++++++ LUALINE ++++++++++++
-- note lualine is also mentioned in the  <A-r> remap in remap.lua
-- 
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


-- ++++++++++++ VIM-CLOSETAG ++++++++++++
vim.g.closetag_filenames = "*.html,*.xml,*.svg,*.js"
vim.g.closetag_filetypes = "html,xml,svg"
vim.g.closetag_emptyTags_caseSensitive = 1
vim.g.closetag_shortcut = ">"
vim.g.closetag_close_shortcut = "<C-A-F1>"
-- this one is designed to never be used


-- ++++++++++++ FERN ++++++++++++
vim.g["fern#renderer"] = "nerdfont"
vim.g["fern#disable_default_mappings"] = 1
function fern_remaps()
	vim.keymap.set("n","<leader>em",
		function ()
			print("Fish...?")
		end,
		{ buffer=true }
	)
	vim.keymap.set("n","o","<Plug>(fern-action-open:system)",{ buffer=true })
	vim.keymap.set("n","m","<Plug>(fern-action-mark:toggle)",{ buffer=true })
	vim.keymap.set("n","t","<Plug>(fern-action-terminal)",{ buffer=true })
	vim.keymap.set("n","-","<Plug>(fern-action-leave)",{ buffer=true })
	vim.keymap.set("n","N","<Plug>(fern-action-new-file)",{ buffer=true })
	vim.keymap.set("n","F","<Plug>(fern-action-new-dir)",{ buffer=true })
	vim.keymap.set("n","yy","<Plug>(fern-action-yank)",{ buffer=true })
	vim.keymap.set("n","!","<Plug>(fern-action-hidden)",{ buffer=true })
	vim.keymap.set("n","x","<Plug>(fern-action-move)",{ buffer=true })
	vim.keymap.set("n","c","<Plug>(fern-action-copy)",{ buffer=true })
	vim.keymap.set("n","<CR>","<Plug>(fern-action-open-or-enter)",{ buffer=true })
	vim.keymap.set("n","dd","<Plug>(fern-action-trash)",{ buffer=true })
	--[[ vim.api.nvim_create_user_command(
		"Path",
		function ()
			vim.cmd.normal("<Plug>(fern-action-yank:path)")
		end,
		{nargs=0}
	) ]]
end
vim.cmd.autocmd("FileType fern lua fern_remaps()")
