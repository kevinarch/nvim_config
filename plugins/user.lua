local utils = require "astronvim.utils"

return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },
  { import = "astrocommunity.pack.yaml" },
  {
    "akinsho/flutter-tools.nvim",
    ft = { "dart" },
    init = function() utils.list_insert_unique(astronvim.lsp.skip_setup, "dartls") end,
    opts = {
      lsp = require("astronvim.utils.lsp").config "dartls",
      debugger = {
        enabled = true,
      },
    },
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      {
        "jay-babu/mason-nvim-dap.nvim",
        opts = function(_, opts)
          -- Ensure that opts.ensure_installed exists and is a table.
          if not opts.ensure_installed then opts.ensure_installed = {} end
          utils.list_insert_unique(opts.ensure_installed, "dart")
        end,
      },
    },
    config = function()
      require("flutter-tools").setup {
        decorations = {
          device = true,
        },
        dev_tools = {
          autostart = true,
          auto_open_browser = true,
        },
        widget_guides = {
          enabled = true,
        },
      } -- use defaults
    end,
  },
  { "nvim-telescope/telescope.nvim", opts = function() require("telescope").load_extension "flutter" end },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup {
        -- Configuration here, or leave empty to use defaults
      }
    end,
  },
  {
    "rust-lang/rust.vim",
    ft = "rust",
  },
}
