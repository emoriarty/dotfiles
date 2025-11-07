return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")

    -- Helper function to check if Gemfile exists - using vim.fn.findfile which searches up the directory tree
    local function has_gemfile()
      return vim.fn.findfile("Gemfile", ".;") ~= ""
    end

    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.diagnostics.erb_lint,
        -- Python: ruff is now configured as an LSP server in lsp-config.lua
        -- This provides better integration than none-ls
        null_ls.builtins.diagnostics.rubocop.with({
          command = "bundle",
          args = { "exec", "rubocop", "--format", "json", "--force-exclusion", "--stdin", "$FILENAME" },
          runtime_condition = function()
            return has_gemfile()
          end,
        }),
        null_ls.builtins.diagnostics.rubocop.with({
          runtime_condition = function()
            return not has_gemfile()
          end,
        }),
        null_ls.builtins.formatting.rubocop.with({
          command = "bundle",
          args = { "exec", "rubocop", "--auto-correct", "-f", "quiet", "--stderr", "--stdin", "$FILENAME" },
          runtime_condition = function()
            return has_gemfile()
          end,
        }),
        null_ls.builtins.formatting.rubocop.with({
          runtime_condition = function()
            return not has_gemfile()
          end,
        }),
      },
    })

    vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
  end,
}
