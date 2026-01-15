local toggle_key = "<C-\\>"
-- Note: Changed from <C-,> to <C-\\> because <C-,> is not a valid terminal key

return {
	-- Claude FZF plugin configuration
	-- {
	-- 	"xeon826/claude-fzf.nvim",
	-- 	dir = "/home/dan/git_clones/claude-fzf.nvim",
	-- 	dependencies = {
	-- 		"ibhagwan/fzf-lua",
	-- 		"coder/claudecode.nvim",
	-- 	},
	-- 	opts = {
	-- 		auto_context = true,
	-- 		batch_size = 10,
	-- 	},
	-- 	cmd = {
	-- 		"ClaudeFzf",
	-- 		"ClaudeFzfFiles",
	-- 		"ClaudeFzfGrep",
	-- 		"ClaudeFzfBuffers",
	-- 		"ClaudeFzfGitFiles",
	-- 		"ClaudeFzfDirectory",
	-- 	},
	-- },
	{
		"coder/claudecode.nvim",
		event = "VeryLazy",
		dependencies = { "folke/snacks.nvim" },
		keys = {
			{ toggle_key, "<cmd>ClaudeCodeFocus<cr>", desc = "Claude Code", mode = { "n", "x", "t" } },
			{ "<leader>a", nil, desc = "AI/Claude Code" },
			{ "<leader>ac", "<cmd>ClaudeCode<cr>", desc = "Toggle Claude" },
			{ "<leader>af", "<cmd>ClaudeCodeFocus<cr>", desc = "Focus Claude" },
			{ "<leader>ar", "<cmd>ClaudeCode --resume<cr>", desc = "Resume Claude" },
			{ "<leader>aC", "<cmd>ClaudeCode --continue<cr>", desc = "Continue Claude" },
			{ "<leader>am", "<cmd>ClaudeCodeSelectModel<cr>", desc = "Select Claude model" },
			{ "<leader>ab", "<cmd>ClaudeCodeAdd %<cr>", desc = "Add current buffer" },
			{ "<leader>as", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "Send to Claude" },
			{
				"<leader>as",
				"<cmd>ClaudeCodeTreeAdd<cr>",
				desc = "Add file",
				ft = { "NvimTree", "neo-tree", "oil", "minifiles", "netrw" },
			},
			-- Layout-specific keymaps
			{ "<leader>av", "<cmd>ClaudeCode<cr>", desc = "Claude: Vertical split" },
			-- Diff management
			-- { "<leader>aa", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept diff" },
			-- { "<leader>ad", "<cmd>ClaudeCodeDiffDeny<cr>", desc = "Deny diff" },
			{ "<C-1>", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept diff" },
			{ "<C-2>", "<cmd>ClaudeCodeDiffDeny<cr>", desc = "Deny diff" },
		},
		opts = {
      terminal_cmd = "/usr/bin/qwen",
			diff_opts = {
        open_in_current_tab = false,
				keep_terminal_focus = true,
			},
			terminal = {
				provider = "snacks",
				---@module "snacks"
				---@type snacks.win.Config|{}
				snacks_win_opts = {
					position = "float",
					height = 0.9,
					width = 0.9999999,
					keys = {
						nav_left = {
							"<C-h>",
							function(self)
								vim.cmd("wincmd h")
							end,
							mode = "t",
							desc = "Nav to previous buffer",
						},
						nav_right = {
							"<C-l>",
							function(self)
								vim.cmd("wincmd l")
							end,
							mode = "t",
							desc = "Nav to previous buffer",
						},
						nav_down = {
							"<C-j>",
							function(self)
								vim.cmd("wincmd j")
							end,
							mode = "t",
							desc = "Nav to bottom buffer",
						},
						nav_up = {
							"<C-k>",
							function(self)
								vim.cmd("wincmd k")
							end,
							mode = "t",
							desc = "Nav to top buffer",
						},
						-- Claude FZF key mappings
						claude_fzf_git_files = {
							"<C-,>",
							function()
								vim.cmd("stopinsert")
								vim.cmd("ClaudeFzfGitFiles")
							end,
							mode = "t",
							desc = "Claude: Add Git files",
						},
						claude_fzf_files = {
							"<C-f>",
							function()
								vim.cmd("stopinsert")
								vim.cmd("ClaudeFzfFiles")
							end,
							mode = "t",
							desc = "Claude: Add files",
						},
						-- claude_fzf_grep = {
						-- 	"<leader>/",
						-- 	function()
						-- 		vim.cmd("stopinsert")
						-- 		vim.cmd("ClaudeFzfGrep")
						-- 	end,
						-- 	mode = "t",
						-- 	desc = "Claude: Search and add",
						-- },
						claude_fzf_buffers = {
							"<C-b>",
							function()
								vim.cmd("stopinsert")
								vim.cmd("ClaudeFzfBuffers")
							end,
							mode = "t",
							desc = "Claude: Add buffers",
						},
						claude_fzf_directory = {
							"<C-d>",
							function()
								vim.cmd("stopinsert")
								vim.cmd("ClaudeFzfDirectory")
							end,
							mode = "t",
							desc = "Claude: Add directory files",
						},
					},
				},
			},
		},
	},
}
