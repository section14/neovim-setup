local lsp = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

lsp.html.setup {
  capabilities = capabilities,
  init_options = {
    configurationSection = { "html", "templ", "css", "javascript" },
    embeddedLanguages = {
      css = false,
      javascript = false
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
