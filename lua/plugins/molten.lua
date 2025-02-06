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
      vim.g.molten_save_path = '.'
      vim.g.molten_auto_open_output = false
      vim.g.molten_output_win_hide_on_leave = true
      vim.g.molten_virt_text_max_lines = 50

		end,
	},
}
