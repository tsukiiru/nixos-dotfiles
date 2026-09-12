return {
	{
		"saghen/blink.cmp",
		event = { "BufReadPost", "BufNewFile" },
		dependencies = { "onsails/lspkind.nvim" },

		version = "1.*",

		opts = {
			keymap = { preset = "enter" },

			appearance = {
				nerd_font_variant = "mono",
			},

			completion = {
				menu = {
					auto_show = true,

					draw = {
						columns = {
							{ "kind_icon" },
							{ "label", gap = 1 },
						},

						components = {
							label = {
								text = function(ctx)
									return require("colorful-menu").blink_components_text(ctx)
								end,

								highlight = function(ctx)
									return require("colorful-menu").blink_components_highlight(ctx)
								end,
							},

							kind_icon = {
								text = function(ctx)
									return require("lspkind").symbol_map[ctx.kind] or ""
								end,
							},
						},
					},
				},

				documentation = { auto_show = true, auto_show_delay_ms = 0 },
				trigger = { show_on_keyword = true },
				list = {

					selection = { preselect = true, auto_insert = true },
				},
				ghost_text = { enabled = true, show_with_menu = true },
			},

			sources = {
				default = { "lsp", "path" },
			},

			fuzzy = { implementation = "prefer_rust_with_warning" },
		},

		opts_extend = { "sources.default" },
	},
	--- bring your auto complete menu to life :D
	{
		"xzbdmw/colorful-menu.nvim",

		event = { "BufReadPost", "BufNewFile" },
	},
}
