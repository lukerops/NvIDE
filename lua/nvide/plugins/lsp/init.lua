return {
  -- package manager
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate", -- :MasonUpdate updates registry contents
    opts = {
      ui = {
        border = "rounded",
      },
    },
  },

  -- lspconfig
  {
    "neovim/nvim-lspconfig",
    event = "BufReadPre",
    dependencies = {
      { "folke/neoconf.nvim", cmd = "Neoconf", config = true },
      { "folke/neodev.nvim", opts = { experimental = { pathStrict = true } } },
      "williamboman/mason-lspconfig.nvim",
      {
        "SmiteshP/nvim-navic",
        opts = {
          highlight = true,
        },
      },
    },
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        terraformls = {},
        dockerls = {},
      }
    },
    ---@param opts PluginLspOpts
    config = function(plugin, opts)
      -- change LspInfo window border
      require('lspconfig.ui.windows').default_options.border = "rounded"

      -- config navic as winbar (breadcrumb)
      vim.o.winbar = "  %{%v:lua.require('nvim-navic').get_location()%}"

      -- diagnostics
      vim.fn.sign_define("DiagnosticsSignError", {text = ""})
      vim.fn.sign_define("DiagnosticsSignWarning", {text = ""})
      vim.fn.sign_define("DiagnosticsSignInformation", {text = ""})
      vim.fn.sign_define("DiagnosticsSignHint", {text = ""})
      vim.diagnostic.config({
        underline = true,
        update_in_insert = false,
        virtual_text = { spacing = 4, prefix = "●" },
        severity_sort = true,
      })

      local servers = opts.servers or {}
      local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

      -- require("mason").setup()
      require("mason-lspconfig").setup({ ensure_installed = vim.tbl_keys(servers) })
      for server, config in pairs(servers) do
        require("lspconfig")[server].setup(vim.tbl_deep_extend("force", config, {
          capabilities = capabilities,
          on_attach = function(client, bufnr)
            if client.server_capabilities.documentSymbolProvider then
              require("nvim-navic").attach(client, bufnr)
            end
          end,
        }))
      end
    end,
  },
}
