return {
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
	},

	-- some highlighting
	{
		"RRethy/vim-illuminate",
		event = { "BufReadPost", "BufNewFile" },
	},

	-- inline diagnostic
	{
		"rachartier/tiny-inline-diagnostic.nvim",
		event = "VeryLazy",
		priority = 1000,
		config = function()
			require("tiny-inline-diagnostic").setup()
			vim.diagnostic.config({ virtual_text = false })
		end,
	},
}
