--
-- ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
-- ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
-- ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
-- ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
-- ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
-- ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
--
-- File: config/keymaps.lua
-- Description: Key mapping configs
-- Author: Kien Nguyen-Tuan <kiennt2609@gmail.com>
local utils = require("config/utils")
-- Close all windows and exit from Neovim with <leader> and q
vim.keymap.set("n", "<leader>qa", ":qa!<CR>", {})
-- Fast saving with <leader> and s
vim.keymap.set("n", "<leader>s", ":w<CR>", {})
-- Move around splits
vim.keymap.set("n", "<leader>wh", "<C-w>h", {})
vim.keymap.set("n", "<leader>wj", "<C-w>j", {})
vim.keymap.set("n", "<leader>wk", "<C-w>k", {})
vim.keymap.set("n", "<leader>wl", "<C-w>l", {})
-- Reload configuration without restart nvim
vim.keymap.set("n", "<leader>r", ":so %<CR>", {})
-- Telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fr", require("telescope.builtin").resume, {
	noremap = true,
	silent = true,
	desc = "Resume",
})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", {}) -- open/close
vim.keymap.set("n", "<leader>ae", ":AnsiEsc<CR>", {}) -- open/close
vim.keymap.set("n", "<leader>nr", ":NvimTreeRefresh<CR>", {}) -- refresh
vim.keymap.set("n", "<leader>E", ":NvimTreeFindFile<CR>", {}) -- search file
vim.keymap.set("n", "<leader>nf", ":NvimTreeFocus<CR>", {}) -- focus tree
vim.keymap.set("n", "<leader>cf", "<cmd>Format<cr>", { noremap = true, silent = true })
vim.keymap.set({ "i", "x", "n", "s" }, "<C-s>", ":silent w<cr>", { desc = "Save File" })
vim.keymap.set("n", "<leader>t", "<cmd>lua vim.diagnostic.open_float()<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>ya", ":silent %y+<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-S-L>", "<cmd>BufferLineMoveNext<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-S-H>", "<cmd>BufferLineMovePrev<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>gch", utils.my_git_bcommits, { noremap = true, silent = true })
vim.keymap.set("n", "<C-S-L>", "<cmd>BufferLineMoveNext<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-S-H>", "<cmd>BufferLineMovePrev<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<S-h>", "<cmd>BufferLineCyclePrev<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<S-l>", "<cmd>BufferLineCycleNext<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>bd", "<cmd>bd<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>bp", "<cmd>BufferLineTogglePin<CR>", { noremap = true, silent = true })
vim.keymap.set(
	"n",
	"<Leader>bcu",
	utils.close_unpinned_buffers,
	{ noremap = true, silent = true, desc = "Close unpinned buffers" }
)
vim.keymap.set(
	"n",
	"<leader>bco",
	"<cmd>BufferLineCloseOthers<CR>",
	{ noremap = true, silent = true, desc = "Close all aside from open buffer." }
)
vim.keymap.set("n", "<leader>bca", "<cmd>%bdelete<CR>", { noremap = true, silent = true, desc = "Close all buffers" })
vim.keymap.set("n", "<leader>q", "<cmd>q!<cr>", { desc = "Quit All" })
vim.keymap.set("n", "<leader>ud", ":silent :ToggleDiag<cr>", { desc = "Toggle Diagnostics" })
vim.keymap.set("n", "<leader>ti", "A # type: ignore<esc>", { desc = "Insert mypy type ignore at end of line" })
vim.keymap.set("n", "<Esc>", function()
	vim.cmd("nohlsearch")
end, { desc = "Remove highlights" })
vim.keymap.set("n", "<C-[>", function()
	vim.cmd("nohlsearch")
end, { desc = "Remove highlights" })
vim.keymap.set("n", "<leader>S", '<cmd>lua require("spectre").toggle()<CR>', { desc = "Toggle Spectre" })
vim.keymap.set(
	"n",
	"<leader>sw",
	'<cmd>lua require("spectre").open_visual({select_word=true})<CR>',
	{ desc = "Search current word" }
)
vim.keymap.set(
	"v",
	"<leader>sw",
	'<esc><cmd>lua require("spectre").open_visual()<CR>',
	{ desc = "Search current word" }
)
vim.keymap.set(
	"n",
	"<leader>sp",
	'<cmd>lua require("spectre").open_file_search({select_word=true})<CR>',
	{ desc = "Search on current file" }
)
vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", { desc = "Show LSP references" }) -- show definition, references
-- vim.keymap.set("n", "gd", vim.lsp.buf.declaration, { desc = "Go to declaration" }) -- go to declaration
vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", { desc = "Show LSP definitions" }) -- show lsp definitions
vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", { desc = "Show LSP implementations" }) -- show lsp implementations
vim.keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", { desc = "Show LSP type definitions" }) -- show lsp type definitions
vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "See available code actions" }) -- see available code actions, in visual mode will apply to selection
vim.keymap.set("n", "<leader>gr", vim.lsp.buf.rename, { desc = "Smart rename" }) -- smart rename
vim.keymap.set("n", "<leader>d", "<cmd>Telescope diagnostics bufnr=0<CR>", { desc = "Show buffer diagnostics" }) -- show  diagnostics for file
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic" }) -- jump to previous diagnostic in buffer
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic" }) -- jump to next diagnostic in buffer
vim.keymap.set("n", "[D", function()
	vim.diagnostic.goto_prev({
		severity = vim.diagnostic.severity.ERROR,
		desc = "Go to previous diagnostic with error severity",
	})
end, { desc = "Go to previous error" })
vim.keymap.set("n", "]D", function()
	vim.diagnostic.goto_next({
		severity = vim.diagnostic.severity.ERROR,
		desc = "Go to next diagnostic with error severity",
	})
end, { desc = "Go to next error" })
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Show documentation for what is under cursor" }) -- show documentation for what is under cursor
vim.keymap.set("n", "<leader>lr", "<cmd>LspRestart<cr>", { desc = "Restart LSP servers silently" })
vim.keymap.set({ "n", "t" }, "<c-t>", "<cmd>FloatermToggle<cr>", { desc = "Toggle floating terminal" })
vim.keymap.set({ "n", "t" }, "<c-/>", "<cmd>FloatermToggle<cr>", { desc = "Toggle floating terminal" })
vim.api.nvim_del_keymap("n", "m")
vim.keymap.set("n", "m", "m", { desc = "mark" })
vim.keymap.set("n", "<leader>vc", "<cmd>VimtexCompile<cr>", { desc = "Vimtex compile", silent = true })
vim.keymap.set("n", "<leader>vv", "<cmd>VimtexView<cr>", { desc = "Vimtex view" })
vim.keymap.set("n", "<leader>ve", "<cmd>VimtexErrors<cr>", { desc = "Vimtex errors" })
vim.keymap.set("n", "<leader>ve", "<cmd>VimtexErrors<cr>", { desc = "Vimtex errors" })
vim.keymap.set("n", "<leader>c", "<cmd>AvanteClear<cr>", { desc = "Clear avante chat" })

