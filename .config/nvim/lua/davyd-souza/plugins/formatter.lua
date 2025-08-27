return {
	"stevearc/conform.nvim",
	name = "conform",
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },

				javascript = { "prettier", "biome" },
				typescript = { "prettier", "biome" },
				javascriptreact = { "prettier", "biome" },
				typescriptreact = { "prettier", "biome" },

				astro = { "biome", "prettier", stop_after_first = true },
			},

			format_on_save = {
				timeout_ms = 500,
				lsp_format = "never",
				-- async = true,
			},
		})

		vim.api.nvim_create_autocmd("BufWritePre", {
			-- pattern = { ".lua" },
			pattern = "*",
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
