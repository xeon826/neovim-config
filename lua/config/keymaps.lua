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
-- Author: Kien Nguyen-Tuan <kiennt2609@gmail.com>
local utils = require("config/utils")
-- Close all windows and exit from Neovim with <leader> and q
-- vim.keymap.set("n", "<leader>qa", ":qa!<CR>", {})
-- Fast saving with <leader> and s
vim.keymap.set("n", "<leader>s", ":w<CR>", {})
-- Move around splits
vim.keymap.set("n", "<leader>wh", "<C-w>h", {})
vim.keymap.set("n", "<leader>wj", "<C-w>j", {})
vim.keymap.set("n", "<leader>wk", "<C-w>k", {})
vim.keymap.set("n", "<leader>wl", "<C-w>l", {})
-- Reload configuration without restart nvim
-- Normal mode mappings
vim.keymap.set("n", "<C-j>", "2j", { noremap = true, silent = true })
vim.keymap.set("n", "<C-k>", "2k", { noremap = true, silent = true })
vim.keymap.set("n", "<C-l>", "15l", { noremap = true, silent = true })
vim.keymap.set("n", "<C-h>", "15h", { noremap = true, silent = true })
-- Insert mode mappings
vim.keymap.set("i", "<C-j>", "<cmd>normal! 2j<CR>", { noremap = true, silent = true })
vim.keymap.set("i", "<C-k>", "<cmd>normal! 2k<CR>", { noremap = true, silent = true })
vim.keymap.set("i", "<C-l>", "<cmd>normal! 15l<CR>", { noremap = true, silent = true })
vim.keymap.set("i", "<C-h>", "<cmd>normal! 15h<CR>", { noremap = true, silent = true })
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

vim.keymap.set("n", "<C-q>", function()
  -- First try to close any floating windows
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local config = vim.api.nvim_win_get_config(win)
    if config.relative ~= "" then  -- Is floating window
      vim.api.nvim_win_close(win, false)
    end
  end

  -- Try to close avante if it exists
  -- pcall(require("avante").close)

  -- Force close all buffers, including modified ones
  vim.cmd("silent! %bwipeout!")
  
  -- Close any remaining plugin windows/buffers
  vim.cmd("silent! tabdo wincmd c")
  
  -- Finally quit
  vim.cmd("quit!")
end, { desc = "Quit All" })

