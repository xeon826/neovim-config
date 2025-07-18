return {{
    "nvim-treesitter/nvim-treesitter",
    version = false, -- last release is way too old and doesn"t work on Windows
    build = ":TSUpdate",
    dependencies = {{
        "nvim-treesitter/nvim-treesitter-textobjects",
        init = function()
            local plugin = require("lazy.core.config").spec.plugins["nvim-treesitter"]
            local opts = require("lazy.core.plugin").values(plugin, "opts", false)
            local enabled = false
            if opts.textobjects then
                for _, mod in ipairs({"move", "select", "swap", "lsp_interop"}) do
                    if opts.textobjects[mod] and opts.textobjects[mod].enable then
                        enabled = true
                        break
                    end
                end
            end
            if not enabled then
                require("lazy.core.loader").disable_rtp_plugin("nvim-treesitter-textobjects")
            end
        end
    }},
    opts = {
        -- A list of parser names, or "all"
        ensure_installed = {"go", "python", "dockerfile", "json", "yaml", "markdown", "html", "scss", "css", "blade", "vim", "jsonc", "php", "javascript", "dart"},

        highlight = {
            enable = true,
            use_languagetree = true
        },
        indent = {
            enable = true
        },
        autotag = {
            enable = true
        },
        context_commentstring = {
            enable = true,
            enable_autocmd = false
        },
        refactor = {
            highlight_definitions = {
                enable = true
            },
            highlight_current_scope = {
                enable = false
            }
        }
    },
    config = function(_, opts)
        require("nvim-treesitter.configs").setup(opts)

    end
}}

