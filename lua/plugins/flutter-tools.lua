return {
	{
		"nvim-flutter/flutter-tools.nvim",
    ft = {'dart', 'yaml'},
    enabled=false,
    init = function()
    end,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"stevearc/dressing.nvim", -- optional for vim.ui.select
		},
		config = true,
	},
}
