return {
	"stevearc/conform.nvim",
	event = { "BufReadPost", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				lua = { "stylua" },
				javascript = { "prettier" },
				rust = { "rust-analyzer" },
				html = { "prettier" },
				css = { "prettier" },
				python = { "black" },
				kdl = { "kdlfmt" },
				nix = { "nixfmt" },
				json = { "prettier " },
			},
			format_on_save = {
				timeout_ms = 1000,
				lsp_fallback = true,
				async = false,
			},
		})

		vim.keymap.set({ "n", "v" }, "<leader>mp", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			})
		end, { desc = "format file or range (visual mode)" })
	end,
}
