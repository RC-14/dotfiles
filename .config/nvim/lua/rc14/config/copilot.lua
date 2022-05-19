-- Remove default mappings
vim.keymap.set("i", "<M-[>", "") -- Previous
vim.keymap.set("i", "<M-]>", "") -- Next
vim.keymap.set("i", "<C-]>", "") -- Dismiss

-- would be nice to have a keymap to show a suggestion
vim.keymap.set("i", "<M-8>", vim.fn['copilot#Previous'])
vim.keymap.set("i", "<M-9>", vim.fn['copilot#Next'])
vim.keymap.set("i", "<M-0>", vim.fn['copilot#Dismiss'])

-- Enable GitHub Copilot for all filetypes
vim.g.copilot_filetypes = { ['*'] = true }