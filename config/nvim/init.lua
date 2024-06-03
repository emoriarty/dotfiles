-- PLUGIN MANAGER SETUP (lazy.nvim)
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  -- bootstrap lazy.nvim
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

-- set let g:ruby_host_prog TODO: review if it works as expected
vim.g.ruby_host_prog = vim.fn.system("rbenv which ruby")

require("vim-options")
require("lazy").setup("plugins")
require("vim-init")
