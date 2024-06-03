-- Function to check if a file exists
local function file_exists(path)
  local f = io.open(path, "r")
  if f then
    f:close()
  end
  return f ~= nil
end

-- Function to search for .ruby-version in the current directory and parent directories
local function find_ruby_version_file()
  local current_dir = vim.fn.getcwd()
  local sep = package.config:sub(1, 1) -- Get the path separator

  while current_dir do
    local ruby_version_path = current_dir .. sep .. ".ruby-version"
    if file_exists(ruby_version_path) then
      return ruby_version_path
    end

    -- Move to the parent directory
    local parent_dir = current_dir:match("^(.*)" .. sep)
    if parent_dir == current_dir then
      return nil -- Reached the root directory
    end
    current_dir = parent_dir
  end

  return nil -- Not found
end

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    -- Example usage
    local current_ruby_version = vim.fn.system("rbenv version-name")
    local local_ruby_version = vim.fn.system("cd ~/.local/share/nvim && rbenv version-name")

    if current_ruby_version ~= local_ruby_version then
      -- uninstall rubocop with mason command
      vim.api.nvim_command("MasonUninstall rubocop")

      -- run rbenv install from the .ruby-version file
      print("Installing ruby version: " .. current_ruby_version)
      vim.fn.system("cd ~/.local/share/nvim && rbenv local " .. current_ruby_version)

      -- install rubocop with mason command
      vim.api.nvim_command("MasonInstall rubocop")
    end
  end,
})
