return {
  'mistweaverco/kulala.nvim',
  ft = { "http", "rest" },
 
  keys = {
    { '<leader>Rs', '<cmd>lua require(\'kulala\').run()<cr>', desc = 'Send the request' },
    { '<leader>Rb', '<cmd>lua require(\'kulala\').scratchpad()<cr>', desc = 'Open scratchpad' },
    { '<leader>Rc', '<cmd>lua require(\'kulala\').copy()<cr>', desc = 'Copy as cURL', ft = 'http' },
    { '<leader>Rt', '<cmd>lua require(\'kulala\').toggle_view()<cr>', desc = 'Toggle headers/body' },
  },

  opts = {
    global_keymaps = true,
  },

  config = function(_, opts)
    require('kulala').setup(opts)
  end,
}


