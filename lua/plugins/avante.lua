return {
	{
		"yetone/avante.nvim",
		event = "VeryLazy",
		lazy = false,
		version = false, -- set this if you want to always pull the latest change
		opts = {
			rag_service = {
				enabled = false,
				host_mount = os.getenv("HOME"),
				provider = "ollama",
				llm_model = "codellama",
				embed_model = "nomic-embed-text",
				endpoint = "http://172.17.0.1:11434",
			},
			provider = "ollama",
			ollama = {
				endpoint = "http://127.0.0.1:11434", -- Note that there is no /v1 at the end.
				model = "qwq:32b",
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
