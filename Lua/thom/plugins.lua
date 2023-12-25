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
-- 
require("lualine").setup({
    options = {
      section_separators = { left = '', right = '' },
      component_separators = { left = '', right = '' }
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
	-- navigate
	vim.keymap.set("n","o","<Plug>(fern-action-open:system)",{ buffer=true })
	vim.keymap.set("n","-","<Plug>(fern-action-leave)",{ buffer=true })
	vim.keymap.set("n","!","<Plug>(fern-action-hidden)",{ buffer=true })
	vim.keymap.set("n","l","<Plug>(fern-action-expand)",{ buffer=true })
	vim.keymap.set("n","h","<Plug>(fern-action-collapse)",{ buffer=true })
	vim.keymap.set("n","<CR>","<Plug>(fern-action-open-or-enter)",{ buffer=true })
	-- create & delete
	vim.keymap.set("n","N","<Plug>(fern-action-new-file)",{ buffer=true })
	vim.keymap.set("n","B","<Plug>(fern-action-new-dir)",{ buffer=true })
	vim.keymap.set("n","D","<Plug>(fern-action-trash)",{ buffer=true })
	-- cut/copy/paste
	vim.keymap.set({"n","v"},"m","<Plug>(fern-action-mark)",{ buffer=true })
	vim.keymap.set("n","x","<Plug>(fern-action-clipboard-move)",{ buffer=true })
	vim.keymap.set("n","c","<Plug>(fern-action-clipboard-copy)",{ buffer=true })
	vim.keymap.set("n","p","<Plug>(fern-action-clipboard-paste)",{ buffer=true })
	-- paths
	vim.keymap.set("n","yy","<Plug>(fern-action-yank:path)",{ buffer=true })
	vim.keymap.set("n","<leader>yy","\"+<Plug>(fern-action-yank:path)",{ buffer=true })
	-- other
	vim.keymap.set("n","t","<Plug>(fern-action-terminal)",{ buffer=true })
	vim.keymap.set("n","r","<Plug>(fern-action-rename)",{ buffer=true })
end
vim.cmd.autocmd("FileType fern lua fern_remaps()")
