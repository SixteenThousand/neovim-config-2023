-- ++++++++++++ place for all the LSP configs ++++++++++++


-- vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
--   pattern = {"*.c", "*.h"},
--   callback = function(ev)
-- 	print(string.format('event fired: s', vim.inspect(ev)))
--   end
-- })

local function zeno(argstable)
	-- print("Hello!")
	print(argstable.args)
end
vim.api.nvim_create_user_command("Zeno",zeno,{nargs=1})
-- vim.cmd.command("-nargs=1 Zeno :echo
