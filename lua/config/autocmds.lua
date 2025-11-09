--
-- ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
-- ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
-- ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
-- ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
-- ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
-- ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
--
-- File: config/autocmds.lua
-- Description: Autocommand functions
-- Author: Kien Nguyen-Tuan <kiennt2609@gmail.com>
-- Define autocommands with Lua APIs
-- See: h:api-autocmd, h:augroup
local augroup = vim.api.nvim_create_augroup -- Create/get autocommand group
local autocmd = vim.api.nvim_create_autocmd -- Create autocommand

-- General settings

-- Save session when Neovim closes
vim.api.nvim_create_autocmd("VimLeavePre", {
    callback = function()
        -- Close nvim-tree if open
        if require("nvim-tree.api").tree.is_visible() then
            require("nvim-tree.api").tree.close()
        end
        local cwd_path = vim.fn.getcwd()
        vim.cmd("AutoSession save " .. cwd_path)
    end,
})
-- Highlight on yank
autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank({
			higroup = "IncSearch",
			timeout = "1000",
		})
	end,
})

-- listen lsp-progress event and refresh lualine
augroup("lualine_augroup", { clear = true })
autocmd("User", {
	group = "lualine_augroup",
	pattern = "LspProgressStatusUpdated",
	callback = require("lualine").refresh,
})

-- Don"t auto commenting new lines
autocmd("BufEnter", {
	pattern = "",
	command = "set fo-=c fo-=r fo-=o",
})

autocmd("Filetype", {
	pattern = {
		"xml",
		"html",
		"xhtml",
		"css",
		"scss",
		"javascript",
		"typescript",
		"typescriptreact",
		"javascriptreact",
		"yaml",
		"lua",
	},
	command = "setlocal shiftwidth=2 tabstop=2",
})

-- Set colorcolumn
autocmd("Filetype", {
	pattern = { "python", "rst", "c", "cpp" },
	command = "set colorcolumn=80",
})

autocmd("Filetype", {
	pattern = { "gitcommit", "markdown", "text" },
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.spell = true
	end,
})

autocmd("LspAttach", {
	callback = function()
		vim.diagnostic.config({ virtual_text = true, virtual_lines = false })
	end,
})

-- Open nvim-tree with the correct directory when starting Neovim
augroup("nvim_tree_startup", { clear = true })
autocmd("VimEnter", {
	group = "nvim_tree_startup",
	callback = function(data)
		-- buffer is a directory
		local directory = vim.fn.isdirectory(data.file) == 1

		if not directory then
			return
		end

		-- change to the directory
		vim.cmd.cd(data.file)

		-- open the tree
		require("nvim-tree.api").tree.open()
	end,
})
