return {
  -- Instalação do nvim-ufo
  {
    'kevinhwang91/nvim-ufo',
    dependencies = { 'kevinhwang91/promise-async' },
    event = 'BufReadPost', -- Carrega o plugin quando um arquivo é aberto
    config = function()
      local ufo = require('ufo')

      -- 1. Configurações de dobramento do Neovim (Crucial para o UFO)
      -- Definir um foldlevel alto (99) impede que os folds sejam fechados
      -- automaticamente e força o UFO a gerenciar o dobramento.
      vim.opt.foldcolumn = '1'
      vim.opt.foldlevel = 99
      vim.opt.foldlevelstart = 99
      vim.opt.foldenable = true

      -- Definir foldmethod como 'manual' ou 'expr'
      -- Recomendamos 'manual' para permitir que o UFO use providers (como LSP)
      vim.opt.foldmethod = 'manual' 

      -- 2. Configuração dos Providers (para usar LSP ou Indentação)
      ufo.setup({
        provider_selector = function(bufnr, filetype, _)
          -- Tenta usar o LSP (Folding Range) primeiro
          local clients = vim.lsp.get_active_clients({ bufnr = bufnr })
          if next(clients) then
            return { 'lsp', 'indent' } -- Usa LSP, se não, cai para indentação
          else
            return { 'indent' } -- Se não houver LSP, usa apenas indentação
          end
        end,
      })
    end,
  },
}
