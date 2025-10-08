--
-- ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
-- ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
-- ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
-- ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██╔████╔██║
-- ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║╚██╔╝██║
-- ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
--
-- File: config/keymaps.lua
-- Description: Key mapping configs
-- Author: Joshua WIlkeson
-- Move around splits
vim.keymap.set({ "i", "n" }, "<C-h>", "<C-w>h")
vim.keymap.set({ "i", "n" }, "<C-l>", "<C-w>l")
vim.keymap.set({ "i", "n" }, "<C-j>", "<C-w>j")
vim.keymap.set({ "i", "n" }, "<C-k>", "<C-w>k")
vim.keymap.set("n", "=", [[<cmd>vertical resize +5<cr>]]) -- make the window bigger vertically
vim.keymap.set("n", "-", [[<cmd>vertical resize -5<cr>]]) -- make the window smaller vertically
vim.keymap.set("n", "<C-=>", [[<cmd>horizontal resize +2<cr>]]) -- make the window bigger horizontally
vim.keymap.set("n", "<C-->", [[<cmd>horizontal resize -2<cr>]]) -- make the window smaller horizontally
vim.keymap.set({ "i", "n" }, "<C-s>", ":silent w<cr>", { desc = "Save File" })
vim.keymap.set("n", "<leader>ya", ":silent %y+<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>bca", "<cmd>%bdelete<CR>", { noremap = true, silent = true, desc = "Close all buffers" })
vim.keymap.set("n", "<leader>ti", "A # type: ignore<esc>", { desc = "Insert mypy type ignore at end of line" })
vim.keymap.set("n", "<leader>ch", "<cmd>checkhealth<cr>", { desc = "Run checkhealth" })

vim.keymap.set("n", "<Esc>", function()
	vim.cmd("nohlsearch")
end, { desc = "Remove highlights" })

vim.keymap.set("n", "<C-[>", function()
	vim.cmd("nohlsearch")
end, { desc = "Remove highlights" })

vim.keymap.set("n", "<C-q>", "<cmd>wqall!<cr>", { desc = "Close neovim" })
