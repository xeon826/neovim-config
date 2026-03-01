# AGENTS.md - Neovim Configuration

## Overview
User's LazyVim-based Neovim dotfiles. Manages ~45 plugins via lazy.nvim.

## Project Structure
```
init.lua           # Entry point (requires config/, validates deps)
lazyvim.json       # LazyVim metadata
lua/config/        # Core config: init, options, keymaps, autocmds, utils, highlights
lua/plugins/      # 45 plugin configs (*.lua)
after/queries/    # Tree-sitter queries (blade)
pack/plugins/     # Bundled plugins (nvim-dap)
```

## Dev Flow
- **Syntax check**: `luacheck lua/` (requires luacheck installed)
- **Health check**: Neovim - `:checkhealth` or `:Lazy`
- **Reload config**: `:source $MYVIMRC` or `:Lazy`

## Key Patterns
- Plugins defined in `lua/plugins/*.lua` (one file per plugin)
- Lazy loading via `event`, `ft`, `cmd` tables
- Keymaps in `lua/config/keymaps.lua` (uses which-key)
- Options in `lua/config/options.lua` (vim.opt)

## Critical Files
- `init.lua:5-21` - Dependency validation (git, rg, fd)
- `lua/config/init.lua` - Main config loader
- `lua/plugins/` - All plugin configs are standalone

## Constraints
- Neovim 0.8+ required (enforced in init.lua)
- Requires: git, ripgrep, fd (or fdfind)
