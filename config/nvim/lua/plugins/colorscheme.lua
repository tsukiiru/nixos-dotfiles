return {
	"thesimonho/kanagawa-paper",
  branch="neovim",
	lazy=false,
	priority=1000,
  opts = {},

	config=function()
		require("kanagawa-paper").setup({
      cache = true,
      dim_inactive=true
    })
		vim.cmd.colorscheme("kanagawa-paper-canvas")
	end,
}
