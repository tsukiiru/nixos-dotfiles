return {
	{
		"mason-org/mason.nvim",
		config = function()
			require("mason").setup()

			--- packages to install automatically
			local packages = {
				-- lsp
				"css-lsp",
				"html-lsp",
				"json-lsp",
				"typescript-language-server",
				"nil",
				-- fmt
				"prettier",
				"nixfmt",
				"kdlfmt",
				"stylua",
				-- both
				"rust-analyzer",
			}
			local reg = require("mason-registry")
			local to_install = {}

      reg.refresh()

			for pkg in pairs(packages) do
				if reg.has_package(pkg) and not reg.is_installed(pkg) then
					table.insert(to_install, pkg)
				end
			end

			if #to_install > 0 then
				vim.cmd(string.format("MasonInstall %s", table.concat(to_install, " ")))
			end
		end,
	},

	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = { "mason-org/mason.nvim" },
		config = function()
			require("mason-lspconfig").setup()
		end,
	},

	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPost", "BufNewFile" },
		dependencies = { "mason-org/mason-lspconfig.nvim", "saghen/blink.cmp" },

		vim.lsp.config("*", {
			capabilities = vim.tbl_deep_extend(
				"force",
				vim.lsp.protocol.make_client_capabilities(),
				require("blink.cmp").get_lsp_capabilities(),
				{
					textDocument = {
						semanticTokens = {
							multilineTokenSupport = true,
						},
					},
				}
			),
		}),

		vim.lsp.config("lua_ls", {
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
				},
			},
		}),
	},
}
