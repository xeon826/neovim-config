return {
	{
		"nvim-python-repl",
    dir = '~/git_clones/nvim-python-repl',  -- Replace with the actual path to your plugin
		dependencies = "nvim-treesitter",
		ft = { "python", "lua", "scala" },
		config = function()
			require("nvim-python-repl").setup({
				execute_on_send = true,
				vsplit = true,
				prompt_spawn = false,
				spawn_command = {
					python = "ipython",
					scala = "sbt console",
					lua = "ilua",
				},
			})
		end,
	},
}

