return {
	"stevearc/conform.nvim",
	event = { "BufReadPost", "BufNewFile" },
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				javascript = { "prettier" },
				rust = { "rust-analyzer" },
				html = { "prettier" },
				css = { "prettier" },
				python = { "black" },
				kdl = { "kdlfmt" },
        nix = {"nixfmt"},
        json = { "prettier "},
			},
			format_on_save = {
				timeout_ms = 500,
				lsp_fallback = true,
			},
		})
	end,
}
