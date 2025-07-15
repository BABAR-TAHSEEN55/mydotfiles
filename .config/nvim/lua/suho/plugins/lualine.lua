return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local lualine = require("lualine")
		local lazy_status = require("lazy.status") -- for lazy.nvim updates

		-- Gruvbox Dark Hard palette
		local colors = {
			bg = "#1d2021", -- background (hard)
			fg = "#ebdbb2", -- foreground
			red = "#fb4934",
			green = "#b8bb26",
			yellow = "#fabd2f",
			blue = "#83a598",
			purple = "#d3869b",
			aqua = "#8ec07c",
			gray = "#928374",
			bg_alt = "#3c3836",
		}

		local gruvbox_theme = {
			normal = {
				a = { fg = colors.bg, bg = colors.blue, gui = "bold" },
				b = { fg = colors.fg, bg = colors.bg_alt },
				c = { fg = colors.fg, bg = colors.bg_alt },
			},
			insert = {
				a = { fg = colors.bg, bg = colors.green, gui = "bold" },
				b = { fg = colors.fg, bg = colors.bg_alt },
			},
			visual = {
				a = { fg = colors.bg, bg = colors.purple, gui = "bold" },
				b = { fg = colors.fg, bg = colors.bg_alt },
			},
			replace = {
				a = { fg = colors.bg, bg = colors.red, gui = "bold" },
				b = { fg = colors.fg, bg = colors.bg_alt },
			},
			inactive = {
				a = { fg = colors.gray, bg = colors.bg_alt, gui = "bold" },
				b = { fg = colors.gray, bg = colors.bg_alt },
				c = { fg = colors.gray, bg = colors.bg_alt },
			},
		}

		local mode = {
			"mode",
			fmt = function(str)
				return " " .. str
			end,
		}

		local diff = {
			"diff",
			colored = true,
			symbols = { added = " ", modified = " ", removed = " " },
		}

		local filename = {
			"filename",
			file_status = true,
			path = 0,
		}

		local branch = {
			"branch",
			icon = { "", color = { fg = colors.blue } },
			separator = "|",
		}

		lualine.setup({
			icons_enabled = true,
			options = {
				theme = gruvbox_theme,
				component_separators = { left = "|", right = "|" },
				section_separators = { left = "|", right = "" },
			},
			sections = {
				lualine_a = { mode },
				lualine_b = { branch },
				lualine_c = { diff, filename },
				lualine_x = {
					{
						lazy_status.updates,
						cond = lazy_status.has_updates,
						color = { fg = colors.yellow },
					},
					{ "filetype" },
				},
			},
		})
	end,
}
