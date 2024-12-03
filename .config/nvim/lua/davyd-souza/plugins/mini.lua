return {
	"echasnovski/mini.nvim",
	config = function()
		local statusline = require("mini.statusline")

		statusline.setup({
			use_icons = vim.g.have_nerd_font,
		})

		statusline.section_location = function()
			return "%21:%-2v"
		end
	end,
}
