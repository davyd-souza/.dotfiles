return {
	"folke/trouble.nvim",
	config = function()
		require("trouble").setup({})

		vim.keymap.set(
			"n",
			"<leader>td",
			"<cmd>Trouble diagnostics toggle focus=false filter.buf=0<CR>",
			{ desc = "[T]oggle Trouble [D]iagnostics Current Buffer" }
		)

		vim.keymap.set(
			"n",
			"<leader>tdp",
			"<cmd>Trouble diagnostics toggle<CR>",
			{ desc = "[T]oggle Trouble [D]iagnostics Project" }
		)

		vim.keymap.set("n", "<leader>tn", "<cmd> Trouble diagnostics next<CR>")

		vim.keymap.set("n", "<leader>tp", "<cmd> Trouble diagnostics prev<CR>")
	end,
}
