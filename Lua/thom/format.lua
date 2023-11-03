local pymat = "python C:\\Users\\thoma\\Documents\\MyApps\\PyMat\\pymat.py "
vim.api.nvim_create_user_command(
	"Format",
	function ()
		local current = vim.fn.expand("%:p")
		vim.fn.jobstart(pymat..current)
		vim.cmd.Explore()
		vim.cmd.edit(current) -- reloads the current buffer
	end,
	{}
)
