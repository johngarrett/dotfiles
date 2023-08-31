vim.keymap.set('n', '<leader>fw', ':Rg <CR>', { silent = true })
vim.keymap.set('n', '<leader>ff', ':Files <CR>', { silent = true })
vim.keymap.set('n', '<leader>ff', ':GFiles <CR>', { silent = true })
vim.keymap.set('n', '<leader>fb', ':Buf <CR>', { silent = true })
vim.keymap.set('n', '<leader>fa', ':Marks <CR>', { silent = true })
--vim.keymap.set('n', '<leader>wf', ':Files -q <C-R><C-W><CR>', { silent = true })
vim.keymap.set(
  'n',
  '<leader>wf',
  ':Rg <C-R><C-W><CR>',
  --vim.cmd([[
   -- call fzf#vim#grep({'options': '-q ' . expand('<cword>')})
    --]]),
  { silent = true }
)
--vim.keymap.set('n', '<leader>rw', ':Rg <C-R><C-W><CR>', { silent = true })
    --call fzf#vim#grep({'options': '-q '.shellescape(expand('<cword>'))})
