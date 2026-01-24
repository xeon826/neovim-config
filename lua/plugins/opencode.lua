return {
	-- "xeon826/opencode.nvim",
 --  name = 'opencode',
 --  dev = {true},
	"~/git_clones/proj/opencode.nvim",
	dev = true,
	dir = "~/git_clones/proj/opencode.nvim",
	dependencies = {
		-- Recommended for `ask()` and `select()`.
		-- Required for `snacks` provider.
		---@module 'snacks' <- Loads `snacks.nvim` types for configuration intellisense.
		{ 
			"folke/snacks.nvim", 
			opts = { 
				input = {}, 
				picker = {
					actions = {
						opencode_send = function(...)
							return require("opencode.cli.picker.snacks").send(...)
						end,
					},
					win = {
						input = {
							keys = {
								["<C-o>"] = {
									"opencode_send",
									mode = { "n", "i" },
								},
							},
						},
					},
				},
				terminal = {} 
			} 
		},
	},
	config = function()
		---@type opencode.Opts
		vim.g.opencode_opts = {
			-- Your configuration, if any — see `lua/opencode/config.lua`, or "goto definition" on the type or field.
			provider = {
				snacks = {
					auto_close = true, -- Close the terminal when `opencode` exits
					win = {
						position = "float",
						enter = true, -- Stay in the editor after opening the terminal
						wo = {
							winbar = "", -- Title is unnecessary - `opencode` TUI has its own footer
						},
						bo = {
							-- Make it easier to target for customization, and prevent possibly unintended `"snacks_terminal"` targeting.
							-- e.g. the recommended edgy.nvim integration puts all `"snacks_terminal"` windows at the bottom.
							filetype = "opencode_terminal",
						},
					},
				},
			},
		}

		-- Required for `opts.events.reload`.
		vim.o.autoread = true

		-- Recommended/example keymaps.
		vim.keymap.set({ "n", "x" }, "<C-a>", function()
			require("opencode").ask("@this: ", { submit = true })
		end, { desc = "Ask opencode…" })
		vim.keymap.set("n", "<leader>ob", function()
			require("opencode").ask("Explain @buffer: ", { submit = true })
		end, { desc = "Ask about buffer" })
		vim.keymap.set("n", "<leader>oB", function()
			require("opencode").ask("Explain @buffers: ", { submit = true })
		end, { desc = "Ask about buffers" })
		vim.keymap.set({ "n", "x" }, "<C-x>", function()
			require("opencode").select()
		end, { desc = "Execute opencode action…" })
		vim.keymap.set({ "n", "t" }, "<C-\\>", function()
			require("opencode").toggle()
		end, { desc = "Toggle opencode" })

		vim.keymap.set({ "n", "x" }, "go", function()
			return require("opencode").operator("@this ")
		end, { desc = "Add range to opencode", expr = true })
		vim.keymap.set("n", "goo", function()
			return require("opencode").operator("@this ") .. "_"
		end, { desc = "Add line to opencode", expr = true })

		-- Snacks picker integration keymap
		vim.keymap.set("n", "<leader>op", function()
			require("opencode.cli.picker").open("files")
		end, { desc = "Open opencode picker" })

		-- You may want these if you stick with the opinionated "<C-a>" and "<C-x>" above — otherwise consider "<leader>o…".
		vim.keymap.set("n", "+", "<C-a>", { desc = "Increment under cursor", noremap = true })
		vim.keymap.set("n", "-", "<C-x>", { desc = "Decrement under cursor", noremap = true })

		local opts = { buffer = true, desc = "Opencode terminal keymap" }
		vim.api.nvim_create_autocmd("FileType", {
			pattern = "opencode_terminal",
			callback = function()
				vim.keymap.set("t", "<C-u>", function()
					require("opencode").command("session.half.page.up")
				end, opts)
				vim.keymap.set("t", "<C-d>", function()
					require("opencode").command("session.half.page.down")
				end, opts)
				vim.keymap.set("t", "<C-f>", function()
					require("opencode").fzf.select_files()
				end, opts)
				vim.keymap.set("t", "<C-b>", function()
					require("opencode").fzf.select_buffers()
				end, opts)
			end,
		})
	end,
}
