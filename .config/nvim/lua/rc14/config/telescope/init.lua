local telescope = require('telescope')

-------------------------------------------------------------------------------
-- Functions
-------------------------------------------------------------------------------

local requireExtension = function(filename)
	return require('rc14.config.telescope.extensions.' .. filename)
end

--------------------------------------------------------------------------------
-- Configurations
--------------------------------------------------------------------------------

local config = {
	defaults = {
		scroll_strategy = 'limit',
		mappings = {
			i = {
				["<esc>"] = "close",
			},
			n = {},
		},
	},
	pickers = {},
	extensions = {
		[requireExtension('fzf').name] = requireExtension('fzf').config,
	},
}

--------------------------------------------------------------------------------
-- Apply configurations
--------------------------------------------------------------------------------

telescope.setup(config)

-- Load all configured extensions
for name, _ in pairs(config.extensions) do
	telescope.load_extension(name)
end

--------------------------------------------------------------------------------
-- Load other configuration files
--------------------------------------------------------------------------------

require('rc14.config.telescope.keymaps')

--------------------------------------------------------------------------------
-- Post configuration
--------------------------------------------------------------------------------
return function ()
	require('rc14.config.telescope.theme')
end
