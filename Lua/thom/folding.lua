-- ++++++++++++ folding settings ++++++++++++
-- see remap.lua for keymaps related to folding

function MyFoldText()
	return "+--- "..(vim.v.foldend-vim.v.foldstart+1).." lines: "..vim.fn.getline(vim.v.foldstart).." ..."
end

function MyFoldLevel(line_num)
	if vim.fn.getline(line_num) == "" then
		return 0
	else
		return math.floor(
			math.max(vim.fn.indent(line_num),
				vim.fn.indent(line_num-1),
				vim.fn.indent(line_num+1)
			) / 4 --tabstop
		)
	end
end

function MyPyFoldLevel(line_num)
	return math.max(
		vim.fn.indent(line_num),
		vim.fn.indent(line_num+1)
	)
end


vim.cmd.set("foldlevel=20")
vim.cmd.set("foldcolumn=2")
vim.cmd.autocmd("FileType * set foldmethod=expr")
	-- note foldmethod can be abbreviated to fdm,
	-- and can be set to syntax or indent
vim.opt.foldtext = "v:lua.MyFoldText()"
vim.cmd.set("fillchars+=fold:\\ ")
vim.cmd.autocmd("FileType * set foldexpr=v:lua.MyFoldLevel(v:lnum)")
vim.cmd.autocmd("FileType py set foldexpr=v:lua.MyPyFoldLevel(v:lnum)")
vim.cmd.autocmd("FileType hs set foldexpr=v:lua.MyPyFoldLevel(v:lnum)")
vim.cmd("highlight Folded guibg=background")
