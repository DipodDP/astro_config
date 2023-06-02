return {
  "jose-elias-alvarez/null-ls.nvim",
-- config variable is the default configuration table for the setup function call
-- Check supported formatters and linters
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
  opts = function(_, opts)
    local null_ls = require "null-ls"
    opts.sources = {
     -- Set a formatter
      null_ls.builtins.formatting.stylua,
      null_ls.builtins.formatting.prettier,
      null_ls.builtins.formatting.black,
      null_ls.builtins.formatting.isort,
      -- null_ls.builtins.formatting.clang_format,
      -- null_ls.builtins.formatting.rustfmt,
      null_ls.builtins.formatting.shfmt.with {
        args = { "-i", "2" },
      },
      -- null_ls.builtins.diagnostics.luacheck,
      null_ls.builtins.diagnostics.flake8,
      -- null_ls.builtins.diagnostics.pylint,
      -- null_ls.builtins.diagnostics.mypy,
    }
    return opts -- return final config table
  end,
}
