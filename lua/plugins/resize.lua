return {
	"0xm4n/resize.nvim",
  enabled=false,
	keys = {
		{ "<C-Left>", "<cmd>lua require('resize').ResizeLeft()<CR>", mode = "n", silent = true },
		{ "<C-Right>", "<cmd>lua require('resize').ResizeRight()<CR>", mode = "n", silent = true },
		{ "<C-Up>", "<cmd>lua require('resize').ResizeUp()<CR>", mode = "n", silent = true },
		{ "<C-Down>", "<cmd>lua require('resize').ResizeDown()<CR>", mode = "n", silent = true },
	},
	config = function()
		-- Any additional configuration can go here
	end,
}
