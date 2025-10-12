-- ============================================================================
-- PLUGIN MANAGER SETUP (lazy.nvim)
-- ============================================================================
-- lazy.nvim is a modern plugin manager for Neovim that provides lazy-loading
-- capabilities, which means plugins are only loaded when needed, improving
-- startup time.

-- Determine where lazy.nvim should be installed
-- stdpath("data") returns Neovim's data directory (usually ~/.local/share/nvim)
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Check if lazy.nvim is already installed
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  -- Bootstrap lazy.nvim: automatically clone the repository if it doesn't exist
  -- This allows the config to be self-contained and portable
  -- stylua: ignore
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",  -- Shallow clone to reduce download size
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",     -- Use the stable branch for reliability
    lazypath
  })
end

-- Add lazy.nvim to the runtime path so Neovim can find it
-- This makes the lazy module available via require("lazy")
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

-- ============================================================================
-- LANGUAGE-SPECIFIC CONFIGURATION
-- ============================================================================
-- Configure Ruby host program for Neovim's Ruby provider
-- This uses mise to find the correct Ruby interpreter for Ruby-based plugins
vim.g.ruby_host_prog = vim.fn.trim(vim.fn.system("mise which ruby"))

-- Disable Node.js provider - not needed by current plugins
-- LSP servers (ts_ls, etc.) run as standalone processes and don't use this
vim.g.loaded_node_provider = 0

-- ============================================================================
-- GLOBAL SETTINGS
-- ============================================================================
-- Configure clipboard to use system clipboard for yank/paste operations
-- "unnamed" uses the system clipboard for all yank, delete, change and put operations
vim.api.nvim_set_option("clipboard", "unnamed")

-- ============================================================================
-- LOAD CONFIGURATION MODULES
-- ============================================================================
-- Load general Vim options (e.g., line numbers, indentation, search settings)
require("vim-options")

-- Load custom keyboard shortcuts and key mappings
require("vim-shortcuts")

-- Initialize lazy.nvim and load all plugins from the "plugins" directory
-- This will source all Lua files in lua/plugins/ directory
require("lazy").setup("plugins")

-- Ruby LSP setup (currently disabled)
-- Uncomment to enable additional Ruby language server configuration
-- require("ruby-lsp-setup")
