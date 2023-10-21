-- default places search will look; note this used to be ".,/usr/include/,,"
	-- "**2" means "look at any subdirectory that are at most 2 levels down"
vim.cmd.set("path=.,~/Documents/Programs/**2/,~/Documents/O-Backup_Management/,,")

-- line numbers
vim.cmd.autocmd("FileType * set number")
vim.cmd.autocmd("FileType * set relativenumber")

-- indentation & autocommenting
vim.cmd.set("nosmarttab")
vim.cmd.set("shiftwidth=4")
vim.cmd.set("tabstop=4")
vim.cmd.set("cpoptions+=I")
	-- means autoindenting doesn't get deleted all the time
vim.cmd.autocmd("FileType lisp set nolisp")
vim.cmd.autocmd("FileType * set noexpandtab")
vim.cmd.autocmd("FileType * set formatoptions-=r formatoptions-=c formatoptions-=o")

-- autoclose html/xml tags
vim.g.closetag_filenames = "*.html,*.xml,*.svg"
vim.g.closetag_filetypes = "html,xml,svg"
vim.g.closetag_emptyTags_caseSensitive = 1
vim.g.closetag_shortcut = ">"
vim.g.closetag_close_shortcut = "<C-A-F1>"
-- this one is designed to never be used

-- buffers?? save?? saving?? idk what to call this bit
vim.cmd.set("autowrite")
vim.opt.scrolloff = 4
	-- keeps at least {number} lines beneath the cursor (unless at end of file)

-- close & reload settings
vim.cmd.set("autowriteall")

-- allow h & l to take you to a new line
vim.cmd.set("whichwrap=b,s,h,l")


-- trying to deal with drex bug
-- vim.api.nvim_create_autocmd("SessionLoadPost",{
-- 	pattern = "drex://*",
-- 	nested = true,
-- 	callback = function ()
-- 		print("We got here!")
-- 	end,
-- })
