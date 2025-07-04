--
-- ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
-- ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
-- ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
-- ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
-- ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
-- ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
--
-- File: plugins/lsp.lua
-- Description: LSP setup and config
-- Author: Kien Nguyen-Tuan <kiennt2609@gmail.com>
-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
return {
	{
		-- Mason
		"williamboman/mason.nvim",
		cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUninstall", "MasonUninstallAll", "MasonLog" },
		keys = {
			{ "<leader>td", function() vim.diagnostic.enable(not vim.diagnostic.is_enabled()) end, { mode = "n", desc = "Toggle diagnostics", silent = true } },
			{ "<leader>lr", "<cmd>LspRestart<cr>", { mode = "n", desc = "Restart LSP servers silently", silent = true } },
			{ "[d", vim.diagnostic.goto_prev, { mode = "n", desc = "Go to previous diagnostic" } },
			{ "]d", vim.diagnostic.goto_next, { mode = "n", desc = "Go to next diagnostic" } },
			{
				"[D",
				function()
					vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR })
				end,
				{ mode = "n", desc = "Go to previous error" }
			},
			{
				"]D",
				function()
					vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR })
				end,
				{ mode = "n", desc = "Go to next error" }
			},
			{ "K", vim.lsp.buf.hover, { mode = "n", desc = "Show documentation for what is under cursor" } },
			{ "<leader>ca", vim.lsp.buf.code_action, { mode = { "n", "v" }, desc = "See available code actions" } },
			{ "<leader>gr", vim.lsp.buf.rename, { mode = "n", desc = "Smart rename" } },
		},
		opts = {
			PATH = "prepend",
			ui = {
				icons = {
					package_pending = " ",
					package_installed = "󰄳 ",
					package_uninstalled = " 󰚌",
				},

				keymaps = {
					toggle_server_expand = "<CR>",
					install_server = "i",
					update_server = "u",
					check_server_version = "c",
					update_all_servers = "U",
					check_outdated_servers = "C",
					uninstall_server = "X",
					cancel_installation = "<C-c>",
				},
			},

			max_concurrent_installers = 10,
		},
		config = function(_, opts)
			require("mason").setup(opts)
		end,
	},
	{
		-- LSP - Quickstart configs for Nvim LSP
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		lazy = false,
		dependencies = { -- Mason
			-- Portable package manager for Neovim that runs everywhere Neovim runs.
			-- Easily install and manage LSP servers, DAP servers, linters, and formatters.
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" }, -- Autocomplete
			-- A completion plugin for neovim coded in Lua.
			{
				"hrsh7th/nvim-cmp",
				dependencies = {
					"L3MON4D3/LuaSnip",
					"hrsh7th/cmp-nvim-lsp",
					"hrsh7th/cmp-path",
					"hrsh7th/cmp-buffer",
					"saadparwaiz1/cmp_luasnip",
				},
			},
		},
		opts = {
			-- Automatically format on save
			autoformat = false,
			-- options for vim.lsp.buf.format
			-- `bufnr` and `filter` is handled by the LazyVim formatter,
			-- but can be also overridden when specified
			format = {
				formatting_options = nil,
				timeout_ms = nil,
			},
			-- LSP Server Settings
			servers = {
				jsonls = {},
				volar = {  
					enabled = false,
					filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue", "json" }
				},
				ts_ls = {
					enabled = false,
					filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
					settings = {
						javascript = {
							format = {
								indentSize = 4,
								convertTabsToSpaces = true,
								tabSize = 4,
							},
						},
						typescript = {
							format = {
								indentSize = 2,
								convertTabsToSpaces = true,
								tabSize = 2,
							},
						},
					},
					init_options = {
						preferences = {
							quotePreference = "single",
						},
					},
				},
				-- ------------TYPESCRIPT
				vtsls = {
					enabled = true,
				},
				-- ------------/TYPESCRIPT
				dockerls = {},
				bashls = {},
				-- gopls = {},
				ruff = {},
				pylsp = {
					enabled = false,
					settings = {
						pylsp = {
							configurationSources = {},
							plugins = {
								pycodestyle = { enabled = false },
								flake8 = { enabled = false },
								mypy = { enabled = false },
								pylint = { enabled = false },
								pydocstyle = { enabled = false },
								yapf = { enabled = false },
								autopep8 = { enabled = false },
								pyflakes = { enabled = false },
								mccabe = { enabled = false },
								preload = { enabled = false },
								rope = { enabled = false },
								pylsp_mypy = { enabled = false },
								jedi_completion = { enabled = true },
								jedi_hover = { enabled = true },
								jedi_references = { enabled = true },
								jedi_signature_help = { enabled = true },
								jedi_symbols = { enabled = true },
							},
						},
					},
					on_attach = function(client, bufnr)
						-- Only disable formatting as we'll use other formatters
						client.server_capabilities.documentFormattingProvider = false
						client.server_capabilities.documentRangeFormattingProvider = false
					end,
				},
				vimls = {},
				yamlls = {},
			},
			-- you can do any additional lsp server setup here
			-- return true if you don"t want this server to be setup with lspconfig
			setup = {
				ts_ls = function()
					-- disable tsserver
					require("lspconfig").ts_ls.setup({})
				end,
				vtsls = function(_, opts)
					require("lspconfig").vtsls.setup({})
					return false
				end,
			},
		},
		config = function(_, opts)
			local servers = opts.servers
			local capabilities =
				require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

			local function setup(server)
				local server_opts = vim.tbl_deep_extend("force", {
					capabilities = vim.deepcopy(capabilities),
				}, servers[server] or {})

				if opts.setup[server] then
					if opts.setup[server](server, server_opts) then
						return
					end
				elseif opts.setup["*"] then
					if opts.setup["*"](server, server_opts) then
						return
					end
				end
				require("lspconfig")[server].setup(server_opts)
			end

			-- temp fix for lspconfig rename
			-- https://github.com/neovim/nvim-lspconfig/pull/2439
			-- local mappings = require("mason-lspconfig.mappings.server")
			-- if not mappings.lspconfig_to_package.lua_ls then
			-- 	mappings.lspconfig_to_package.lua_ls = "lua-language-server"
			-- 	mappings.package_to_lspconfig["lua-language-server"] = "lua_ls"
			-- end

			local mlsp = require("mason-lspconfig")
			local available = mlsp.get_available_servers()

			-- local ensure_installed = { "pyright" } ---@type string[]
			local ensure_installed = { } ---@type string[]
			for server, server_opts in pairs(servers) do
				if server_opts then
					server_opts = server_opts == true and {} or server_opts
					-- run manual setup if mason=false or if this is a server that cannot be installed with mason-lspconfig
					if server_opts.mason == false or not vim.tbl_contains(available, server) then
						setup(server)
					else
						ensure_installed[#ensure_installed + 1] = server
					end
				end
			end

			require("mason").setup()
			require("mason-lspconfig").setup({
				ensure_installed = ensure_installed,
				automatic_installation = true,
			})
			require("mason-lspconfig").setup({ setup })
		end,
	},
	{
		-- load luasnips + cmp related in insert mode only
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			{
				-- snippet plugin
				"L3MON4D3/LuaSnip",
				dependencies = "rafamadriz/friendly-snippets",
				opts = {
					history = true,
					updateevents = "TextChanged,TextChangedI",
				},
				config = function(_, opts)
					require("luasnip").config.set_config(opts)

					-- vscode format
					require("luasnip.loaders.from_vscode").lazy_load()
					require("luasnip.loaders.from_vscode").lazy_load({
						paths = vim.g.vscode_snippets_path or "",
					})

					-- snipmate format
					require("luasnip.loaders.from_snipmate").load()
					require("luasnip.loaders.from_snipmate").lazy_load({
						paths = vim.g.snipmate_snippets_path or "",
					})

					-- lua format
					require("luasnip.loaders.from_lua").load()
					require("luasnip.loaders.from_lua").lazy_load({
						paths = vim.g.lua_snippets_path or "",
					})

					vim.api.nvim_create_autocmd("InsertLeave", {
						callback = function()
							if
								require("luasnip").session.current_nodes[vim.api.nvim_get_current_buf()]
								and not require("luasnip").session.jump_active
							then
								require("luasnip").unlink_current()
							end
						end,
					})
				end,
			},
			{
				"saadparwaiz1/cmp_luasnip",
				"hrsh7th/cmp-nvim-lua",
				"hrsh7th/cmp-nvim-lsp",
				"hrsh7th/cmp-buffer",
				"hrsh7th/cmp-path",
			},
		}, -- cmp sources plugins
		opts = function()
			local cmp = require("cmp")

			local function border(hl_name)
				return {
					{ "╭", hl_name },
					{ "─", hl_name },
					{ "╮", hl_name },
					{ "│", hl_name },
					{ "╯", hl_name },
					{ "─", hl_name },
					{ "╰", hl_name },
					{ "│", hl_name },
				}
			end

			local options = {
				completion = {
					completeopt = "menu,menuone",
				},

				window = {
					completion = {
						winhighlight = "Normal:CmpPmenu,CursorLine:CmpSel,Search:PmenuSel",
						scrollbar = false,
					},
					documentation = {
						border = border("CmpDocBorder"),
						winhighlight = "Normal:CmpDoc",
					},
				},

				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},

				mapping = {
					["<C-p>"] = cmp.mapping.select_prev_item(),
					["<C-n>"] = cmp.mapping.select_next_item(),
					["<C-d>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.close(),
					["<CR>"] = cmp.mapping.confirm({
						behavior = cmp.ConfirmBehavior.Insert,
						select = true,
					}),
					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						elseif require("luasnip").expand_or_jumpable() then
							vim.fn.feedkeys(
								vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true),
								""
							)
						else
							fallback()
						end
					end, { "i", "s" }),
					["<S-Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						elseif require("luasnip").jumpable(-1) then
							vim.fn.feedkeys(
								vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true),
								""
							)
						else
							fallback()
						end
					end, { "i", "s" }),
				},
				sources = {
					{
						name = "nvim_lsp",
					},
					{
						name = "luasnip",
					},
					{
						name = "buffer",
						option = {
							-- Avoid accidentally running on big files
							get_bufnrs = function()
								local buf = vim.api.nvim_get_current_buf()
								local byte_size = vim.api.nvim_buf_get_offset(buf, vim.api.nvim_buf_line_count(buf))
								if byte_size > 1024 * 1024 then -- 1 Megabyte max
									return {}
								end
								return { buf }
							end,
						},
					},
					{
						name = "nvim_lua",
					},
					{
						name = "path",
					},
				},
			}

			return options
		end,
		config = function(_, opts)
			require("cmp").setup(opts)
		end,
	},
}
