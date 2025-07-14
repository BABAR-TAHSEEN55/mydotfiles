return {
	{
		"b0o/incline.nvim",
		enabled = true,
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			local devicons = require("nvim-web-devicons")

			require("incline").setup({
				hide = {
					only_win = false,
				},
				render = function(props)
					local bufname = vim.api.nvim_buf_get_name(props.buf)
					local filename = vim.fn.fnamemodify(bufname, ":t")
					if filename == "" then
						filename = "[No Name]"
					end

					local ext = vim.fn.fnamemodify(bufname, ":e")
					local icon, _ = devicons.get_icon(filename, ext, { default = true })

					local modified = vim.bo[props.buf].modified

					return {
						{ " ", icon, " ", guifg = "#d33682" }, -- Cyan for icon
						{ filename, gui = modified and "bold" or "none" },
						modified and { " [+]", guifg = "#dc322f" } or "",
						" ",
					}
				end,
			})
		end,
	},
}
