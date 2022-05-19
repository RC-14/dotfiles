local defaultOptions = { -- Only colorize hex codes (#0f...)
	names    = false; -- "Name" codes like Blue
	RGB      = true; -- #RGB hex codes
	RRGGBB   = true; -- #RRGGBB hex codes
	RRGGBBAA = true; -- #RRGGBBAA hex codes
	rgb_fn   = false; -- CSS rgb() and rgba() functions
	hsl_fn   = false; -- CSS hsl() and hsla() functions
	css      = false; -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
	css_fn   = false; -- Enable all CSS *functions*: rgb_fn, hsl_fn
	mode     = 'background'; -- Set the display mode. Can be 'background' or 'foreground'
}

require("colorizer").setup({
	'*'; -- Use defaultOptions for all filetypes (except those listed)
	css = {
		names    = false;
		RGB      = true;
		RRGGBB   = true;
		RRGGBBAA = true;
		rgb_fn   = true;
		hsl_fn   = true;
		css      = true;
		css_fn   = true;
		mode     = 'background';
	},
}, defaultOptions)
