vim.api.nvim_create_autocmd(
  { "BufRead", "BufNewFile" },
  { pattern = { "*.txt", "*.md", "*.tex" }, command = "setlocal spell" }
)

-- keep unnamedplus register synced with last yank register ("0")
-- (except cutting in visual mode)
-- to delete in special buffer instead of cut remap d, D in visual mode
vim.cmd([[
  augroup SyncUnnamedRegister
    autocmd!
      " for only deleting not in visual mode:
      " autocmd TextYankPost * if !v:event.visual || v:event.operator == 'c' | let @+ = @0 |  endif
      " for only replacing with pasting:
      " autocmd TextYankPost * if v:event.visual || v:event.operator == 'd' | let @+ = @0 |  endif
      " for both ever:
      autocmd TextYankPost * if v:event.operator == 'c' || v:event.operator == 'd' | let @+ = @0 |  endif
  augroup END
]])
