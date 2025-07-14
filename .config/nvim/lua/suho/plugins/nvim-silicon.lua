return {
	{
		"michaelrommel/nvim-silicon",
		lazy = true,
		cmd = "Silicon",
		main = "nvim-silicon",
		opts = {
			line_offset = function(args)
				return args.line1
			end,
			output = function()
				local folder = vim.fn.expand("~/Pictures/snippets/")
				-- create the folder if it doesn't exist
				vim.fn.mkdir(folder, "p")
				return folder .. os.date("screenshot_%Y%m%d_%H%M%S.png")
			end,
		},
		keys = {
			{
				"<leader>sc",
				function()
					require("nvim-silicon").clip()
				end,
				mode = "v",
				desc = "Copy code screenshot to clipboard",
			},
			{
				"<leader>S",
				function()
					require("nvim-silicon").file()
				end,
				mode = "v",
				desc = "Save code screenshot as file",
			},
			{
				"<leader>ss",
				function()
					require("nvim-silicon").shoot()
				end,
				mode = "v",
				desc = "Create code screenshot",
			},
		},
	},
}
