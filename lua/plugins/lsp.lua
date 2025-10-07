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
		-- LSP - Quickstart configs for Nvim LSP
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		lazy = false,
		dependencies = {
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },
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
			autoformat = false,
			format = {
				formatting_options = nil,
				timeout_ms = nil,
			},
			servers = {
				jdtls = {},
				jsonls = {},
				volar = {
					enabled = false,
					filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue", "json" },
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
				dockerls = {},
				bashls = {},
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
						client.server_capabilities.documentFormattingProvider = false
						client.server_capabilities.documentRangeFormattingProvider = false
					end,
				},
				vimls = {},
				yamlls = {},
			},
			setup = {
				ts_ls = function()
					-- disable tsserver
					-- vim.lsp.config("ts_ls", { virtual_lines = true, virtual_text = true })
				end,
				-- vtsls = function(_, opts)
				--   vim.lsp.config("vtsls", {virtual_text = false, virtual_lines = false})
				--   return false
				-- end,
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
				vim.lsp.config(server, server_opts)
			end

			local mlsp = require("mason-lspconfig")
			local available = mlsp.get_available_servers()

			local ensure_installed = {} ---@type string[]
			for server, server_opts in pairs(servers) do
				if server_opts then
					server_opts = server_opts == true and {} or server_opts
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
		"nvim-java/nvim-java",
		ft = { "java" },
		config = function()
			require("java").setup()
		end,
	},
}
