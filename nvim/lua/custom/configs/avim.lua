-- remove kep mappings set by a.vim
--
-- doing this because `nvim_del_keymap` fails with "MAPPING NOT FOUND"
vim.keymap.set('i', '<leader>ihn', '', {silent = true })
vim.keymap.set('i', '<leader>is', '', {silent = true })
vim.keymap.set('i', '<leader>ih', '', {silent = true })

vim.api.nvim_del_keymap("i", "<Space>ihn")
vim.api.nvim_del_keymap("i", "<Space>is")
vim.api.nvim_del_keymap("i", "<Space>ih")
