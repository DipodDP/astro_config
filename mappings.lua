-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map

    -- Open file in browser
    ["<leader>r"] = { ":exe ':silent !firefox %'<cr>", desc = "Run Browser" },
    -- View treesitter highlight groups
    ["<leader>k"] = { ":TSHighlightCapturesUnderCursor<cr>", desc = "View Highlight Group" },
    -- Easy splits
    ["\\"] = { "<cmd>split<cr>", desc = "Horizontal split" },
    ["|"] = { "<cmd>vsplit<cr>", desc = "Vertical split" },
    -- Search highlight groups
    ["<leader>sg"] = { "<cmd>Telescope highlights<cr>", desc = "Highlight groups" },
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command

    ["<leader>z"] = { "<cmd>ZenMode<cr>", desc = "Zen Mode" },
    ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(function(bufnr)
          require("astronvim.utils.buffer").close(
            bufnr)
        end)
      end,
      desc = "Pick to close",
    },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
    -- blackhole deletion
    ["<leader>D"] = { '"_d', desc = "Delete in blackhole register", noremap = true },
-- >>>>>>> 3492639 (Initial commit)
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
  v = {
    -- deleting to register "d" in visual mode (useful with SyncUnnamedplusRegister autocommand)
    ["d"] = { '"1d', desc = "Delete in register d (visual mode)", noremap = true },
    ["D"] = { '"_D', desc = "Delete line in register d (visual mode)", noremap = true },
    ["<leader>D"] = { '"_d', desc = "Delete in blackhole register", noremap = true },
    ["Y"] = {
      function()
        require('osc52').copy_visual()
      end,
      desc = "OSC 52 yank",
    },
  },
}
