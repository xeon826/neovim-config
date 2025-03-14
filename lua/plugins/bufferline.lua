local utils = require("config/utils")
return {
	{
		"akinsho/bufferline.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		keys = {
			{ "<C-S-L>", "<cmd>BufferLineMoveNext<CR>", { noremap = true, silent = true, desc = "Move buffer right" } },
			{ "<C-S-H>", "<cmd>BufferLineMovePrev<CR>", { noremap = true, silent = true, desc = "Move buffer left" } },
			{ "<S-h>", "<cmd>BufferLineCyclePrev<CR>", { noremap = true, silent = true, desc = "Previous buffer" } },
			{ "<S-l>", "<cmd>BufferLineCycleNext<CR>", { noremap = true, silent = true, desc = "Next buffer" } },
			{
				"<leader>bd",
				function()
					-- Get current buffer number
					local current_buf = vim.api.nvim_get_current_buf()

					-- Check if nvim-tree is loaded and visible
					local nvim_tree_loaded = package.loaded["nvim-tree"]
					if nvim_tree_loaded then
						local api = require("nvim-tree.api")
						if api.tree.is_visible() then
							api.tree.close()
						end
					end

					-- Close the current buffer using bdelete
					vim.cmd("bdelete " .. current_buf)
				end,
				{ noremap = true, silent = true, desc = "Delete current buffer" },
			},
			{
				"<leader>bp",
				"<cmd>BufferLineTogglePin<CR>",
				{ noremap = true, silent = true, desc = "Toggle pin for current buffer" },
			},
			{
				"<leader>bco",
				"<cmd>BufferLineCloseOthers<CR>",
				{ noremap = true, silent = true, desc = "Close all aside from the current buffer" },
			},
		},
		config = function()
			local bufferline = require("bufferline")
			bufferline.setup({
				options = {
					separator_styling = "padded_slope",
				},
			})
		end,
		event = "VimEnter",
	},
}
