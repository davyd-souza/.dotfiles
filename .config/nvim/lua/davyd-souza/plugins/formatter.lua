return {
	"stevearc/conform.nvim",
	name = "conform",
	config = function()
		print("format")
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },

				javascript = { "prettier", "biome", stop_after_first = true },
				typescript = { "prettier", "biome", stop_after_first = true },
				javascriptreact = { "prettier", "biome", stop_after_first = true, lsp_format = "never" },
				typescriptreact = { "prettier", "biome", stop_after_first = true, lsp_format = "never" },
			},

			format_on_save = {
				timeout_ms = 100,
				lsp_format = "fallback",
			},
		})

		vim.api.nvim_create_autocmd("BufWritePre", {
			pattern = { ".lua" },
			callback = function(args)
				--[[
				local ignore_ft = { "%.tsx?$", "%.jsx?$" }

				for _, pattern in ipairs(ignore_ft) do
					if args.file and args.file:match(pattern) then
						return
					end
				end
				]]
				--

				require("conform").format({ bufnr = args.buf })
			end,
		})
	end,
}
