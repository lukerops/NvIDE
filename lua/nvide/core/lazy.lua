local M = {}

function M.install()
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
end

function M.setup(opts)
  -- install lazy.nvim
  M.install()

  -- prepare to load the plugins
  plugins = vim.tbl_deep_extend("force", { import = "nvide.plugins" }, opts or {})

  require("lazy").setup({
    spec = plugins,
    ui = {
      border = "rounded",
    },
  })
end

return M
