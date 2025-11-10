-- ~/.config/nvim/lua/plugins/notify.lua

return {
  'rcarriga/nvim-notify',
  config = function()
    require('notify').setup({
      -- Duração padrão das notificações (em milissegundos)
      timeout = 3000, 
      
      -- Nível de log que deve ser exibido como notificação
      stages = 'fade', 
      
      -- Largura máxima do pop-up
      max_width = 80, 
      
      -- Altura máxima do pop-up (número de linhas)
      max_height = 10,
      
      -- Posição do pop-up
      -- Opções comuns: "top", "top_right", "bottom_right" (padrão)
      placement = 'bottom_right', 
      
      -- Desabilita a notificação de 'No information available' para o LSP.
      -- Se estiver usando LSP, pode ser útil.
      render = 'default',
    })
    vim.notify = require('notify')
  end,
}
