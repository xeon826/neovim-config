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

-- Highlight on yank
autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank({
      higroup = "IncSearch",
      timeout = "1000"
    })
  end
})

-- listen lsp-progress event and refresh lualine
augroup("lualine_augroup", { clear = true })
autocmd("User", {
  group = "lualine_augroup",
  pattern = "LspProgressStatusUpdated",
  callback = require("lualine").refresh,
})

-- autocmd({ "BufWritePost", "BufReadPost" }, {
--   callback = function()
--     local file_extension = vim.fn.expand("%:e")
--     if file_extension ~= "md" then
--       require("lint").try_lint()
--     end
--   end,
-- })

-- autocmd({ "BufWritePost", "BufReadPost" }, {
--   callback = function()
--     local file_extension = vim.fn.expand("%:e")
--     -- Skip linting for .md files
--     if file_extension ~= "md" then
--       vim.defer_fn(function()
--         require("lint").try_lint()
--       end, 100)  -- Delay by 100ms (you can adjust this as needed)
--     end
--   end,
-- })



-- autocmd({ "BufWritePost", "BufReadPost" }, {
--   callback = function()
--     local file_extension = vim.fn.expand("%:e")
--     -- Skip linting for .md files
--     if file_extension ~= "md" then
--       require("lint").try_lint()
--     end
--   end,
-- })


-- Remove whitespace on save
-- autocmd("BufWritePre", {
--   pattern = "",
--   command = ":%s/\\s\\+$//e"
-- })

-- Auto format on save using the attached (optionally filtered) language servere clients
-- https://neovim.io/doc/user/lsp.html#vim.lsp.buf.format()
-- autocmd("BufWritePre", {
--     pattern = "",
--     command = ":silent lua vim.lsp.buf.format()"
-- })

-- Don"t auto commenting new lines
autocmd("BufEnter", {
  pattern = "",
  command = "set fo-=c fo-=r fo-=o"
})

autocmd("Filetype", {
  pattern = { "xml", "html", "xhtml", "css", "scss", "javascript", "typescript", 'typescriptreact', 'javascriptreact', "yaml", "lua" },
  command = "setlocal shiftwidth=2 tabstop=2"
})

-- Set colorcolumn
autocmd("Filetype", {
  pattern = { "python", "rst", "c", "cpp" },
  command = "set colorcolumn=80"
})

autocmd("Filetype", {
  pattern = { "gitcommit", "markdown", "text" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end
})

autocmd("LspAttach", {
  callback = function()
    vim.diagnostic.config({ virtual_text = false, virtual_lines = false })
  end,
})

