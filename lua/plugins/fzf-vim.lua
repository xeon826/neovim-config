-- ["enter"] = require("fzf-lua.actions").file_edit,
return {
	{
		"ibhagwan/fzf-lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			actions = {
				files = {
					-- Open all selected files, don't send to quickfix
					["enter"] = require("fzf-lua.actions").file_edit,
				},
			},
			keymap = {
				builtin = {
					true,
					["<C-/>"] = "focus-preview",
					["<C-d>"] = "preview-page-down", -- Scroll preview down
					["<C-u>"] = "preview-page-up", -- Scroll preview up
					["<C-f>"] = "preview-page-left", -- Scroll preview left
					["<C-k>"] = "preview-page-right", -- Scroll preview right
					["<C-j>"] = "down", -- Move cursor down in results
					["<C-k>"] = "up", -- Move cursor up in results
				},
			},
		},
		keys = {
			-- Buffers
			{
				"<leader>sb",
				function()
					require("fzf-lua").buffers()
				end,
				desc = "Buffers",
				mode = "n",
			},
			-- Fuzzy find in buffer
			{
				"<leader>sB",
				function()
					require("fzf-lua").blines()
				end,
				desc = "Fuzzy Find in Buffer",
				mode = "n",
			},
			-- Find files
			{
				"<leader>sf",
				function()
					require("fzf-lua").files()
				end,
				desc = "Find Files",
				mode = "n",
			},
			-- Live grep
			{
				"<leader>sg",
				function()
					require("fzf-lua").live_grep()
				end,
				desc = "Live Grep",
				mode = "n",
			},
			-- Recent files
			{
				"<leader>sr",
				function()
					require("fzf-lua").oldfiles()
				end,
				desc = "Recent Files",
				mode = "n",
			},
			-- Help tags
			{
				"<leader>sh",
				function()
					require("fzf-lua").helptags()
				end,
				desc = "Help Tags",
				mode = "n",
			},
			-- Command history
			{
				"<leader>sC",
				function()
					require("fzf-lua").commands()
				end,
				desc = "Command History",
				mode = "n",
			},
			-- Resume last picker
			{
				"<leader>sl",
				function()
					require("fzf-lua").resume()
				end,
				desc = "Resume Last Picker",
				mode = "n",
			},
			-- Marks
			{
				"<leader>sm",
				function()
					require("fzf-lua").marks()
				end,
				desc = "Marks",
				mode = "n",
			},
			-- Quickfix
			{
				"<leader>sq",
				function()
					require("fzf-lua").quickfix()
				end,
				desc = "Quickfix",
				mode = "n",
			},
			-- Registers
			{
				"<leader>sR",
				function()
					require("fzf-lua").registers()
				end,
				desc = "Registers",
				mode = "n",
			},
			-- Pickers (fzf-lua: builtin pickers)
			{
				"<leader>sp",
				function()
					require("fzf-lua").builtin()
				end,
				desc = "Pickers",
				mode = "n",
			},
			-- User commands
			{
				"<leader>uC",
				function()
					require("fzf-lua").commands()
				end,
				desc = "User Commands",
				mode = "n",
			},
			-- Find files (duplicate)
			{
				"<leader>f",
				function()
					require("fzf-lua").files()
				end,
				desc = "Find Files",
				mode = "n",
			},
			-- Live grep (duplicate)
			{
				"<leader>/",
				function()
					require("fzf-lua").live_grep()
				end,
				desc = "Live Grep",
				mode = "n",
			},
			-- Resume (duplicate)
			{
				"<leader>r",
				function()
					require("fzf-lua").resume()
				end,
				desc = "Resume",
				mode = "n",
			},
			-- Buffers (duplicate)
			{
				"<leader>,",
				function()
					require("fzf-lua").buffers()
				end,
				desc = "Buffers",
				mode = "n",
			},
			-- Help tags (duplicate)
			{
				"<leader>fh",
				function()
					require("fzf-lua").helptags()
				end,
				desc = "Help Tags",
				mode = "n",
			},
			-- LSP references
			{
				"gr",
				function()
					require("fzf-lua").lsp_references()
				end,
				desc = "Show LSP References",
				mode = "n",
			},
			-- Diagnostics float (not fzf-lua, keep as is)
			{ "<leader>t", "<cmd>lua vim.diagnostic.open_float()<CR>", desc = "Open diagnostics", mode = "n" },
			-- Buffer diagnostics
			{ "<leader>fd", "<cmd>FzfLua diagnostics_document<CR>", desc = "Show buffer diagnostics", mode = "n" },
			-- Go to declaration (not fzf-lua, keep as is)
			{ "gc", vim.lsp.buf.declaration, desc = "Go to declaration", mode = "n" },
			-- LSP definitions
			{ "gd", "<cmd>FzfLua lsp_definitions<CR>", desc = "Show LSP definitions", mode = "n" },
			-- LSP implementations
			{ "gi", "<cmd>FzfLua lsp_implementations<CR>", desc = "Show LSP implementations", mode = "n" },
			-- LSP type definitions
			{ "gt", "<cmd>FzfLua lsp_typedefs<CR>", desc = "Show LSP type definitions", mode = "n" },
			-- Command history (duplicate)
			{
				"<leader>:",
				function()
					require("fzf-lua").command_history()
				end,
				desc = "Command History",
				mode = "n",
			},
			-- Command history (duplicate)
			{
				"<leader>sc",
				function()
					require("fzf-lua").commands()
				end,
				desc = "Command History",
				mode = "n",
			},
			-- Treesitter symbols
			{
				"<leader>uT",
				function()
					require("fzf-lua").treesitter()
				end,
				desc = "Treesitter",
				mode = "n",
			},
			-- Highlights
			{
				"<leader>si",
				function()
					require("fzf-lua").highlights()
				end,
				desc = "Highlights",
				mode = "n",
			},
			-- Jumplist
			{
				"<leader>sj",
				function()
					require("fzf-lua").jumplist()
				end,
				desc = "Jumplist",
				mode = "n",
			},
			-- Man pages
			{
				"<leader>sM",
				function()
					require("fzf-lua").manpages()
				end,
				desc = "Man Pages",
				mode = "n",
			},
			-- Undo history
			{
				"<leader>su",
				function()
					require("fzf-lua").undo()
				end,
				desc = "Undo History",
				mode = "n",
			},
		},
	},
}