-- Add cells
vim.keymap.set("n", "<leader>ja", "<cmd>JupyterAddCellBelow<CR>", { desc = "Add Jupyter cell below" })
vim.keymap.set("n", "<leader>jA", "<cmd>JupyterAddCellAbove<CR>", { desc = "Add Jupyter cell above" })

-- Cell operations
vim.keymap.set("n", "<leader>jd", "<cmd>JupyterRemoveCell<CR>", { desc = "Remove current Jupyter cell" })
vim.keymap.set("n", "<leader>jm", "<cmd>JupyterMergeCellAbove<CR>", { desc = "Merge with cell above" })
vim.keymap.set("n", "<leader>jM", "<cmd>JupyterMergeCellBelow<CR>", { desc = "Merge with cell below" })
vim.keymap.set("n", "<leader>jt", "<cmd>JupyterConvertCellType<CR>", { desc = "Convert cell type (code/markdown)" })
vim.keymap.set("v", "<leader>jm", "<cmd>JupyterMergeVisual<CR>", { desc = "Merge selected cells" })
vim.keymap.set("n", "<leader>su", function()
	require("nvim-python-repl").send_statement_definition()
end, { desc = "Send semantic unit to REPL" })

vim.keymap.set("v", "<leader>sv", function()
	require("nvim-python-repl").send_visual_to_repl()
end, { desc = "Send visual selection to REPL" })
--
vim.keymap.set("n", "<leader>sb", function()
	require("nvim-python-repl").send_buffer_to_repl()
end, { desc = "Send entire buffer to REPL" })
--
-- vim.keymap.set("n", [your keymap], function() require('nvim-python-repl').toggle_execute() end, { desc = "Automatically execute command in REPL after sent"})
--
vim.keymap.set("n", "<leader>sh", function()
	require("nvim-python-repl").toggle_vertical()
end, { desc = "Create REPL in vertical or horizontal split" })

