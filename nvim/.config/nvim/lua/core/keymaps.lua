vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.keymap.set('i', 'jk', '<ESC>')

vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')

vim.keymap.set('n', '<leader>bn', ':bnext<CR>')
vim.keymap.set('n', '<leader>bp', ':bprev<CR>')
vim.keymap.set('n', '<leader>bb', '<C-^>')

vim.keymap.set('n', '<leader>sv', '<C-w>v')
vim.keymap.set('n', '<leader>sh', '<C-w>h')
vim.keymap.set('n', '<leader>se', '<C-w>=')

vim.keymap.set('n', '<leader>to', ':tabnew<CR>')
vim.keymap.set('n', '<leader>tc', ':tabclose<CR>')
vim.keymap.set('n', '<leader>tn', ':tabnext<CR>')
vim.keymap.set('n', '<leader>tp', ':tabprev<CR>')

vim.keymap.set('n', '<leader>sc', ':nohl<CR>')

vim.keymap.set({ 'n', 'v' }, '<leader>d', '\"_d')
vim.keymap.set({ 'n', 'v' }, '<leader>D', '\"_D')

vim.keymap.set('n', '<leader>nn', ':NvimTreeToggle<CR>')
vim.keymap.set('n', '<leader>nr', ':NvimTreeRefresh<CR>')
vim.keymap.set('n', '<leader>nf', ':NvimTreeFindFile<CR>')

vim.keymap.set('n', '<leader>gss', ':Gitsigns toggle_signs<CR>')
vim.keymap.set('n', '<leader>gsn', ':Gitsigns toggle_numhl<CR>')
vim.keymap.set('n', '<leader>gsh', ':Gitsigns toggle_linehl<CR>')

vim.keymap.set('n', '<leader>gdo', ':DiffviewOpen<CR>')
vim.keymap.set('n', '<leader>gdc', ':DiffviewClose<CR>')

vim.keymap.set('n', '<leader>ss', function()
  vim.o.spell = not vim.o.spell
end)
