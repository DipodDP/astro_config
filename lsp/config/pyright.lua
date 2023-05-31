return {
  -- Removing duplication comes from "hint", which pyright does not considered
  -- to be a type of diagnostics but neovim does. 
  -- That's why all the pyright config tweaks does not suppress those 
  -- "not accessed hint".
  -- capabilities = (function()
  --   local capabilities = vim.lsp.protocol.make_client_capabilities()
  --   capabilities.textDocument.publishDiagnostics.tagSupport.valueSet = { 2 }
  --   return capabilities
  -- end)(),
  settings = {
    pyright = {
      autoImportCompletion = true,
      -- disableLanguageServices = true,
      -- disableOrganizeImports = true,
      -- reportMissingModuleSource = "none",
      -- reportMissingImports = "none",
    },
    python = {
      analysis = {
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
        typeCheckingMode = 'basic',
        diagnosticmode = 'openfilesonly',
        -- typeCheckingMode = "off",
        -- diagnosticMode = "workspace",
        diagnosticSeverityOverrides = {
          reportUndefinedVariable = "none",
        --   reportUnusedImport = "warning",
        --   reportUnusedClass = "warning",
        --   reportunusedfunction = "warning",
        --   reportUnusedVariable = "warning",
        }
      },
    },
  },
}
