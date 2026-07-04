return {
	--- animations
	{ "sphamba/smear-cursor.nvim", opts = {} },
	{
		"karb94/neoscroll.nvim",
		opts = {
			mappings = {
				"<C-u>",
				"<C-d>",
				"<C-b>",
				"<C-f>",
				"<C-y>",
				"<C-e>",
				"zt",
				"zz",
				"zb",
			},
			hide_cursor = true,
		},
	}, -- i dont have the slightest idea whether this is working or not
	{ "rachartier/tiny-glimmer.nvim", opts = {} },

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
	--[[
	{
		"folke/snacks.nvim",
		lazy = false,
		priority = 1000,

		opts = {},
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

	},]]

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
				sections = {
					lualine_a = { "mode" },
					lualine_b = { "progress", "location" },
					lualine_c = { "" },
					lualine_x = { "" },
					lualine_y = { "" },
					lualine_z = { folder },
				},
			})
		end,
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
}
