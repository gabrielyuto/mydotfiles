-- ================================ HELPERS ===================================
-- n = normal mode
-- i = insert mode
-- v = visual mode
-- x = visual block mode
-- t = terminal mode
-- c = command mode

-- ================================ SETTINGS ===================================
local function map(mode, lhs, rhs, opts)
  local options = { noremap= true, silent = true }

  if opts then
    options = vim.tbl_extend('force', options, opts)
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
  else
    vim.keymap.set(mode, lhs, rhs)
  end
end

-- ============================ MAPPINGS PLUGINS ===============================
-- GENERAL
map('n','<Esc>','<cmd>:nohlsearch<cr>',{ desc = 'exit find term' })
map('t','<Esc>','<C-\\><C-n>',{ desc = 'Change from Terminal to Normal mode' })
map('v','<C-c>',':w !pbcopy<CR><Esc>',{ desc = 'Copy to transfer area'})
map('x','<C-i>','I',{ noremap = true, silent = true })

-- TELESCOPE
map('n','<leader>ff','<cmd>Telescope find_files<cr>',{ desc = 'Find files' })
map('n','<leader>fg','<cmd>Telescope live_grep<cr>',{ desc = 'Live grep' })
map('n','<leader>fb','<cmd>Telescope buffers<cr>',{ desc = 'List buffers' })
map('n','<leader>fh','<cmd>Telescope help_tags<cr>',{ desc = 'Find help' })

-- TOGGLETERM
map('n','<C-/>','<cmd>:ToggleTerm direction=float<cr>',{ desc = 'Floating Terminal'})
map('n','<leader>tv','<cmd>:ToggleTerm size=70 direction=vertical<cr>',{ desc = 'Vertical Terminal' })
map('n','<leader>th','<cmd>:ToggleTerm size=20 direction=horizontal<cr>',{desc = 'Horizontal Terminal'})
map('n','<leader>tt','<cmd>:ToggleTerm direction=tab<cr>',{ desc = 'Tab Terminal'})
map('t','<C-/>', '<C-\\><C-n>:ToggleTerm<cr>',{ desc = 'Hide Terminal' })

-- NVIMTREE
map('n','<leader>e','<cmd>:NvimTreeToggle<CR>',{ noremap = true, silent = true })
map('n','<leader>r','<cmd>:NvimTreeRefresh<cr>',{ noremap = true, silent = true })
map('n','<leader>n','<cmd>:NvimTreeFindFile<cr>',{ noremap = true, silent = true })

-- LAZYGIT
map('n','<leader>lg','<cmd>LazyGit<cr>',{ desc = 'LazyGit' })
map('n','<leader>lg',':LazyGit<CR>',{ noremap = true, silent = true })
map('n','<leader>lc',':LazyGitConfig<CR>',{ noremap = true, silent = true })
map('n','<leader>lf',':LazyGitFilter<CR>',{ noremap = true, silent = true })
map('n','<leader>lcf',':LazyGitFilterCurrentFile<CR>',{ noremap = true, silent = true })

-- DAP
vim.fn.sign_define('DapBreakpoint',{ text='🛑', texthl='', linehl='', numhl='' })
map('n','<F5>',function() require('dap').continue() end)
map('n','<F10>',function() require('dap').step_over() end)
map('n','<F11>',function() require('dap').step_into() end)
map('n','<F12>',function() require('dap').step_out() end)
map('n','<leader>b',function() require('dap').toggle_breakpoint() end)
map('n','<leader>B',function() require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: ')) end)
map('n','<leader>dr',function() require('dap').repl.open() end)
map('n','<leader>dl',function() require('dap').run_last() end)
map('n','<leader>da','<cmd>lua require("dapui").eval()<cr>',{ desc = 'DAP-UI' })

-- VIM-RSPEC
map('n','<leader>rs','<cmd>:call RunCurrentSpecFile()<cr>',{ desc = 'Find files' })
map('n','<leader>rn','<cmd>:call RunNearestSpec()<cr>',{ desc = 'Live grep' }) 
map('n','<leader>rl','<cmd>:call RunLastSpec()<cr>',{ desc = 'List buffers' })
map('n','<leader>ra','<cmd>:call RunAllSpecs()<cr>',{ desc = 'Find help' })

-- BUFFERLIST
map('n','<leader>bb','<cmd>BufferListOpen<cr>',{ desc = 'Buffer list' })
