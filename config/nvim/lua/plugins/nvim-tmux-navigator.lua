return {
  "christoomey/vim-tmux-navigator",
  vim.keymap.set("n", "<c-k>", ":TmuxNavigateUp<CR>"), -- Move up
  vim.keymap.set("n", "<c-j>", ":TmuxNavigateDown<CR>"), -- Move down
  vim.keymap.set("n", "<c-h>", ":TmuxNavigateLeft<CR>"), -- Move left
  vim.keymap.set("n", "<c-l>", ":TmuxNavigateRight<CR>"), -- Move right
}