vim.keymap.set("n", "<C-m>", function()
	require("nvim-python-repl").send_current_cell_to_repl()
end, { desc = "Sends the cell under cursor to repl" })

vim.keymap.set({ "n", "t" }, "<leader>st", function()
	require("nvim-python-repl").toggle_repl()
end, { desc = "Toggle repl" })
--
-- vim.keymap.set("n", [your keymap], function() require('nvim-python-repl').open_repl() end, { desc = "Opens the REPL in a window split"})

-- molten
-- vim.keymap.set("n", "<leader>mi", ":MoltenInit<CR>", { silent = true, desc = "Initialize the plugin" })
-- vim.keymap.set("n", "<leader>me", ":MoltenEvaluateOperator<CR>", { silent = true, desc = "run operator selection" })
-- vim.keymap.set("n", "<leader>rl", ":MoltenEvaluateLine<CR>", { silent = true, desc = "evaluate line" })
-- vim.keymap.set("n", "<leader>rr", ":MoltenReevaluateCell<CR>", { silent = true, desc = "re-evaluate cell" })
-- vim.keymap.set(
-- 	"v",
-- 	"<leader>r",
-- 	":<C-u>MoltenEvaluateVisual<CR>",
-- 	{ silent = true, desc = "evaluate visual selection" }
-- )
-- vim.keymap.set("n", "<leader>rd", ":MoltenDelete<CR>", { silent = true, desc = "molten delete cell" })
-- vim.keymap.set("n", "<leader>po", ":MoltenImagePopup<CR>", { silent = true, desc = "molten delete cell" })
-- vim.keymap.set("n", "<leader>oh", ":MoltenHideOutput<CR>", { silent = true, desc = "hide output" })
-- vim.keymap.set("n", "<leader>os", ":MoltenShowOutput<CR>", { silent = true, desc = "hide output" })
-- vim.keymap.set("n", "<leader>oe", ":noautocmd MoltenEnterOutput<CR>", { silent = true, desc = "show/enter output" })
--
-- vim.keymap.set(
-- 	"v",
-- 	"<leader>dc",
-- 	utils.define_cell_with_visual_range,
-- 	{ noremap = true, silent = false, desc = "Define a molten notebook cell" }
-- )
--
-- vim.keymap.set("n", "<leader>ip", function()
-- 	vim.cmd(("MoltenInit %s"):format(utils.get_ipy_kernel_name))
-- end, { desc = "Initialize Molten for python3", silent = true })
-- vim.keymap.set("n", "<C-n>", ":MoltenNext<CR>", { noremap = true, silent = true, desc = "Go to next molten cell" })
-- vim.keymap.set("n", "<C-p>", ":MoltenPrev<CR>", { noremap = true, silent = true, desc = "Go to previous molten cell" })
-- vim.keymap.set(
-- 	"n",
-- 	"<C-M-n>",
-- 	":MoltenReevaluateCell<CR>:MoltenNext<CR>",
-- 	{ noremap = true, silent = true, desc = "Evaluate and go to next cell" }
-- )
-- vim.keymap.set(
-- 	"n",
-- 	"<C-M-p>",
-- 	":MoltenReevaluateCell<CR>:MoltenPrev<CR>",
-- 	{ noremap = true, silent = true, desc = "Evaluate and go to previous cell" }
-- )
