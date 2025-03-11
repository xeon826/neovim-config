return {
	{
		"yetone/avante.nvim",
		event = "VeryLazy",
		lazy = false,
		version = false,-- set this if you want to always pull the latest change
		opts = {
      rag_service = {
        enabled = true,
        host_mount = os.getenv("HOME"),
        provider = "ollama",
        llm_model = "llama3",
        embed_model = "nomic-embed-text",
        endpoint = "http://172.17.0.1:11434",
        -- index_patterns = {
        --   "**/*.lua",
        --   "**/*.md",
        --   "**/*.txt",
        --   "**/*.py",
        --   -- Add other file patterns you want to index
        -- },
        -- exclude_patterns = {
        --   "**/node_modules/**",
        --   "**/.git/**",
        --   -- Add patterns to exclude
        -- },
        -- Optional: force reindex on startup
        -- force_reindex = true,
      },
			provider = "claude",
			claude = {
				endpoint = "https://api.anthropic.com",
				model = "claude-3-5-sonnet-20241022",
				temperature = 0,
				max_tokens = 8192,
				disable_tools = false,
			},
			cursor_applying_provider = "groq",
			behaviour = {
				--- ... existing behaviours
				enable_cursor_planning_mode = true,
			},
			vendors = {
				--- ... existing vendors
				groq = {
					__inherited_from = "openai",
					api_key_name = "GROQ_API_KEY",
					endpoint = "https://api.groq.com/openai/v1/",
					model = "llama-3.3-70b-versatile",
					max_tokens = 32768,
				},
			},
		},
		-- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
		build = "make",
		-- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
		dependencies = {
			"stevearc/dressing.nvim",
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			--- The below dependencies are optional,
			"hrsh7th/nvim-cmp",
			"nvim-tree/nvim-web-devicons",
			"zbirenbaum/copilot.lua",
			{
				-- support for image pasting
				"HakonHarnes/img-clip.nvim",
				event = "VeryLazy",
				opts = {
					-- recommended settings
					default = {
						embed_image_as_base64 = false,
						prompt_for_file_name = false,
						drag_and_drop = {
							insert_mode = true,
						},
					},
				},
			},
		},
	},
}
