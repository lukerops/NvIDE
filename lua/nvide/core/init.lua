local M = {}

function M.setup(opts)
  -- normalize the inputs
  opts = opts or {}

  -- install lazy.nvim
  local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

  if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
      "git",
      "clone",
      "--filter=blob:none",
      "https://github.com/folke/lazy.nvim.git",
      "--branch=stable", -- latest stable release
      lazypath,
    })
  end

  vim.opt.rtp:prepend(lazypath)

  -- prepare to load the plugins
  plugins = vim.tbl_deep_extend("force", { import = "nvide.plugins" }, opts.plugins or {})

  require("lazy").setup(plugins)
end

return M
