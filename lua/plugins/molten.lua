return {
	{
		"benlubas/molten-nvim",
		build = ":UpdateRemotePlugins",
		init = function()
			-- Configure global options before plugin loads
			vim.g.molten_auto_open_output = true
			vim.g.molten_virt_text_output = false
			vim.g.molten_image_provider = "snacks.nvim" -- Enable Kitty image support
			vim.g.molten_output_win_border = "rounded"
			vim.g.molten_tick_rate = 500
			vim.g.molten_enter_output_behavior = "open_and_focus"
			vim.g.molten_wrap_output = false
			vim.g.molten_show_mimetype_debug = false
			vim.g.molten_use_border_highlights = false
			vim.g.molten_silent = false
			vim.g.molten_auto_image_popup = true -- Enable image popups in Kitty
			vim.g.molten_max_console_lines = 1000
			vim.g.molten_output_virt_lines = false
			vim.g.molten_output_show_exec_time = true
			vim.g.molten_save_cell_history = true
			vim.g.molten_always_select_default_kernel = false
			vim.g.molten_console_open_on_start = false
			vim.g.molten_console_auto_focus = false
			vim.g.molten_auto_enter_output_on_start = false

			-- Kitty-specific optimizations
			vim.g.molten_output_crop_border = false
			vim.g.molten_use_kitty_graphics = true
			vim.g.molten_kitty_graphics_scale = 1.0
			vim.g.molten_kitty_graphics_max_width = 800
			vim.g.molten_kitty_graphics_max_height = 600
		end,
		keys = {
			-- Initialize kernel
			{ "<leader>mi", "<cmd>MoltenInit<CR>", desc = "Molten: Initialize kernel" },

			-- Evaluation commands
			{ "<leader>e", "<cmd>MoltenEvaluateOperator<CR>", desc = "Molten: Evaluate operator" },
			{
				"<leader>r",
				":<C-u>MoltenEvaluateVisual<CR>gv",
				mode = "v",
				desc = "Molten: Evaluate visual selection",
			},
			{ "<leader>l", "<cmd>MoltenEvaluateLine<CR>", desc = "Molten: Evaluate line" },

			-- Cell management
			{ "<leader>rc", "<cmd>MoltenReevaluateCell<CR>", desc = "Molten: Reevaluate cell" },
			{ "<leader>dc", "<cmd>MoltenDelete<CR>", desc = "Molten: Delete cell" },

			-- Output management
			{ "<leader>ho", "<cmd>MoltenHideOutput<CR>", desc = "Molten: Hide output" },
			{ "<leader>so", "<cmd>MoltenShowOutput<CR>", desc = "Molten: Show output" },
			{ "<leader>fo", "<cmd>noautocmd MoltenEnterOutput<CR>", desc = "Molten: Focus output" },

			-- Kernel management
			{ "<leader>kk", "<cmd>MoltenKernelRestart<CR>", desc = "Molten: Restart kernel" },
			{ "<leader>ki", "<cmd>MoltenKernelInterrupt<CR>", desc = "Molten: Interrupt kernel" },
			{ "<leader>ks", "<cmd>MoltenKernelStatus<CR>", desc = "Molten: Kernel status" },

			-- Import/Export
			{ "<leader>ie", "<cmd>MoltenExportOutput<CR>", desc = "Molten: Export output" },
			{ "<leader>ii", "<cmd>MoltenImportNotebook<CR>", desc = "Molten: Import notebook" },
			-- Run entire file or to cursor
			{
				"<leader>rf",
				"ggVG:<C-u>MoltenEvaluateVisual<CR>",
				desc = "Molten: Run entire file",
			},
			{
				"<leader>ru",
				"ggv:<C-u>MoltenEvaluateVisual<CR>",
				desc = "Molten: Run from start to cursor",
			},
		},
		ft = { "python", "julia", "r", "javascript", "typescript" },
	},
}
