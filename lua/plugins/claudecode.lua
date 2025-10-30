local toggle_key = "<C-,>"
return {
  {
    "coder/claudecode.nvim",
    dependencies = { "folke/snacks.nvim" },
    keys = {
      { toggle_key, "<cmd>ClaudeCodeFocus<cr>", desc = "Claude Code", mode = { "n", "x" } },
    },
    opts = {
      terminal = {
        provider="snacks",
        ---@module "snacks"
        ---@type snacks.win.Config|{}
        snacks_win_opts = {
          position = "right",
          width = 0.4,
          keys = {
            claude_hide = {
              toggle_key,
              function(self)
                self:hide()
              end,
              mode = "t",
              desc = "Hide",
            },
            focus_nvim = {
              "<C-n>",
              function(self)
                vim.api.nvim_set_current_win(vim.api.nvim_get_current_win())
              end,
              mode = "t",
              desc = "Focus Neovim",
            },
          },
        },
      },
    },
  },
}
