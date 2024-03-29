return {
  "gbprod/yanky.nvim",
  enabled = true,
  event = "BufEnter",
  config = function()
    require("yanky").setup {
      preserve_cursor_position = {
      --   enabled = true,
      },
    }
  end,
  -- vim.keymap.set({ "n", "x" }, "y", "<Plug>(YankyYank)"),
  vim.keymap.set({ "n", "x" }, "p", "<Plug>(YankyPutAfter)"),
  vim.keymap.set({ "n", "x" }, "P", "<Plug>(YankyPutBefore)"),
  vim.keymap.set({ "n", "x" }, "gp", "<Plug>(YankyGPutAfter)"),
  vim.keymap.set({ "n", "x" }, "gP", "<Plug>(YankyGPutBefore)"),
  vim.keymap.set("n", "<c-n>", "<Plug>(YankyCycleForward)"),
  vim.keymap.set("n", "<c-p>", "<Plug>(YankyCycleBackward)"),
}
