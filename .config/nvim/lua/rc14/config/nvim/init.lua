-- Set <Leader> to " " (space)
vim.g.mapleader = " "

-- Key maps
require('rc14.config.nvim.keymaps')

-- Termcolors
vim.o.termguicolors = 1

-- Scrolling
vim.o.scrolloff = 8
vim.o.sidescrolloff = 8

-- Line Numbers
vim.o.number = true
vim.o.relativenumber = true

-- Indentation
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.expandtab = false
vim.o.tabstop = 4
vim.o.softtabstop = vim.bo.tabstop
vim.o.shiftwidth = vim.bo.tabstop

-- Line Wrap
vim.o.wrap = true
vim.o.linebreak = true
vim.o.breakindent = true
vim.o.breakat = vim.o.breakat -- Use default

-- Sign Column
vim.o.signcolumn = 'yes'

-- Color Column
vim.o.colorcolumn = '80'

-- Search
vim.o.hlsearch = false
vim.o.incsearch = true

-- Status Line
vim.o.laststatus = 2

-- Error Bells
vim.o.errorbells = false
