return {
  cmd = { "vtsls", "--stdio" },
  filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
  root_dir = vim.fs.root(0, { "package.json", "tsconfig.json", ".git" }),
  settings = {
    vtsls = {
      experimental = {
        maxInlayHintLength = 30, -- Cleans up messy TypeScript types on-screen
      },
    },
    javascript = {
      format = {
        enable = false
      }
    },
    javascriptreact = {
      format = {
        enable = false
      }
    },
    typescript = {
      format = {
        enable = false
      }
    },
    typescriptreact = {
      format = {
        enable = false
      }
    },
  },
}
