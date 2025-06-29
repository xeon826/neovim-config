return {
    {
        "yetone/avante.nvim",
        event = "VeryLazy",
        lazy = false,
        version = false, -- Always pull the latest change
        opts = {
            rag_service = {
                enabled = false, -- Requires OPENAI_API_KEY to be set
            },
            providers = { -- Updated the structure to `providers`
                claude = { -- Moved `claude` config under `providers`
                    endpoint = "https://api.anthropic.com",
                    model = "claude-3-5-sonnet-20241022",
                    extra_request_body = { -- Nested `temperature` and `max_tokens` under `extra_request_body`
                        temperature = 0,
                        max_tokens = 8192,
                    },
                },
                groq = { -- Moved `groq` config under `providers`
                    __inherited_from = "openai",
                    api_key_name = "GROQ_API_KEY",
                    endpoint = "https://api.groq.com/openai/v1/",
                    model = "llama-3.3-70b-versatile",
                    max_tokens = 32768,
                },
            },
            cursor_applying_provider = "groq",
            behaviour = {
                enable_cursor_planning_mode = true,
            },
        },
        build = "make",
        dependencies = {
            "stevearc/dressing.nvim",
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            "hrsh7th/nvim-cmp",
            "nvim-tree/nvim-web-devicons",
            "zbirenbaum/copilot.lua",
            {
                "HakonHarnes/img-clip.nvim",
                event = "VeryLazy",
                opts = {
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

