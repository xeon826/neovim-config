-- utils.lua
local previewers = require("telescope.previewers")
local builtin = require("telescope.builtin")
local delta = previewers.new_termopen_previewer({
	get_command = function(entry)
		return {
			"git",
			"-c",
			"core.pager=delta",
			"-c",
			"delta.side-by-side=false",
			"-c",
			"delta.line-numbers=true", -- Enable line numbers
			"diff",
			entry.value .. "^!",
			"--",
			entry.current_file,
		}
	end,
})
local M = {}

M.my_git_bcommits = function(opts)
	opts = opts or {}
	opts.previewer = {
		delta,
		previewers.git_commit_message.new(opts),
		previewers.git_commit_diff_as_was.new(opts),
	}

	builtin.git_bcommits(opts)
end

M.my_git_commits = function(opts)
	opts = opts or {}
	opts.previewer = {
		delta,
		previewers.git_commit_message.new(opts),
		previewers.git_commit_diff_as_was.new(opts),
	}

	builtin.git_commits(opts)
end

function M.close_unpinned_buffers()
	local bufferline = require("bufferline")
	local commands = require("bufferline.commands")
	local current = vim.api.nvim_get_current_buf()
	vim.schedule(function()
		for _, e in ipairs(bufferline.get_elements().elements) do
			local is_current = e.id == current
			local is_pinned = bufferline.groups._is_pinned(e)
			if not is_current and not is_pinned then
				commands.unpin_and_close(e.id)
			end
		end
	end)
end

function M.get_ipy_kernel_name()
	local venv = os.getenv("VIRTUAL_ENV") or os.getenv("CONDA_PREFIX")
	local kernel_name = ""
	if venv ~= nil then
		-- in the form of /home/benlubas/.virtualenvs/VENV_NAME
		kernel_name = venv:match("([^/]+)$")

	else
		kernel_name = "python3-local"
	end
	return kernel_name
end

M.define_cell_with_visual_range = function()
	-- Get the marks while still in visual mode
	local start_line = vim.api.nvim_buf_get_mark(0, "<")[1]
	local end_line = vim.api.nvim_buf_get_mark(0, ">")[1]
	
	-- Now exit visual mode
	vim.cmd("normal! \\<Esc>")
	
	-- Call the MoltenDefineCell function with the extracted range and language
	vim.fn.MoltenDefineCell(start_line, end_line, M.get_ipy_kernel_name())
end

return M

-- local delta = previewers.new_termopen_previewer {
--   get_command = function(entry)
--     return { 'git', '-c', 'core.pager=delta', '-c', 'delta.side-by-side=false', 'diff', entry.value .. '^!', '--', entry.current_file }
--   end
-- }
--
-- M.my_git_bcommits = function(opts)
--   opts = opts or {}
--   opts.previewer = {
--     delta,
--     previewers.git_commit_message.new(opts),
--     previewers.git_commit_diff_as_was.new(opts),
--   }
--
--   builtin.git_bcommits(opts)
-- end
