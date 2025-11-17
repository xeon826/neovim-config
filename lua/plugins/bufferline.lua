local utils = require("config/utils")
return {
	{
		"akinsho/bufferline.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		keys = {
			{ "<C-A-L>", "<cmd>BufferLineMoveNext<CR>", noremap = true, silent = true, desc = "Move buffer right" },
			{ "<C-A-H>", "<cmd>BufferLineMovePrev<CR>", noremap = true, silent = true, desc = "Move buffer left" },
			{ "<S-h>", "<cmd>BufferLineCyclePrev<CR>", noremap = true, silent = true, desc = "Previous buffer" },
			{ "<S-l>", "<cmd>BufferLineCycleNext<CR>", noremap = true, silent = true, desc = "Next buffer" },
			-- {
			-- 	"<leader>bd",
			-- 	function()
			-- 		-- Get current buffer number
			-- 		local current_buf = vim.api.nvim_get_current_buf()

			-- 		-- Check if nvim-tree is loaded and visible
			-- 		local nvim_tree_loaded = package.loaded["nvim-tree"]
			-- 		if nvim_tree_loaded then
			-- 			local api = require("nvim-tree.api")
			-- 			if api.tree.is_visible() then
			-- 				api.tree.close()
			-- 			end
			-- 		end

			-- 		-- Close the current buffer using bdelete
			-- 		vim.cmd("bdelete " .. current_buf)
			-- 	end,
			-- 	noremap = true,
			-- 	silent = true,
			-- 	desc = "Delete current buffer"
			-- },
			{
				"<leader>btp",
				"<cmd>BufferLineTogglePin<CR>",
				noremap = true,
				silent = true,
				desc = "Toggle pin for current buffer"
			},
			{
				"<leader>bco",
				"<cmd>BufferLineCloseOthers<CR>",
				noremap = true,
				silent = true,
				desc = "Close all aside from the current buffer"
			},
			{
				"<leader>bcr",
				"<cmd>BufferLineCloseRight<CR>",
				noremap = true,
				silent = true,
				desc = "Close tab to the right"
			},
			{
				"<leader>bcl",
				"<cmd>BufferLineCloseLeft<CR>",
				noremap = true,
				silent = true,
				desc = "Close tab to the left"
			},
			{
				"<leader>bp",
				"<cmd>BufferLinePick<CR>",
				noremap = true,
				silent = true,
				desc = "Buffer line pick"
			},
			{
				"<leader>bcp",
				"<cmd>BufferLinePickClose<CR>",
				noremap = true,
				silent = true,
				desc = "Buffer line close pick"
			},
		},
		config = function()
			local bufferline = require("bufferline")
			bufferline.setup({
				options = {
					separator_styling = "padded_slope",
          indicator = { style = 'underline' }
				},
				highlights = {
					-- Background for inactive buffers
					background = {
						fg = "#d0d0d0",  -- base04 (light text) - light foreground for inactive
						bg = "#161616",  -- base00 (dark background)
					},
					-- Selected buffer - using aquamarine (base08) for active tabs
					buffer_selected = {
						fg = "#161616",  -- base00 (dark foreground) - dark text for active
						bg = "#3ddbd9",  -- base08 (aquamarine/light cyan)
						bold = true,
					},
					-- Visible but not selected buffers
					buffer_visible = {
						fg = "#d0d0d0",  -- base04 (light text) - light foreground for inactive
						bg = "#262626",  -- base01 (darker gray)
					},
					-- Fill (background of the entire bufferline)
					fill = {
						bg = "#131313",  -- blend (slightly darker than base00)
					},
					-- Separators between buffers
					separator = {
						fg = "#393939",  -- base02 (medium gray)
						bg = "#131313",  -- blend
					},
					separator_selected = {
						fg = "#525252",  -- base03 (light gray)
						bg = "#131313",  -- blend
					},
					-- Close button
					close_button = {
						fg = "#525252",  -- base03 (light gray)
						bg = "#161616",  -- base00
					},
					close_button_selected = {
						fg = "#161616",  -- base00 (dark foreground)
						bg = "#3ddbd9",  -- base08 (aquamarine)
					},
					-- Modified buffers (unsaved changes)
					modified = {
						fg = "#78a9ff",  -- base09 (light blue)
						bg = "#161616",  -- base00
					},
					modified_selected = {
						fg = "#161616",  -- base00 (dark foreground)
						bg = "#3ddbd9",  -- base08 (aquamarine)
					},
					-- Diagnostic indicators
					diagnostic = {
						fg = "#ee5396",  -- base10 (pink/magenta) for errors
						bg = "#161616",  -- base00
					},
					diagnostic_selected = {
						fg = "#161616",  -- base00 (dark foreground)
						bg = "#3ddbd9",  -- base08 (aquamarine)
						bold = true,
					},
					-- Info diagnostic
					info_diagnostic = {
						fg = "#33b1ff",  -- base11 (bright blue)
						bg = "#161616",  -- base00
					},
					info_diagnostic_selected = {
						fg = "#161616",  -- base00 (dark foreground)
						bg = "#3ddbd9",  -- base08 (aquamarine)
					},
					-- Warning diagnostic
					warning_diagnostic = {
						fg = "#ff7eb6",  -- base12 (light pink)
						bg = "#161616",  -- base00
					},
					warning_diagnostic_selected = {
						fg = "#161616",  -- base00 (dark foreground)
						bg = "#3ddbd9",  -- base08 (aquamarine)
					},
					-- Hint diagnostic
					hint_diagnostic = {
						fg = "#42be65",  -- base13 (green)
						bg = "#161616",  -- base00
					},
					hint_diagnostic_selected = {
						fg = "#161616",  -- base00 (dark foreground)
						bg = "#3ddbd9",  -- base08 (aquamarine)
					},
				},

			})
		end,
		event = "VimEnter",
	},
}
