return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
    -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  config = function()
    -- Open/close neotree
    vim.keymap.set("n", "<C-n>", ":Neotree filesystem toggle left<CR>", {})
    -- Reveal current file in neotree
    vim.keymap.set("n", "<leader>r", ":Neotree reveal<CR>", {})
  end,
}
