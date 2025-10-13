return {
  {
    "preservim/vimux",
    lazy = false,
    cond = function()
      return vim.env.TMUX ~= nil
    end,
  },
  {
    "vim-test/vim-test",
    lazy = false,
    dependencies = { "preservim/vimux" },
    config = function()
      vim.keymap.set('n', '<leader>t', ':TestNearest<CR>')
      vim.keymap.set('n', '<leader>T', ':TestFile<CR>')
      vim.keymap.set('n', '<leader>a', ':TestSuite<CR>')
      vim.keymap.set('n', '<leader>l', ':TestLast<CR>')
      vim.keymap.set('n', '<leader>g', ':TestVisit<CR>')

      -- Use vimux when in tmux, neovim terminal otherwise
      if vim.env.TMUX ~= nil then
        vim.cmd("let test#strategy = 'vimux'")
      else
        vim.cmd("let test#strategy = 'neovim'")
      end
    end,
  },
}
