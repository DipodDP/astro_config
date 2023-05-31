return function(client, bufnr)
  if client.server_capabilities.inlayHintProvider then
    local inlayhints_avail, inlayhints = pcall(require, "lsp-inlayhints")
    if inlayhints_avail then
      inlayhints.on_attach(client, bufnr)
      vim.keymap.set("n", "<leader>uH", function() inlayhints.toggle() end, { desc = "Toggle inlay hints" })
    end
  end
  vim.api.nvim_create_autocmd("CursorHold", {
    buffer = bufnr,
    callback = function()
      local opts = {
        focusable = false,
        close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
        border = 'rounded',
        source = 'always',
        prefix = ' ',
        scope = 'cursor',
      }
      vim.diagnostic.open_float(nil, opts)
    end
  })
end
