return {
	{
		"rachartier/tiny-inline-diagnostic.nvim",
    enabled = true,
    lazy = false,
		priority = 1000,
		config = function()
			require("tiny-inline-diagnostic").setup()
			-- vim.diagnostic.config({ virtual_text = false, virtual_lines = false }) -- Disable default virtual text
			vim.diagnostic.config({ virtual_text = false, virtual_lines = false }) -- Disable default virtual text
		end,
	},
}
