return {
	"oxidescheme/nvim",
	lazy = false,
	priority = 1000,

	config = function()
		vim.cmd.colorscheme("oxide")
	end,
}
