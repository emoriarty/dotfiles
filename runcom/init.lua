-- Indentation settings
vim.cmd("set expandtab")     -- Use spaces instead of tabs
vim.cmd("set tabstop=2")     -- Tab size
vim.cmd("set softtabstop=2") -- Tab size when editing
vim.cmd("set shiftwidth=2")  -- Number of spaces when indenting
vim.cmd("set smarttab")      -- Smart tabs
vim.cmd("set autoindent")    -- Auto indent
vim.cmd("set smartindent")   -- Smart indent

-- UI settings
vim.cmd("set ruler")          -- Show line numbers
vim.cmd("set relativenumber") -- Show relative line numbers
vim.cmd("set numberwidth=2")  -- Highlight current line
vim.cmd("set laststatus=2")   -- Always show status line
vim.cmd("set showtabline=2")  -- Always show tab line
vim.cmd("set showmode")       -- Show current mode
vim.cmd("set showcmd")        -- Show current command
vim.cmd("set scrolloff=5")    -- Keep 5 lines above and below cursor
vim.cmd("set nowrap")         -- Wrap lines
vim.cmd("set linebreak")      -- Break lines at word boundaries

-- Scroll settings
vim.cmd("set sidescroll=1")     -- Scroll one column at a time
vim.cmd("set sidescrolloff=16") -- Keep 16 columns to the left and right of the cursor
vim.cmd("set scrolloff=8")      -- Keep 8 lines above and below the cursor

-- PLUGIN MANAGER SETUP (lazy.nvim)
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  -- bootstrap lazy.nvim
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

-- PLUGINS
local plugins = {
  { 'projekt0n/github-nvim-theme', lazy = false, priority = 1000 },                               -- GitHub theme
  { 'nvim-telescope/telescope.nvim', tag = '0.1.6', dependencies = { 'nvim-lua/plenary.nvim' } }, -- Telescope plugin allows for fuzzy finding, live grep, etc.
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },                                     -- Treesitter plugin for syntax highlighting, indentation, etc.
  { "github/copilot.vim" }                                                                        -- Copilot plugin for AI code completion
}
local opts = {}

require("lazy").setup(plugins, opts)

-- THEME SETUP
require('github-theme').setup({})

vim.cmd('colorscheme github_light')

-- TELESCOPE SETUP
local builtin = require('telescope.builtin')

vim.keymap.set('n', '<C-p>', builtin.find_files, {})
vim.keymap.set('n', '<C-g>', builtin.live_grep, {})

-- TREESITTER SETUP
local treesitter_configs = require("nvim-treesitter.configs")

treesitter_configs.setup({
  ensure_installed = { "lua", "ruby", "javascript", "html" },
  highlight = { enable = true },
  indent = { enable = true }
})
