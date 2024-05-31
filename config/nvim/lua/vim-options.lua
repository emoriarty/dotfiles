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

-- create a function that creates a directory if it doesn't exist
vim.api.nvim_exec([[
  if !exists('*MKDir')")
    function! MKDir(path)
      silent execute '!mkdir '.a:path.' > /dev/null 2>&1'
    endfunction
  endif
]], false)

-- Backup settings
vim.cmd("call MKDir('~/.vim/backup')") -- Create backup directory
vim.cmd("set backup")                  -- Enable backup
vim.cmd("set backupdir=~/.vim/backup//") -- Backup directory
vim.cmd("set backupext=.bak")          -- Backup extension

-- Swap settings
vim.cmd("call MKDir($HOME.'/.vim/swap')") -- Create swap directory
vim.cmd("set swapfile")              -- Enable swap files
vim.cmd("set directory=~/.vim/swap//") -- Swap directory
vim.cmd("set updatecount=100")       -- Number of changes before writing swap file

-- Undo settings
vim.cmd("call MKDir($HOME.'/.vim/undo')") -- Create swap directory
vim.cmd("set undofile")            -- Enable undo files
vim.cmd("set undodir=~/.vim/undo//") -- Undo directory
vim.cmd("set undolevels=1000")     -- Number of changes to keep
vim.cmd("set undoreload=10000")    -- Number of lines to keep
