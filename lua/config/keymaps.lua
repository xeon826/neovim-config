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
-- Smart buffer/window switching (works in terminal mode too)
vim.keymap.set({ "n", "t" }, "<C-h>", function()
  if vim.bo.buftype == "terminal" then
    vim.cmd("wincmd h")
  else
    vim.cmd("bprevious")
  end
end, { desc = "Previous buffer or left window" })

vim.keymap.set({ "n", "t" }, "<C-l>", function()
  if vim.bo.buftype == "terminal" then
    vim.cmd("wincmd l")
  else
    vim.cmd("bnext")
  end
end, { desc = "Next buffer or right window" })
vim.keymap.set({ "i", "n", "t" }, "<C-j>", "<C-w>j")
vim.keymap.set({ "i", "n", "t" }, "<C-k>", "<C-w>k")
vim.keymap.set("n", "=", [[<cmd>vertical resize +5<cr>]]) -- make the window bigger vertically
vim.keymap.set("n", "-", [[<cmd>vertical resize -5<cr>]]) -- make the window smaller vertically
vim.keymap.set("n", "<C-=>", [[<cmd>horizontal resize +2<cr>]]) -- make the window bigger horizontally
vim.keymap.set("n", "<C-->", [[<cmd>horizontal resize -2<cr>]]) -- make the window smaller horizontally
vim.keymap.set({ "i", "n" }, "<C-s>", ":silent w<cr>", { desc = "Save File" })
vim.keymap.set("n", "<leader>ya", ":silent %y+<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>bca", "<cmd>%bdelete<CR>", { noremap = true, silent = true, desc = "Close all buffers" })
vim.keymap.set("n", "<leader>ti", "A # type: ignore<esc>", { desc = "Insert mypy type ignore at end of line" })
vim.keymap.set("n", "<leader>ch", "<cmd>checkhealth<cr>", { desc = "Run checkhealth" })
-- vim.keymap.set("n", "<C-b>", ":cd ..<CR>", { noremap = true, silent = true, desc = "Change directory to parent" })
vim.keymap.set("n", "<leader>q", "<cmd>q<cr>", { desc = "Quit current window" })

vim.keymap.set("n", "<Esc>", function()
	vim.cmd("nohlsearch")
end, { desc = "Remove highlights" })

vim.keymap.set("n", "<C-[>", function()
	vim.cmd("nohlsearch")
end, { desc = "Remove highlights" })

vim.keymap.set("n", "<C-q>", "<cmd>qa!<cr>", { desc = "Close neovim" })
vim.keymap.set("n", "<leader>mi", ":MCPHub<CR>", { noremap = true, silent = true, desc = "Run MCPHub insert_edit_into_file" })
