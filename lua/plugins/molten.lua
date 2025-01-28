return {
	{
		"benlubas/molten-nvim",
		version = "^1.0.0", -- use version <2.0.0 to avoid breaking changes
		dependencies = { "3rd/image.nvim" },
		lazy = false,
		event = "VimEnter", -- Ensures it starts after Neovim finishes loading
		init = function()
			-- these are examples, not defaults. Please see the readme
			vim.g.molten_image_provider = "image.nvim"
			vim.g.molten_output_win_max_height = 20
      vim.g.molten_use_border_highlights = true
      vim.g.molten_output_win_border = { "", "━", "", "" }
      vim.g.molten_output_virt_lines = true
      vim.g.molten_image_location = 'float'

      -- vim.g.molten_auto_open_output = false
      -- vim.g.molten_image_location = "float"
      -- vim.g.molten_image_provider = "image.nvim"
      -- -- vim.g.molten_output_show_more = true
      -- vim.g.molten_output_win_border = { "", "━", "", "" }
      -- vim.g.molten_output_win_max_height = 12
      -- -- vim.g.molten_output_virt_lines = true
      -- vim.g.molten_virt_text_output = true
      -- vim.g.molten_use_border_highlights = true
      -- vim.g.molten_virt_lines_off_by_1 = true
      -- vim.g.molten_wrap_output = true
      -- vim.g.molten_tick_rate = 142
		end,
	},
}
