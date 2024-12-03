return {
	"stevearc/conform.nvim",
	name = "conform",
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },

				javascript = { "biome", "prettierd", stop_after_first = true },
				typescript = { "biome", "prettierd", stop_after_first = true },
				javascriptreact = { "biome", "prettierd", stop_after_first = true },
				typescriptreact = { "biome", "prettierd", stop_after_first = true },
			},

			format_on_save = {
				timeout_ms = 500,
				lsp_format = "fallback",
			},
		})

		vim.api.nvim_create_autocmd("BufWritePre", {
			pattern = "*",
			callback = function(args)
				require("conform").format({ bufnr = args.buf })
			end,
		})

		vim.keymap.set("n", "<leader>f", function()
			require("conform").format({ async = true, lsp_format = "fallback" })
		end, { desc = "[F]ormat Buffer" })
	end,
}
