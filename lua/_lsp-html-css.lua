local lsp = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

lsp.html.setup {
  capabilities = capabilities,
  init_options = {
    configurationSection = { "html", "css", "javascript" },
    embeddedLanguages = {
      css = true,
      javascript = true
    },
    provideFormatter = true
  }
}

lsp.cssls.setup {
  capabilities = capabilities,
  settings = {
    css = { validate = true,
      lint = {
        unknownAtRules = "ignore"
      }
    }
  }
}
