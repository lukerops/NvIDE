return {
  -- file explorer
  {
    "nvim-neo-tree/neo-tree.nvim",
    cmd = "Neotree",
    branch = "v2.x",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      -- {
      --   "<leader>fe",
      --   function()
      --     require("neo-tree.command").execute({
      --       toggle = true,
      --       -- dir = require("lazyvim.util").get_root(),
      --     })
      --   end,
      --   desc = "Explorer NeoTree (root dir)",
      -- },
      -- { "<leader>fE", "<cmd>Neotree toggle<CR>", desc = "Explorer NeoTree (cwd)" },
      -- { "<leader>e", "<leader>fe", desc = "Explorer NeoTree (root dir)", remap = true },
      -- { "<leader>E", "<leader>fE", desc = "Explorer NeoTree (cwd)", remap = true },
      { "<leader>fe", "<cmd>Neotree toggle<CR>", desc = "Explorer NeoTree (cwd)" },
    },
    opts = {
      auto_clean_after_session_restore = true,
      close_if_last_window = true,
      source_selector = {
        winbar = true,
        content_layout = "center",
      },
      filesystem = {
        follow_current_file = true,
      },
    },
  },

  -- text highlight/parser
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = "BufReadPost",
    ---@type TSConfig
    opts = {
      ensure_installed = {
        "go",
        "javascript",
        "typescript",
        "python",
        "graphql",
        "json",
        "yaml",
        "lua",
        "bash",
        "dockerfile",
        "query",
        "regex",
        "toml",
      },
      highlight = {
        enable = true,
      },
      indent = {
        enable = true
      },
      -- incremental_selection = { enable = true },
      rainbow = {
        enable = true,
        -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
        extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
        max_file_lines = nil, -- Do not enable for files with more than n lines, int
        -- colors = {}, -- table of hex strings
        -- termcolors = {} -- table of colour name strings
      }
    },
    ---@param opts TSConfig
    config = function(plugin, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    event = "BufReadPost",
  },

  -- search/replace in multiple files
  {
    "windwp/nvim-spectre",
    -- stylua: ignore
    keys = {
      { "<leader>sr", function() require("spectre").open() end, desc = "Replace in files (Spectre)" },
    },
  },

  -- fuzzy finder
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    -- event = "VeryLazy",
    -- lazy = true,
    tag = "0.1.1",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<leader>,", "<cmd>Telescope buffers show_all_buffers=true<cr>", desc = "Switch Buffer" },
      { "<leader>/", "<cmd>Telescope live_grep<cr>", desc = "Find in Files (Grep)" },
      { "<leader>:", "<cmd>Telescope command_history<cr>", desc = "Command History" },
      { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
      { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
      { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent" },
      { "<leader>gc", "<cmd>Telescope git_commits<CR>", desc = "commits" },
      { "<leader>gs", "<cmd>Telescope git_status<CR>", desc = "status" },
      { "<leader>sC", "<cmd>Telescope commands<cr>", desc = "Commands" },
      { "<leader>sM", "<cmd>Telescope man_pages<cr>", desc = "Man Pages" },
      { "<leader>sa", "<cmd>Telescope autocommands<cr>", desc = "Auto Commands" },
      { "<leader>sb", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Buffer" },
      { "<leader>sc", "<cmd>Telescope command_history<cr>", desc = "Command History" },
      { "<leader>sg", "<cmd>Telescope live_grep<cr>", desc = "Grep" },
      { "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Help Pages" },
      { "<leader>sH", "<cmd>Telescope highlights<cr>", desc = "Search Highlight Groups" },
      { "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Key Maps" },
      { "<leader>sm", "<cmd>Telescope marks<cr>", desc = "Jump to Mark" },
      { "<leader>so", "<cmd>Telescope vim_options<cr>", desc = "Options" },
      { "<leader>st", "<cmd>Telescope builtin<cr>", desc = "Telescope" },
      -- {
      --   "<leader>ss",
      --   Util.telescope("lsp_document_symbols", {
      --     symbols = {
      --       "Class",
      --       "Function",
      --       "Method",
      --       "Constructor",
      --       "Interface",
      --       "Module",
      --       "Struct",
      --       "Trait",
      --       "Field",
      --       "Property",
      --     },
      --   }),
      --   desc = "Goto Symbol",
      -- },
    },
    opts = {
      defaults = {
        prompt_prefix = " ",
        selection_caret = " ",
        mappings = {
          -- i = {
          --   ["<c-t>"] = function(...)
          --     return require("trouble.providers.telescope").open_with_trouble(...)
          --   end,
          --   ["<C-i>"] = function()
          --     Util.telescope("find_files", { no_ignore = true })()
          --   end,
          --   ["<C-h>"] = function()
          --     Util.telescope("find_files", { hidden = true })()
          --   end,
          --   ["<C-Down>"] = function(...)
          --     return require("telescope.actions").cycle_history_next(...)
          --   end,
          --   ["<C-Up>"] = function(...)
          --     return require("telescope.actions").cycle_history_prev(...)
          --   end,
          -- },
          i = {
            ["<C-Up>"] = function(...)
              return require("telescope.actions").preview_scrolling_up(...)
            end,
            ["<C-Down>"] = function(...)
              return require("telescope.actions").preview_scrolling_down(...)
            end,
          },
          n = {
            ["<C-Up>"] = function(...)
              return require("telescope.actions").preview_scrolling_up(...)
            end,
            ["<C-Down>"] = function(...)
              return require("telescope.actions").preview_scrolling_down(...)
            end,
          },
        },
      },
    },
    -- init = function()
    --   require("telescope").load_extension("notify")
    -- end,
  },

  -- git signs
  {
    "lewis6991/gitsigns.nvim",
    event = "BufReadPre",
    opts = {
      current_line_blame = true,
      signs = {
        add          = { hl = "GitSignsAdd"   , text = "│", numhl="GitSignsAddNr"   , linehl="GitSignsAddLn" },
        change       = { hl = "GitSignsChange", text = "│", numhl="GitSignsChangeNr", linehl="GitSignsChangeLn" },
        delete       = { hl = "GitSignsDelete", text = "│", numhl="GitSignsDeleteNr", linehl="GitSignsDeleteLn" },
        topdelete    = { hl = "GitSignsDelete", text = "│", numhl="GitSignsDeleteNr", linehl="GitSignsDeleteLn" },
        changedelete = { hl = "GitSignsChange", text = "│", numhl="GitSignsChangeNr", linehl="GitSignsChangeLn" },
      },
    },
  },

  -- better diagnostics list and others
  {
    "folke/trouble.nvim",
    cmd = { "TroubleToggle", "Trouble" },
    opts = {
      use_diagnostic_signs = true,
    },
    keys = {
      { "<leader>xx", "<cmd>TroubleToggle document_diagnostics<cr>", desc = "Document Diagnostics (Trouble)" },
      { "<leader>xX", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Workspace Diagnostics (Trouble)" },
    },
  },

  -- todo comments
  {
    "folke/todo-comments.nvim",
    cmd = { "TodoTrouble", "TodoTelescope" },
    event = "BufReadPost",
    config = true,
    -- stylua: ignore
    keys = {
      { "]t", function() require("todo-comments").jump_next() end, desc = "Next todo comment" },
      { "[t", function() require("todo-comments").jump_prev() end, desc = "Previous todo comment" },
      { "<leader>xt", "<cmd>TodoTrouble<cr>", desc = "Todo Trouble" },
      { "<leader>xtt", "<cmd>TodoTrouble keywords=TODO,FIX,FIXME<cr>", desc = "Todo Trouble" },
      { "<leader>xT", "<cmd>TodoTelescope<cr>", desc = "Todo Telescope" },
    },
  },

  -- comments
  {
    "numToStr/Comment.nvim",
    event = "BufReadPost",
    opts = {},
  },
}
