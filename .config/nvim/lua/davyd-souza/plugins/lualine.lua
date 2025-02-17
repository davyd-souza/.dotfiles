return {
	'nvim-lualine/lualine.nvim',
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	config = function()
		require('lualine').setup({
			options = {
				theme = 'catppuccin',
				section_separators = '',
				component_separators = '',
			},
			sections = {
				lualine_a = {'mode'},
				lualine_b = {
					{
						'buffers',
						show_filename_only = true,
						hide_filename_extension = false,
						show_modified_status = true,

						mode = 0,
					},
				},
				lualine_c = {'diff'},

				lualine_x = {
					{
						'diagnostics',

						sources = { 'nvim_lsp' },

						sections = { 'error', 'warn', 'info', 'hint' },
						diagostics_color = {
							error = 'DiagnosticError',
							warn = 'DiagnosticWarn',
							info = 'DiagnosticInfo',
							hint = 'DiagnosticHint',
						},

						symbols = {
							error = 'E',
							warn = 'W',
							info = 'I',
							hint = 'H'
						},

						colored = true,
						update_in_insert = false,
					},
				},
				lualine_y = {'encoding', 'filetype'},
				lualine_z = {'branch'},
			}
		})
	end,
}
