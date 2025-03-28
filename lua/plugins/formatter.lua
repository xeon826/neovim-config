--
-- ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
-- ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
-- ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
-- ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
-- ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
-- ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
--
-- File: plugins/formatter.lua
-- Description: Formatters and linters
-- Author: Kien Nguyen-Tuan <kiennt2609@gmail.com>
return {
	{
		"mhartington/formatter.nvim",
		keys = {
			{ mode="n", "<leader>cf", "<cmd>Format<cr>", { noremap = true, silent = true, desc = "Format everything" } },
		},
		config = function()
			local vim = vim
			local formatter = require("formatter")
			local prettierConfig = function()
				return {
					exe = "prettier",
					args = { "--stdin-filepath", vim.fn.shellescape(vim.api.nvim_buf_get_name(0)) },
					stdin = true,
				}
			end

			local formatterConfig = {
				htmldjango = {
					function()
						return {
							exe = "djlint",
							args = { "--reformat", "-" },
							stdin = true,
						}
					end,
				},
				python = {
					function()
						return {
							exe = "black",
							args = { "-" },
							stdin = true,
						}
					end,
				},
				lua = {
					function()
						return {
							exe = "stylua",
							args = { "-" },
							stdin = true,
						}
					end,
				},
				vue = {
					function()
						return {
							exe = "prettier",
							args = {
								"--stdin-filepath",
								vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)),
								"--single-quote",
								"--parser",
								"vue",
							},
							stdin = true,
						}
					end,
				},
				rust = { 
					function()
						return {
							exe = "rustfmt",
							args = { "--emit=stdout" },
							stdin = true,
						}
					end,
				},
				swift = { 
					function()
						return {
							exe = "swift-format",
							args = { vim.api.nvim_buf_get_name(0) },
							stdin = true,
						}
					end,
				},
				blade = {
					function()
						return {
							exe = "blade-formatter",
							args = { "--stdin" },
							stdin = true,
						}
					end,
				},
				ruby = { 
					function()
						return {
							exe = "rubocop",
							args = {
								"--fix-layout",
								"--stdin",
								vim.api.nvim_buf_get_name(0),
								"--format",
								"files",
							},
							stdin = true,
							transform = function(text)
								table.remove(text, 1)
								table.remove(text, 1)
								return text
							end,
						}
					end,
				},
				r = {
					function()
						return {
							exe = "R",
							args = {
								"--slave",
								"--no-restore",
								"--no-save",
								"-e",
								"'con <- file(\"stdin\"); styler::style_text(readLines(con)); close(con)'",
								"2>/dev/null",
							},
							stdin = true,
						}
					end,
				},
				dart = {
					function()
						return {
							exe = "dart",
							args = { "format" },
							stdin = true,
						}
					end,
				},
				php = {
					function()
						return {
							exe = "~/.config/composer/vendor/bin/php-cs-fixer",
							args = {
								"fix",
								"--rules=@PSR12",
								"--using-cache=no",
								"--no-interaction",
								"--quiet",
								vim.api.nvim_buf_get_name(0),
							},
							stdin = false,
						}
					end,
				},
				["*"] = {
				},
			}
			local commonFT = {
				"css",
				"scss",
				"html",
				"java",
				"javascript",
				"javascriptreact",
				"typescript",
				"typescriptreact",
				"markdown",
				"markdown.mdx",
				"json",
				"yaml",
				"xml",
				"svg",
				"svelte",
			}
			for _, ft in ipairs(commonFT) do
				formatterConfig[ft] = { prettierConfig }
			end
			-- Setup functions
			formatter.setup({
				logging = true,
				filetype = formatterConfig,
				log_level = 2,
			})
		end,
	},
	{
		"mfussenegger/nvim-lint",
		config = function()
			local lint = require("lint")
			lint.linters_by_ft = {
				javascript = { "eslint_d" },
				typescript = { "eslint_d" },
				javascriptreact = { "eslint_d" },
				typescriptreact = { "eslint_d" },
				markdown = { "vale" },
				python = { "mypy" },
			}
		end,
		event = "VimEnter",
	},
}
