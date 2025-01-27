return {
	{
		-- see the image.nvim readme for more information about configuring this plugin
		"3rd/image.nvim",
		-- version = "1.1.0",
		lazy = false,
		event = "VimEnter", -- Ensures it starts after Neovim finishes loading
		opts = {
			backend = "kitty", -- whatever backend you would like to use
			processor = "magick_rock",
			max_width = 100,
			max_height = 12,
			max_height_window_percentage = math.huge,
			max_width_window_percentage = math.huge,
			window_overlap_clear_enabled = true, -- toggles images when windows are overlapped
			window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
		},
	},
}
