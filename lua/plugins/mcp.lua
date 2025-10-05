return {
	"ravitemer/mcphub.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	build = "/usr/bin/npm install -g mcp-hub@latest", -- Installs `mcp-hub` node binary globally
	config = function()
		require("mcphub").setup({
			GITHUB_PERSONAL_ACCESS_TOKEN = vim.env.GITHUB_PERSONAL_ACCESS_TOKEN,
		})
	end,
}
