return {
  -- Configure AstroNvim updates
  updater = {
    remote = "origin",     -- remote to use
    channel = "stable",    -- "stable" or "nightly"
    version = "latest",    -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
    branch = "nightly",    -- branch name (NIGHTLY ONLY)
    commit = nil,          -- commit hash (NIGHTLY ONLY)
    pin_plugins = nil,     -- nil, true, false (nil will pin plugins on stable only)
    skip_prompts = false,  -- skip prompts about breaking changes
    show_changelog = true, -- show the changelog after performing an update
    auto_quit = false,     -- automatically quit the current session after a successful update
    remotes = {            -- easily add new remotes to track
      --   ["remote_name"] = "https://remote_url.come/repo.git", -- full remote url
      --   ["remote2"] = "github_user/repo", -- GitHub user/repo shortcut,
      --   ["remote3"] = "github_user", -- GitHub user assume AstroNvim fork
    },
  },

  -- Set colorscheme to use
  colorscheme = "astrodark",

  -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
  diagnostics = {
    virtual_text = true,
    underline = true,
    virtual_text = {
      prefix = '●'
    },
    update_in_insert = true,
    float = {
      source = "always", -- or "if_many"
    },
  },

  lsp = {
    -- customize lsp formatting options
    formatting = {
      format = function(entry, vim_item)
        vim_item.abbr = string.sub(vim_item.abbr, 1, 15)
        return vim_item
      end,
      -- control auto formatting on save
      format_on_save = {
        enabled = false,    -- enable or disable format on save globally
        allow_filetypes = { -- enable format on save for specified filetypes only
          -- "go",
        },
        ignore_filetypes = { -- disable format on save for specified filetypes
          -- "python", "lua"
        },
      },
      disabled = { -- disable formatting capabilities for the listed language servers
        -- "sumneko_lua",
      },
      timeout_ms = 1000, -- default format timeout
      -- filter = function(client) -- fully override the default formatting function
      --   return true
      -- end
    },
    -- enable servers that you already have installed without mason
    servers = {
      -- "pyright",
      -- "pylsp"
    },
    config = {
      -- pyright = {}
    }
  },

  -- Configure require("lazy").setup() options
  lazy = {
    defaults = { lazy = true },
    performance = {
      rtp = {
        -- customize default disabled vim plugins
        disabled_plugins = {
          "tohtml", "gzip", "matchit", "zipPlugin", "netrwPlugin", "tarPlugin",
          "matchparen"
        },
      },
    },
  },

  -- This function is run last and is a good place to configuring
  -- augroups/autocommands and custom filetypes also this just pure lua so
  -- anything that doesn't fit in the normal config locations above can go here
  polish = function()
    -- Set up custom filetypes
    -- vim.filetype.add {
    --   extension = {
    --     foo = "fooscript",
    --   },
    --   filename = {
    --     ["Foofile"] = "fooscript",
    --   },
    --   pattern = {
    --     ["~/%.config/foo/.*"] = "fooscript",
    --   },
    -- }
  end,

  plugins = {
    {
      -- override nvim-autopairs plugin
      "windwp/nvim-autopairs",
      config = function(plugin, opts)
        -- run default AstroNvim config
        require "plugins.configs.nvim-autopairs" (plugin, opts)
        -- require Rule function
        local Rule = require "nvim-autopairs.rule"
        local npairs = require "nvim-autopairs"
        npairs.add_rules {
          {
            -- specify a list of rules to add
            Rule(" ", " "):with_pair(function(options)
              local pair = options.line:sub(options.col - 1, options.col)
              return vim.tbl_contains({ "()", "[]", "{}" }, pair)
            end),
            Rule("( ", " )")
                :with_pair(function() return false end)
                :with_move(function(options) return options.prev_char:match ".%)" ~= nil end)
                :use_key ")",
            Rule("{ ", " }")
                :with_pair(function() return false end)
                :with_move(function(options) return options.prev_char:match ".%}" ~= nil end)
                :use_key "}",
            Rule("[ ", " ]")
                :with_pair(function() return false end)
                :with_move(function(options) return options.prev_char:match ".%]" ~= nil end)
                :use_key "]",
          },
        }
      end,
    },
  },
}
