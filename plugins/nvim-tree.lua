return {
  "nvim-tree/nvim-tree.lua",
  -- enabled = true,
  -- event = "UIEnter",
  lazy = false,
  version = "*",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup {
      sort_by = "case_sensitive",
      view = {
        width = 30,
      },
      renderer = {
        group_empty = true,
      },
      filters = {
        dotfiles = false,
        -- git_clean = false,
        custom = { "^.git$" }
      },
      git = {
        ignore = false  
      }
    }
  end,
}
