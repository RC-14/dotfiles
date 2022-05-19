local telescope_builtin = require('telescope.builtin')

vim.keymap.set('n', '<Leader>f', telescope_builtin.find_files)
vim.keymap.set('n', '<Leader>g', telescope_builtin.live_grep)