return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	main = "nvim-treesitter.configs",
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"lua",
				"vim",
				"vimdoc",
				"bash",
				"css",
				"html",
				"javascript",
				"lua",
				"luadoc",
				"typescript",
			},

			sync_install = false,

			auto_install = true,

			ignore_install = {},

			modules = {},

			indent = {
				enable = true,
			},

			hightlight = {
				enable = true,

				additional_vim_regex_highlighting = false,
			},
		})
	end,
}
