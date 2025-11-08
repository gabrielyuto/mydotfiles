return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "b0o/SchemaStore.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = { "yamlls" },
      })

      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local schemastore = require("schemastore")

      vim.lsp.config("yamlls", {
        cmd = { "yaml-language-server", "--stdio" },
        filetypes = { "yaml", "yml" },
        root_dir = vim.fs.dirname(vim.fs.find({ ".git", "kubernetes", "helm" }, { upward = true })[1]),
        capabilities = capabilities,
        settings = {
          yaml = {
            schemas = {
              ["https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.27.0-standalone/all.json"] = "/*.yaml",
            },
            validate = true,
            hover = true,
            completion = true,
            format = { enabled = true },
          },
        },
      })

      -- Ativa o servidor
      vim.lsp.enable("yamlls")

      -- Diagnósticos
      vim.diagnostic.config({
        virtual_text = true,
        float = { border = "rounded" },
      })

      -- Atalhos
      local map = vim.keymap.set
      map("n", "K", vim.lsp.buf.hover, { desc = "Hover info" })
      map("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
      map("n", "gr", vim.lsp.buf.references, { desc = "Find references" })
      map("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename symbol" })
    end,
  },
}

