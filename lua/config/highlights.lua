--
-- ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
-- ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
-- ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
-- ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
-- ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
-- ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
--
-- File: config/highlights.lua
-- Description: Custom highlight configurations for better visibility
-- Author: Claude Code

local M = {}

-- Function to setup custom highlights
function M.setup()
  -- Search highlight - brighter background for better visibility
  vim.api.nvim_set_hl(0, "Search", {
    bg = "#FFA500", -- Bright orange background
    fg = "#000000", -- Black text for contrast
    bold = true,
  })

  -- Current search highlight (when using n or N)
  vim.api.nvim_set_hl(0, "CurSearch", {
    fg = "#ffffff",
    bg = "#FF6B35", -- Brighter orange-red
    bold = true,
  })

  -- Visual selection highlight
  vim.api.nvim_set_hl(0, "Visual", {
    bg = "#264F78", -- Darker blue for better contrast
    fg = "#ffffff",
  })

  -- Cursor line highlight
  vim.api.nvim_set_hl(0, "CursorLine", {
    bg = "#2A2A37", -- Slightly brighter than default
  })

  -- Diagnostic highlights for better visibility
  vim.api.nvim_set_hl(0, "DiagnosticError", {
    fg = "#FF6B6B", -- Brighter red
    bold = true,
  })

  vim.api.nvim_set_hl(0, "DiagnosticWarn", {
    fg = "#FFD93D", -- Bright yellow
    bold = true,
  })

  vim.api.nvim_set_hl(0, "DiagnosticInfo", {
    fg = "#6BCEFF", -- Bright blue
    bold = true,
  })

  vim.api.nvim_set_hl(0, "DiagnosticHint", {
    fg = "#A8E6CF", -- Bright green
    bold = true,
  })

  -- LSP highlights
  vim.api.nvim_set_hl(0, "LspReferenceText", {
    bg = "#3A3A4A", -- Highlight for LSP references
  })

  vim.api.nvim_set_hl(0, "LspReferenceRead", {
    bg = "#3A3A4A",
  })

  vim.api.nvim_set_hl(0, "LspReferenceWrite", {
    bg = "#4A3A3A", -- Slightly different color for write references
  })

  -- IncSearch highlight (incremental search)
  vim.api.nvim_set_hl(0, "IncSearch", {
    bg = "#FFD700", -- Bright gold
    fg = "#000000",
    bold = true,
  })

  -- MatchParen highlight
  vim.api.nvim_set_hl(0, "MatchParen", {
    bg = "#FF6B6B", -- Bright red
    fg = "#ffffff",
    bold = true,
  })

  -- Whitespace highlight (if you have listchars enabled)
  vim.api.nvim_set_hl(0, "Whitespace", {
    fg = "#4A4A5A", -- Visible but not distracting
  })

  -- Tab line highlights
  vim.api.nvim_set_hl(0, "TabLineSel", {
    bg = "#3A3A4A",
    fg = "#ffffff",
    bold = true,
  })

  vim.api.nvim_set_hl(0, "TabLine", {
    bg = "#2A2A37",
    fg = "#888888",
  })

  print("Custom highlights loaded for better visibility")
end

return M