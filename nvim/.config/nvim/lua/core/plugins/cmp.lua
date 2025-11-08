return {
  "hrsh7th/nvim-cmp", --Gerencia as janelas de sugestão, seleção e inserção de texto
  dependencies = { -- Abaixo sao fontes de autocompletar
    "hrsh7th/cmp-nvim-lsp", -- Sugestões vindas dos servidores LSP
    "hrsh7th/cmp-buffer", -- Palavras que já aparecem no buffer atual
    "hrsh7th/cmp-path", -- Completa caminhos de arquivos e diretórios
    "L3MON4D3/LuaSnip", -- Suporte a snippets (blocos de código prontos, como templates YAML)
  },
  config = function()
    local cmp = require("cmp")
    
    cmp.setup({
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },
    
      mapping = cmp.mapping.preset.insert({
        ["<C-Space>"] = cmp.mapping.complete(),
    
        -- ENTER: confirma o item selecionado
        ["<CR>"] = cmp.mapping.confirm({
          behavior = cmp.ConfirmBehavior.Replace,
          select = true, -- se nada estiver selecionado, escolhe o primeiro
        }),
    
        -- TAB: navega pra frente entre os itens
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif require("luasnip").expand_or_jumpable() then
            require("luasnip").expand_or_jump()
          else
            fallback()
          end
        end, { "i", "s" }),
    
        -- SHIFT+TAB: navega pra trás
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif require("luasnip").jumpable(-1) then
            require("luasnip").jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      }),
    
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "path" },
      }),
    })
  end,
 }

