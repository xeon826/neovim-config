return {
	{
		"rachartier/tiny-inline-diagnostic.nvim",
    enabled = false,
    lazy = false,
		priority = 1000,
		config = function()
			require("tiny-inline-diagnostic").setup()
		end,
	},
}
