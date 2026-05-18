return {
  {
    "WhoIsSethDaniel/toggle-lsp-diagnostics.nvim",
    config = function()
      -- Neovim 0.10+ added a 'jump' key to vim.diagnostic.config() which is a
      -- table ({ wrap = true }). This plugin treats all config keys as boolean-
      -- toggleable, so it breaks when it passes jump = true to vim.diagnostic.config().
      -- Workaround: override init to filter out non-boolean keys before configuring.
      local diag = require("toggle_lsp_diagnostics")
      local orig_init = diag.init

      diag.init = function(user_settings)
        user_settings = user_settings or {}
        -- Preserve the default (table) value for 'jump' so the plugin won't overwrite it with a boolean
        local jump_default = vim.diagnostic.config().jump
        if jump_default ~= nil then
          user_settings.jump = jump_default
        end
        orig_init(user_settings)
      end

      diag.init()
    end,
    event = "VimEnter",
  },
}
