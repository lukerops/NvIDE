local M = {}

function M.setup(opts)
  -- normalize inputs
  opts = opts or {}

  local lazy = require("nvide.core.lazy")
  lazy.setup(opts)
end

return M
