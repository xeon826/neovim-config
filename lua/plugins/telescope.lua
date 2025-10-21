--
-- ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
-- ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
-- ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
-- ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
-- ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
-- ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
--
-- File: plugins/telescope.lua
-- Description: nvim-telescope config
-- Author: Kien Nguyen-Tuan <kiennt2609@gmail.com>
return {
	{
		-- Telescope
		-- Find, Filter, Preview, Pick. All lua, all the time.
		"nvim-telescope/telescope.nvim",
    enabled=false,
		keys = {
			{
				mode = "n",
				"<leader>sb",
				function()
					require("telescope.builtin").buffers()
				end,
				desc = "Buffers",
			},
			{
				mode = "n",
				"<leader>sB",
				function()
					require("telescope.builtin").current_buffer_fuzzy_find()
				end,
				desc = "Fuzzy Find in Buffer",
			},
			{
				mode = "n",
				"<leader>sf",
				function()
					require("telescope.builtin").find_files()
				end,
				desc = "Find Files",
			},
			{
				mode = "n",
				"<leader>sg",
				function()
					require("telescope.builtin").live_grep()
				end,
				desc = "Live Grep",
			},
			{
				mode = "n",
				"<leader>sr",
				function()
					require("telescope.builtin").oldfiles()
				end,
				desc = "Recent Files",
			},
			{
				mode = "n",
				"<leader>sh",
				function()
					require("telescope.builtin").help_tags()
				end,
				desc = "Help Tags",
			},
			{
				mode = "n",
				"<leader>sC",
				function()
					require("telescope.builtin").commands()
				end,
				desc = "Command History",
			},
			{
				mode = "n",
				"<leader>sl",
				function()
					require("telescope.builtin").resume()
				end,
				desc = "Resume Last Picker",
			},
			{
				mode = "n",
				"<leader>sm",
				function()
					require("telescope.builtin").marks()
				end,
				desc = "Marks",
			},
			{
				mode = "n",
				"<leader>sq",
				function()
					require("telescope.builtin").quickfix()
				end,
				desc = "Quickfix",
			},
			{
				mode = "n",
				"<leader>sR",
				function()
					require("telescope.builtin").registers()
				end,
				desc = "Registers",
			},
			{
				mode = "n",
				"<leader>sp",
				function()
					require("telescope.builtin").pickers()
				end,
				desc = "Pickers",
			},
			{
				mode = "n",
				"<leader>uC",
				function()
					require("telescope.builtin").commands()
				end,
				desc = "User Commands",
			},

			{
				mode = "n",
				"<leader>f",
				function()
					require("telescope.builtin").find_files()
				end,
				desc = "Find Files",
			},
			{
				mode = "n",
				"<leader>/",
				function()
					require("telescope.builtin").live_grep()
				end,
				desc = "Live Grep",
			},
			{
				mode = "n",
				"<leader>r",
				function()
					require("telescope.builtin").resume()
				end,
				desc = "Resume",
			},
			{
				mode = "n",
				"<leader>,",
				function()
					require("telescope.builtin").buffers()
				end,
				desc = "Buffers",
			},
			{
				mode = "n",
				"<leader>fh",
				function()
					require("telescope.builtin").help_tags()
				end,
				desc = "Help Tags",
			},
			{
				mode = "n",
				"gr",
				function()
					require("telescope.builtin").lsp_references()
				end,
				desc = "Show LSP References",
			},
			{ mode = "n", "<leader>t", "<cmd>lua vim.diagnostic.open_float()<CR>", desc = "Open diagnostics" },
			{ mode = "n", "<leader>fd", "<cmd>Telescope diagnostics bufnr=0<CR>", desc = "Show buffer diagnostics" },
			{ mode = "n", "gc", vim.lsp.buf.declaration, desc = "Go to declaration" },
			{ mode = "n", "gd", "<cmd>Telescope lsp_definitions<CR>", desc = "Show LSP definitions" },
			{ mode = "n", "gi", "<cmd>Telescope lsp_implementations<CR>", desc = "Show LSP implementations" },
			{ mode = "n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", desc = "Show LSP type definitions" },
			{
				mode = "n",
				"<leader>:",
				function()
					require("telescope.builtin").command_history()
				end,
				desc = "Command History",
			},
			{
				mode = "n",
				"<leader>sc",
				function()
					require("telescope.builtin").commands()
				end,
				desc = "Command History",
			},
			{
				mode = "n",
				"<leader>uT",
				function()
					require("telescope.builtin").treesitter()
				end,
				desc = "Treesitter",
			},
			{
				mode = "n",
				"<leader>si",
				function()
					require("telescope.builtin").highlights()
				end,
				desc = "Highlights",
			},
			{
				mode = "n",
				"<leader>sj",
				function()
					require("telescope.builtin").jumplist()
				end,
				desc = "Jumplist",
			},
			{
				mode = "n",
				"<leader>sM",
				function()
					require("telescope.builtin").man_pages()
				end,
				desc = "Man Pages",
			},
			{
				mode = "n",
				"<leader>su",
				function()
					require("telescope.builtin").undo()
				end,
				desc = "Undo History",
			},
			"nvim-lua/plenary.nvim",
		},
		config = function(_, opts)
			local actions = require("telescope.actions")
			require("telescope").setup({
				defaults = {
					mappings = {
						i = {
							["<C-n>"] = actions.cycle_previewers_next,
							["<C-b>"] = actions.cycle_previewers_prev,
							["<C-o>"] = function(prompt_bufnr)
								require("telescope.actions").select_default(prompt_bufnr)
								require("telescope.builtin").resume()
							end,
							["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
						},
						n = {
							["<C-[>"] = actions.close,
							["q"] = actions.close,
							["<C-o>"] = function(prompt_bufnr)
								require("telescope.actions").select_default(prompt_bufnr)
								require("telescope.builtin").resume()
							end,
						},
					},
				},
			})
			-- To get fzf loaded and working with telescope, you need to call
			-- load_extension, somewhere after setup function:
		end,
	},
}
