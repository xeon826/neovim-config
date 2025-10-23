return {
	"nvim-neotest/neotest-python",
	dependencies = {
		"nvim-neotest/neotest",
		"mfussenegger/nvim-dap",
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	config = function()
		require("neotest").setup({
			output_panel = {
				open = "botright vsplit | vertical resize 80",
			},
			adapters = {
				require("neotest-python")({
					dap = { justMyCode = false },
					args = { "--reuse-db" },
					runner = "pytest",
				}),
			},
		})

		-- Neotest summary window toggle
		vim.keymap.set("n", "<leader>ts", function()
			require("neotest").summary.toggle()
		end, { desc = "Neotest Summary Toggle" })

		-- Run nearest test
		vim.keymap.set("n", "<leader>tr", function()
			require("neotest").run.run()
		end, { desc = "Neotest Run Nearest" })

		-- Run current file
		vim.keymap.set("n", "<leader>tR", function()
			require("neotest").run.run(vim.fn.expand("%"))
		end, { desc = "Neotest Run File" })

		-- Debug nearest test
		vim.keymap.set("n", "<leader>td", function()
			require("neotest").run.run({ strategy = "dap" })
		end, { desc = "Neotest Debug Nearest" })

		-- Debug current file
		vim.keymap.set("n", "<leader>tD", function()
			require("neotest").run.run({ vim.fn.expand("%"), strategy = "dap" })
		end, { desc = "Neotest Debug File" })

		-- Stop running test(s)
		vim.keymap.set("n", "<leader>tS", function()
			require("neotest").run.stop()
		end, { desc = "Neotest Stop" })

		-- Attach to running test
		vim.keymap.set("n", "<leader>ta", function()
			require("neotest").run.attach()
		end, { desc = "Neotest Attach" })

		-- Toggle output panel
		vim.keymap.set("n", "<leader>tp", function()
			require("neotest").output_panel.toggle()
		end, { desc = "Neotest Output Panel" })
		vim.keymap.set("n", "<leader>ts", function()
			require("neotest").summary.toggle()
		end, { desc = "Neotest Summary Toggle" })
		-- Open output for nearest test (vertical split, with buffer check)
		vim.keymap.set("n", "<leader>to", function()
			require("neotest").output.open({
				enter = true,
				short = false,
				open_win = function(bufnr)
					vim.cmd("vsplit")
					local win = vim.api.nvim_get_current_win()
					if type(bufnr) == "number" and vim.api.nvim_buf_is_valid(bufnr) then
						vim.api.nvim_win_set_buf(win, bufnr)
					else
						vim.notify("Invalid buffer for neotest output", vim.log.levels.ERROR)
					end
				end,
			})
		end, { desc = "Neotest Output (vsplit)" })
	end,
}

-- mappings = {
--   attach = "a",
--   clear_marked = "M",
--   clear_target = "T",
--   debug = "d",
--   debug_marked = "D",
--   expand = { "<CR>", "<2-LeftMouse>" },
--   expand_all = "e",
--   help = "?",
--   jumpto = "i",
--   mark = "m",
--   next_failed = "J",
--   next_sibling = ">",
--   output = "o",
--   parent = "P",
--   prev_failed = "K",
--   prev_sibling = "<",
--   run = "r",
--   run_marked = "R",
--   short = "O",
--   stop = "u",
--   target = "t",
--   watch = "w"
-- },
