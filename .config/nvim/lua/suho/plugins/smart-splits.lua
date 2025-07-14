return {
	"mrjones2014/smart-splits.nvim",
	lazy = true,
	event = { "BufRead", "InsertEnter", "BufNewFile" },
	opts = {
		ignored_filetypes = {
			"nofile",
			"quickfix",
			"qf",
			"prompt",
		},
		ignored_buftypes = { "nofile" },
	},
	config = function(_, opts)
		require("smart-splits").setup(opts)
		vim.keymap.set("n", "<A-h>", require("smart-splits").resize_left)
		vim.keymap.set("n", "<A-j>", require("smart-splits").resize_down)
		vim.keymap.set("n", "<A-k>", require("smart-splits").resize_up)
		vim.keymap.set("n", "<A-l>", require("smart-splits").resize_right)
	end,
}
