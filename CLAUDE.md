# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a Neovim configuration repository using Lazy.nvim as the plugin manager. The configuration is modular and organized with a focus on developer productivity, featuring extensive AI integration (Claude Code, CodeCompanion), fuzzy finding (fzf-lua), and comprehensive LSP support.

## Architecture

### Directory Structure
- `init.lua` - Entry point that loads main configuration
- `lua/config/` - Core Neovim settings and mappings
  - `init.lua` - Main configuration loader and Lazy.nvim setup
  - `options.lua` - General Neovim options and settings
  - `keymaps.lua` - Key mappings and shortcuts
  - `autocmds.lua` - Autocommands and event handlers
  - `utils.lua` - Utility functions and helpers
- `lua/plugins/` - Plugin configurations organized by functionality
  - Individual plugin files (e.g., `lsp.lua`, `treesitter.lua`, `claudecode.lua`)

### Plugin Management
- Uses **Lazy.nvim** for plugin management
- Plugin specifications are in `lua/plugins/` directory
- Lockfile: `lazy-lock.json`
- Plugin installation: Automatically handled by Lazy.nvim on startup

## Key Features and Integrations

### AI Assistant Integration
- **Claude Code**: Primary AI assistant with extensive key mappings
  - Toggle: `<C-,>` or `<leader>ac`
  - Focus: `<leader>af`
  - Resume: `<leader>ar`
  - Add current buffer: `<leader>ab`
  - Send selection: `<leader>as` (visual mode)
  - Uses snacks.nvim for terminal provider
- **CodeCompanion**: Additional AI coding assistant
- **Claude FZF**: History and fuzzy finding for Claude interactions

### Fuzzy Finding (fzf-lua)
- Files: `<leader>sf` or `<leader>f`
- Live grep: `<leader>sg` or `<leader>/`
- Buffers: `<leader>sb` or `<leader>,`
- LSP: `gd` (definitions), `gr` (references), `gi` (implementations)
- Recent files: `<leader>sr`
- Command history: `<leader>sC` or `<leader>:`

### Language Support
- **LSP**: Configured via mason.nvim with automatic installation
  - Python (pylsp with Jedi)
  - TypeScript/JavaScript
  - Java (nvim-java)
  - Docker, Bash, YAML, VimL
  - Lua, JSON, and more
- **Treesitter**: Syntax highlighting and text objects
- **Debugging**: nvim-dap with Python support

### UI and Appearance
- **Colorscheme**: Tokyonight-night (default), with Rose-pine and Oxocarbon available
- **Statusline**: Custom lualine with MCPHub integration
- **File Explorer**: nvim-tree
- **Terminal**: floaterm integration

## Common Development Tasks

### Plugin Management
- Install/update plugins: `:Lazy sync`
- Check for updates: `:Lazy check`
- View plugin status: `:Lazy`

### LSP and Diagnostics
- Toggle diagnostics: `<leader>td`
- Restart LSP: `<leader>lr`
- View diagnostics: `<leader>t` (float) or `<leader>fd` (fzf-lua)
- Navigate diagnostics: `[d`, `]d` (all), `[D`, `]D` (errors only)

### Buffer and Window Management
- Window navigation: `<C-h/j/k/l>`
- Window resizing: `=`/`-` (vertical), `<C-=>`/`<C-->` (horizontal)
- Close all buffers: `<leader>bca`
- Save file: `<C-s>`

### Git Integration
- LazyGit: `<leader>gg`
- Git signs in gutter
- Conflict markers highlighting

## Key Mappings Reference

### Navigation
- `<C-h/j/k/l>` - Window navigation
- `<leader>sb` - Switch buffers
- `<leader>sf` - Find files
- `<leader>sg` - Live grep

### AI Integration
- `<C-\\>` - Toggle Claude Code (changed from `<C-,>` due to terminal compatibility)
- `<leader>ac` - Toggle Claude
- `<leader>af` - Focus Claude
- `<leader>as` - Send selection to Claude

### LSP Actions
- `K` - Hover documentation
- `gd` - Go to definition
- `gr` - Find references
- `<leader>ca` - Code actions
- `<leader>gr` - Rename symbol

### Utility
- `<leader>ya` - Yank entire buffer
- `<leader>ti` - Insert mypy type ignore
- `<leader>ch` - Run checkhealth
- `<leader>mi` - Run MCPHub insert_edit_into_file

## Development Notes

- Uses 4-space indentation for most languages
- Auto-session management for project persistence
- Custom lualine with MCPHub server status indicator
- Python virtual environment detection for Jupyter kernels
- Formatter.nvim for code formatting
- Extensive autocmds for language-specific settings

## External Dependencies

Required system tools (validated on startup):
- `git` - Version control
- `rg` (ripgrep) - Fast searching
- `fd` or `fdfind` - File finding

Optional but recommended:
- `lazygit` - Git TUI
- `delta` - Git diff enhancement
- Python with virtualenv support