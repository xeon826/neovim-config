return {
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = "cd app && npm install && git reset --hard",  -- Use this build command instead
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
	},
}
