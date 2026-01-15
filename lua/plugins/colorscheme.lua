--
-- ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
-- ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
-- ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
-- ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
-- ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
-- ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
--
-- File: plugins/colorscheme.lua
-- Description: Colorscheme config
-- Author: Kien Nguyen-Tuan <kiennt2609@gmail.com>
return {
	{
		-- Rose-pine - Soho vibes for Neovim
		"rose-pine/neovim",
		name = "rose-pine",
		opts = {
			dark_variant = "main",
		},
	},
	{
		"https://github.com/xeon826/oxocarbon.nvim",
		dir = "~/git_clones/oxocarbon.nvim",
		name = "oxocarbon",
		lazy = false,
		event = "VimEnter", -- Ensures it starts after Neovim finishes loading
		-- Add in any other configuration;
		--   event = foo,
		--   config = bar
		--   end,
	},
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},
}
