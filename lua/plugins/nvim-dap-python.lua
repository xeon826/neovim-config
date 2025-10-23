return {
	"mfussenegger/nvim-dap-python",
	dependencies = {
		"mfussenegger/nvim-dap",
		-- optional, for test runner features:
		{ "nvim-treesitter/nvim-treesitter", opts = { ensure_installed = { "python" } } },
	},
	ft = "python",
	config = function()
		-- Set up with your python interpreter (adjust the path as needed)
		require("dap-python").setup("python3")
		-- require("dap-python").setup("poetry run python")
  --   require('dap-python').test_runner = 'pytest'

		-- Keymaps for basic functionality
		local map = vim.keymap.set
		map("n", "<leader>dn", function()
			require("dap-python").test_method()
		end, { desc = "Debug Python Method" })
		map("n", "<leader>df", function()
			require("dap-python").test_class()
		end, { desc = "Debug Python Class" })
		map("v", "<leader>ds", function()
			require("dap-python").debug_selection()
		end, { desc = "Debug Python Selection" })
	end,
}
