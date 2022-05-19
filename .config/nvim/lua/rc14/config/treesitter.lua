require 'nvim-treesitter.configs'.setup {
	ensure_installed = "all",
	sync_install = false,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	autotag = {
		enable = true,
	},
}

-- Make sure all parsers are up to date. (commented out because it's probably not needed but would be annoying to look for again)
--require 'nvim-treesitter.install'.commands.TSUpdate['run']()
