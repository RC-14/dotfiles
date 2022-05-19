-- VSCode like theme for the completion popup.

-- gray
vim.api.nvim_set_hl(0,'CmpItemAbbrDeprecated', {
	background = 'NONE',
	foreground = '#808080',
	strikethrough = true,
})

-- blue
vim.api.nvim_set_hl(0,'CmpItemAbbrMatch', {
	background = 'NONE',
	foreground = '#569CD6',
})
vim.api.nvim_set_hl(0,'CmpItemAbbrMatchFuzzy', {
	background = 'NONE',
	foreground = '#569CD6',
})

-- light blue
vim.api.nvim_set_hl(0,'CmpItemKindVariable', {
	background = 'NONE',
	foreground = '#9CDCFE',
})
vim.api.nvim_set_hl(0,'CmpItemKindInterface', {
	background = 'NONE',
	foreground = '#9CDCFE',
})
vim.api.nvim_set_hl(0,'CmpItemKindText', {
	background = 'NONE',
	foreground = '#9CDCFE',
})

-- pink
vim.api.nvim_set_hl(0,'CmpItemKindFunction', {
	background = 'NONE',
	foreground = '#C586C0',
})
vim.api.nvim_set_hl(0,'CmpItemKindMethod', {
	background = 'NONE',
	foreground = '#C586C0',
})

-- front
vim.api.nvim_set_hl(0,'CmpItemKindKeyword', {
	background = 'NONE',
	foreground = '#D4D4D4',
})
vim.api.nvim_set_hl(0,'CmpItemKindProperty', {
	background = 'NONE',
	foreground = '#D4D4D4',
})
vim.api.nvim_set_hl(0,'CmpItemKindUnit', {
	background = 'NONE',
	foreground = '#D4D4D4',
})
