return {
	"stevearc/conform.nvim",
	name = "conform",
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },

				javascript = { "prettier", "biome", stop_after_first = true },
				typescript = { "prettier", "biome", stop_after_first = true },
				javascriptreact = { "prettier", "biome", stop_after_first = true },
				typescriptreact = { "prettier", "biome", stop_after_first = true },

				-- astro = { "biome", "prettier", stop_after_first = true },
			},

			format_on_save = {
				timeout_ms = 500,
				lsp_format = "fallback",
				-- async = true,
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

		vim.keymap.set("n", "<leader>f", function()
			require("conform").format({ async = true, lsp_fallback = true })
		end, { desc = "[F]ormat File" })
	end,
}
