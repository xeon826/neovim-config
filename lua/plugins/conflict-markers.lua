return {
	{
		"akinsho/git-conflict.nvim",
		version = "*",
    lazy=false,
		keys = {
			{ mode="n", "<leader>gcl", "<cmd>GitConflictListQf<cr>", { noremap = true, silent = true, desc = "Show list of current merge conflicts" } },
		},
		config = function(_, opts)
			require("git-conflict").setup({
				-- Enable default keymaps
				default_mappings = true,

				-- Disable default commands if you want to use your own
				-- default_commands = false,

				-- Highlight groups for conflicts
				highlights = {
					-- These must have background color
					incoming = 'DiffAdd',
					current = 'DiffText',
				},

				-- Additional options
				disable_diagnostics = false, -- This will conflict with the diagnostics if there are none, set to true if you want to disable it
				list_opener = 'copen', -- command to open the conflicts list
				debug = false, -- Enable debug logging
			})
		end,
	},
}


    -- co — choose ours
    -- ct — choose theirs
    -- cb — choose both
    -- c0 — choose none
    -- ]x — move to previous conflict
    -- [x — move to next conflict
