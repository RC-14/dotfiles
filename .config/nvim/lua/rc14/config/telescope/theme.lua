local telescopeConfig = require('telescope.config')
local defaults = telescopeConfig.values
local pickers = telescopeConfig.pickers

-- Diplay file paths like this: file.ext (path/to/file/)
local path_display_func = function(opts, path)
	local tail = require("telescope.utils").path_tail(path)
	return string.format("%s (%s)", tail, path)
end

-- Layout configuration
defaults.layout_config = {
	bottom_pane = {
		height = 25,
		preview_cutoff = 120,
		prompt_position = "top"
	},
	center = {
		height = 0.4,
		preview_cutoff = 40,
		prompt_position = "top",
		width = 0.5
	},
	cursor = {
		height = 0.9,
		preview_cutoff = 40,
		width = 0.8
	},
	horizontal = {
		height = 0.9,
		preview_cutoff = 120,
		prompt_position = "top",
		width = 0.8
	},
	vertical = {
		height = 0.9,
		preview_cutoff = 40,
		prompt_position = "bottom",
		width = 0.8
	}
}

defaults.winblend = 0
defaults.borderchars = { " ", " ", " ", " ", " ", " ", " ", " " }
defaults.results_title = false
defaults.preview_title = false
defaults.prompt_title = false
defaults.prompt_prefix = '> '
defaults.selection_caret = ' > '
defaults.entry_prefix = '   '
defaults.sorting_strategy = 'ascending'
defaults.path_display = path_display_func

-- Disable titles for all pickers
for name, _ in pairs(require('telescope.builtin')) do
	if not pickers[name] then
		pickers[name] = {}
	end
	pickers[name].results_title = false
	pickers[name].preview_title = false
	pickers[name].prompt_title = false
end

-- Change colors for pickers
local colors = {
	TelescopeNormal = {
		link = "GruvboxFg1",
	},
	TelescopeBorder = {
		link = "TelescopeNormal",
	},

	TelescopeMatching = {
		link = "GruvboxBlue",
	},

	TelescopeSelection = {
		link = "GruvboxOrangeBold",
	},
	TelescopeSlectionCaret = {
		link = "GruvboxRed",
	},
	TelescopeMultiSelection = {
		link = "GruvboxGray",
	},

	TelescopePrompt = {
		fg = "#ebdbb2",
		bg = '#252931'
	},
	TelescopePromptNormal = {
		link = "TelescopePrompt",
	},
	TelescopePromptBorder = {
		link = "TelescopePrompt",
	},
	TelescopePromptPrefix = {
		link = "GruvboxRed",
	},

	TelescopeResults = {
		bg = "#1b1f27",
	},
	TelescopeResultsNormal = {
		link = "TelescopeResults",
	},
	TelescopeResultsBorder = {
		link = "TelescopeResults",
	},

	TelescopePreview = {
		bg = "#1b1f27",
	},
	TelescopePreviewNormal = {
		link = "TelescopePreview",
	},
	TelescopePreviewBorder = {
		link = "TelescopePreview",
	},
}

for name, val in pairs(colors) do
	vim.api.nvim_set_hl(0, name, val)
end
