return {
	"nvim-neotest/neotest-python",
	dependencies = {
		"nvim-neotest/neotest",
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	config = function()
		require("neotest").setup({
			adapters = {
				require("neotest-python")({
					dap = { justMyCode = false },
					args = { "--reuse-db" },
					runner = "pytest",
				}),
			},
		})

		-- Keymap: Open neotest output in a vertical split
		vim.keymap.set("n", "<leader>to", function()
			require("neotest").output.open({
				enter = true,
				short = false,
				open_win = function(bufnr)
					vim.cmd("vsplit")
					local win = vim.api.nvim_get_current_win()
					if type(bufnr) == "number" and vim.api.nvim_buf_is_valid(bufnr) then
						vim.api.nvim_win_set_buf(win, bufnr)
					else
						vim.notify("Invalid buffer for neotest output", vim.log.levels.ERROR)
					end
				end,
			})
		end, { desc = "Neotest Output (vsplit)" })
	end,
}
