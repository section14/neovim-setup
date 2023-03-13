local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require'lspconfig'.html.setup {
  capabilities = capabilities,
  init_options = {
    configurationSection = { "html", "css", "javascript" },
    embeddedLanguages = {
      css = false,
      javascript = false
    },
    provideFormatter = true
  }
}

require'lspconfig'.cssls.setup {
  capabilities = capabilities,
}
