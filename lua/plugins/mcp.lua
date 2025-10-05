return {
	"ravitemer/mcphub.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	build = "/usr/bin/npm install -g mcp-hub@latest", -- Installs `mcp-hub` node binary globally
	config = function()
		require("mcphub").setup({
			extensions = {
				copilotchat = {
					enabled = true,
					convert_tools_to_functions = true, -- Convert MCP tools to CopilotChat functions
					convert_resources_to_functions = true, -- Convert MCP resources to CopilotChat functions
					add_mcp_prefix = false, -- Add "mcp_" prefix to function names
				},
			},
			global_env = {
				GITHUB_PERSONAL_ACCESS_TOKEN = os.getenv("GITHUB_PERSONAL_ACCESS_TOKEN"), -- Set your GitHub token in your environment variables for better LLM access
			}
		})
	end,
}
