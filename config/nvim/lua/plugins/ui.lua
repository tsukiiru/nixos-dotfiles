return {
	--- animations
	{ "sphamba/smear-cursor.nvim", opts = {
		cursor_color = "none",
		hide_target_hack = true,
	} },

	-- dashboard
	{
		"nvimdev/dashboard-nvim",
		event = "VimEnter",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			local function load_ascii_art(filepath)
				local file = io.open(filepath, "r")

				local lines = {}

				if file then
					for line in file:lines() do
						table.insert(lines, line)
					end
					file:close()
				end

				table.insert(lines, 1, "")
				table.insert(lines, "")

				return lines
			end

			require("dashboard").setup({
				config = {
					header = load_ascii_art(vim.fn.stdpath("config") .. "/ascii.txt"),
					project = {
						label = "recent projects:",
					},
					mru = {
						label = "recent files:",
					},
					shortcut = {
						{ icon = "󰒲 ", desc = "lazy", group = "shortcut_1", action = "Lazy", key = "l" },
						{
							icon = "󰍉 ",
							desc = "files",
							group = "shortcut_2",
							action = "Telescope find_files",
							key = "f",
						},
						{ icon = "  ", desc = "mason", group = "shortcut_4", action = "Mason", key = "m" },
						{ icon = "󰠜 ", desc = "quit", group = "shortcut_3", action = "qa", key = "q" },
					},
					footer = {
						"",
						"   don't forget to stay hydrated! :3",
					},
				},
			})

			vim.api.nvim_set_hl(0, "DashboardHeader", { link = "Green" })
			vim.api.nvim_set_hl(0, "DashboardFooter", { link = "Green" })
			vim.api.nvim_set_hl(0, "shortcut_1", { fg = "#9ccfd8" })
			vim.api.nvim_set_hl(0, "shortcut_2", { fg = "#ebbcba" })
			vim.api.nvim_set_hl(0, "shortcut_3", { fg = "#eb6f92" })
			vim.api.nvim_set_hl(0, "shortcut_4", { fg = "#c4a7e7" })
		end,
	},

	{
		"folke/snacks.nvim",
		lazy = false,
		priority = 1000,

		opts = {},
	},

	{
		"rcarriga/nvim-notify",
		event = "VeryLazy",
		opts = {
			background_colour = "None",
			stages = "slide",
		},
	},

	{

		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = {
			"folke/snacks.nvim",
			"rcarriga/nvim-notify",
		},

		opts = {
			lsp = {
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true,
				},
			},
			routes = {
				{
					filter = {
						event = "msg_show",
						any = {
							{ find = "%d+L, %d+B" },
							{ find = "; after #%d+" },
							{ find = "; before #%d+" },
						},
					},
					view = "mini",
				},
			},
			presets = {
				bottom_search = true,
				command_palette = true,
				long_message_to_split = true,
			},
		},
	},

	-- cool looking bar
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			local function folder()
				local full_dir = vim.fn.execute("pwd"):gsub("%z", "") -- also strip the null byte
				local dir = full_dir:match("([^/]+)$") -- only get the folder name
				return dir
			end

			local function arrow()
				return ""
			end

			local function left_separator()
				return ""
			end

			local function right_separator()
				return ""
			end

			require("lualine").setup({
				options = {
					theme = "auto",
					icons_enabled = true,
					component_separators = { left = "", right = "" },
					section_separators = { left = "", right = "" },
					globalstatus = true,
					hide = {
						statusline = false,
					},
				},
				extensions = {
					"nvim-tree",
					"trouble",
					"lazy",
				},
				sections = {
					lualine_a = {
						{
							"mode",
							fmt = function(str)
								return str:lower()
							end,
							separator = {
								left = left_separator(),
								right = right_separator(),
							},
						},
					},
					lualine_b = { { "branch", separator = { right = right_separator() } } },
					lualine_c = {
						{
							folder,
							separator = {
								left = "",
								right = "",
							},
							padding = {
								left = 1,
								right = 1,
							},
						},
						{
							arrow,
							separator = {
								left = "",
								right = "",
							},
							padding = {
								left = 0,
								right = 1,
							},
						},
						{
							"filetype",
							icon_only = true,
							separator = { left = "", right = "" },
							padding = {
								left = 1,
								right = 0,
							},
						},
						{
							"filename",
							separator = {
								left = "",
								right = "",
							},
							padding = 0,
						},
					},
					lualine_x = { "" },
					lualine_y = { "" },
					lualine_z = { "" },
				},
			})

			local highlights =
				{ "StatusLine", "StatusLineNC", "TabLine", "TabLineFill", "TabLineSel", "WinBar", "WinBarNC" }
			for _, hl in pairs(highlights) do
				vim.api.nvim_set_hl(0, hl, { bg = "none" })
			end
		end,
	},

	{
		"j-hui/fidget.nvim",
		opts = {},
	},

	-- telescope
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter", "sharkdp/fd", "nvim-lua/plenary.nvim" },
		config = function()
			require("telescope").setup({
				defaults = {
					layout_strategy = "vertical",
					layout_config = {
						center = {
							height = 1,
							width = 1,
							preview_cutoff = 40,
							prompt_position = "top",
						},
					},
				},
			})
			vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "none" })
			vim.api.nvim_set_hl(0, "TelescopePromptNormal", { bg = "none" })
			vim.api.nvim_set_hl(0, "TelescopePreviewNormal", { bg = "none" })
			vim.api.nvim_set_hl(0, "TelescopeResultsNormal", { bg = "none" })

			vim.api.nvim_set_hl(0, "TelescopeBorder", { fg = "none", bg = "none" })
			vim.api.nvim_set_hl(0, "TelescopePromptBorder", { fg = "none", bg = "none" })
			vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { fg = "none", bg = "none" })
			vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { fg = "none", bg = "none" })
		end,
	},

	-- nvimtree
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },

		config = function()
			require("nvim-tree").setup()

			vim.keymap.set("n", "<leader> e", ":NvimTreeToggle <CR>")

			vim.api.nvim_set_hl(0, "NvimTreeFolderName", { bold = true })
			vim.api.nvim_set_hl(0, "NvimTreeOpenedFolderName", { bold = true })
		end,
	},

	{
		"nvim-mini/mini.icons",
		lazy = true,
		opts = {
			file = {
				[".keep"] = { glyph = "󰊢", hl = "MiniIconsGrey" },
				["devcontainer.json"] = { glyph = "", hl = "MiniIconsAzure" },
			},
			filetype = {
				dotenv = { glyph = "", hl = "MiniIconsYellow" },
			},
		},
		init = function()
			package.preload["nvim-web-devicons"] = function()
				require("mini.icons").mock_nvim_web_devicons()
				return package.loaded["nvim-web-devicons"]
			end
		end,
	},

	{
		"nvim-mini/mini.indentscope",
		event = { "BufReadPost", "BufWritePost", "BufNewFile" },
		version = false, -- wait till new 0.7.0 release to put it back on semver
		opts = {
			-- symbol = "▏",
			symbol = "│",
			options = { try_as_border = true },
		},
		init = function()
			vim.api.nvim_create_autocmd("FileType", {
				pattern = {
					"Trouble",
					"alpha",
					"dashboard",
					"fzf",
					"help",
					"lazy",
					"mason",
					"neo-tree",
					"notify",
					"sidekick_terminal",
					"snacks_dashboard",
					"snacks_notif",
					"snacks_terminal",
					"snacks_win",
					"toggleterm",
					"trouble",
				},
				callback = function()
					vim.b.miniindentscope_disable = true
				end,
			})

			vim.api.nvim_create_autocmd("User", {
				pattern = "SnacksDashboardOpened",
				callback = function(data)
					vim.b[data.buf].miniindentscope_disable = true
				end,
			})
		end,
	},

	{
		"lukas-reineke/indent-blankline.nvim",
		event = { "BufReadPost", "BufWritePost", "BufNewFile" },
		opts = function()
			Snacks.toggle({
				name = "Indention Guides",
				get = function()
					return require("ibl.config").get_config(0).enabled
				end,
				set = function(state)
					require("ibl").setup_buffer(0, { enabled = state })
				end,
			}):map("<leader>ug")

			return {
				indent = {
					char = "│",
					tab_char = "│",
				},
				scope = { show_start = false, show_end = false, enabled = false },
				exclude = {
					filetypes = {
						"Trouble",
						"alpha",
						"dashboard",
						"help",
						"lazy",
						"mason",
						"neo-tree",
						"notify",
						"snacks_dashboard",
						"snacks_notif",
						"snacks_terminal",
						"snacks_win",
						"toggleterm",
						"trouble",
					},
				},
			}
		end,
		main = "ibl",
	},

	{
		"nvim-mini/mini.animate",
		event = "VeryLazy",
		cond = vim.g.neovide == nil,
		opts = function(_, opts)
			-- don't use animate when scrolling with the mouse
			local mouse_scrolled = false
			for _, scroll in ipairs({ "Up", "Down" }) do
				local key = "<ScrollWheel" .. scroll .. ">"
				vim.keymap.set({ "", "i" }, key, function()
					mouse_scrolled = true
					return key
				end, { expr = true })
			end

			vim.api.nvim_create_autocmd("FileType", {
				pattern = "grug-far",
				callback = function()
					vim.b.minianimate_disable = true
				end,
			})
			cursor =
				{ enable = false },
				-- schedule setting the mapping to override the default mapping from `keymaps.lua`
				-- seems `keymaps.lua` is the last event to execute on `VeryLazy` and it overwrites it
				vim.schedule(function()
					Snacks.toggle({
						name = "Mini Animate",
						get = function()
							return not vim.g.minianimate_disable
						end,
						set = function(state)
							vim.g.minianimate_disable = not state
						end,
					}):map("<leader>ua")
				end)

			local animate = require("mini.animate")
			return vim.tbl_deep_extend("force", opts, {
				resize = {
					timing = animate.gen_timing.linear({ duration = 50, unit = "total" }),
				},
				scroll = {
					timing = animate.gen_timing.linear({ duration = 150, unit = "total" }),
					subscroll = animate.gen_subscroll.equal({
						predicate = function(total_scroll)
							if mouse_scrolled then
								mouse_scrolled = false
								return false
							end
							return total_scroll > 1
						end,
					}),
				},
			})
		end,
	},
}
