-- Native Neovim 0.12 treesitter config.
-- nvim-treesitter plugin removed; queries are in queries/, parsers in parser/.
-- Parsers are loaded from ~/.local/share/tree-sitter/parser/*.so via runtimepath.

-- Add parser directory to runtimepath so Neovim finds parser/{lang}.so files
local parser_dir = vim.fn.expand("~/.local/share/tree-sitter")
vim.opt.runtimepath:prepend(parser_dir)

-- Bundled parsers in Neovim 0.12 (no registration needed):
-- c, lua, markdown, markdown_inline, query, vim, vimdoc

-- Start treesitter highlighting for all filetypes that have a parser
vim.api.nvim_create_autocmd("FileType", {
    callback = function()
        pcall(vim.treesitter.start)
    end,
})
