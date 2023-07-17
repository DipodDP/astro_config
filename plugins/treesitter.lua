return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    -- Automatically install missing parsers when entering buffer
    auto_install = true,
    -- ensure_installed = { "lua" },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = '<c-space>',
        node_incremental = '<c-space>',
        scope_incremental = '<c-s>',
        node_decremental = '<M-space>',
      },
    },
  },

  dependencies = {
    {
      "mrjones2014/nvim-ts-rainbow",
      config = function()
        require("nvim-treesitter.configs").setup {
          rainbow = {
            enable = true,
          },
        }
      end,
    },
    {
      "nvim-treesitter/playground",
      cmd = "TSPlaygroundToggle",
    },
  },
}
