-- Plugins
-- https://dev.to/vonheikemen/neovim-using-vim-plug-in-lua-3oom
local Plug = vim.fn['plug#']
vim.fn['plug#begin']()

--[[
	Dependencies
]] --
Plug 'nvim-lua/plenary.nvim' -- Telescope
Plug 'kyazdani42/nvim-web-devicons' -- Telescope

--[[
	NVIM Plugins
]] --
Plug('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate' }) -- Treesitter

Plug 'nvim-telescope/telescope.nvim' -- Telescope

Plug 'max397574/better-escape.nvim' -- Use for escape mappings to make them better

Plug 'tpope/vim-fugitive' -- Terminal git commands but in vim - e.g. git commit -> :Git commit / :G commit
Plug 'lewis6991/gitsigns.nvim' -- Git integration

Plug 'norcalli/nvim-colorizer.lua' -- Colorize color codes
Plug 'lukas-reineke/indent-blankline.nvim' -- Indentation guide

Plug 'andymass/vim-matchup' -- Jump to matching parens, brackets, braces, etc.
Plug 'windwp/nvim-autopairs' -- Auto close parens, brackets, braces, etc.

Plug 'tpope/vim-commentary' -- Comment out lines

Plug 'neovim/nvim-lspconfig' -- Collection of configurations for the built-in LSP client

Plug 'hrsh7th/nvim-cmp' -- Completion

Plug 'L3MON4D3/LuaSnip' -- Snippets

Plug 'onsails/lspkind.nvim' -- helper to show the kind of a symbol

Plug 'github/copilot.vim' -- Crazy, context based (even comments), AI generated completion

Plug 'gruvbox-community/gruvbox' -- Theme

--[[
	Telescope Plugins
]]--
Plug('nvim-telescope/telescope-fzf-native.nvim', { ['do'] = 'make' }) -- fzf Fuzzy Search (native)

--[[
	Treesitter Plugins
]]--
Plug 'windwp/nvim-ts-autotag' -- Automatically close html tags

--[[
	CMP sources
]]--
Plug 'saadparwaiz1/cmp_luasnip' -- LuaSnip as a CMP source
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path' -- Paths in the file system
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/cmp-nvim-lua' -- NeoVIM's lua api


vim.fn['plug#end']()

--[[
	Configurations
]] --
local postConfig = {
	require('rc14.config.nvim'),

	require('rc14.config.treesitter'),

	require('rc14.config.telescope'),

	require('rc14.config.gitsigns'),

	require('rc14.config.colorizer'),
	require('rc14.config.indent-blankline'),

	require('rc14.config.autopairs'),

	require('rc14.config.better-escape'),

	require('rc14.config.lspconfig'),

	require('rc14.config.cmp'),

	require('rc14.config.luasnip'),

	require('rc14.config.copilot'),

	require('rc14.config.gruvbox'),
}

-- Call postConfig functions
for _, func in ipairs(postConfig) do
	if type(func) == 'function' then
		func()
	end
end
