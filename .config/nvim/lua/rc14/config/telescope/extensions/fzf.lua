return {
	name = "fzf",
	config = {
		fuzzy = true,					-- false will only do exact matching				| default: true
		override_generic_sorter = true,	-- override the generic sorter						| default: true
		override_file_sorter = true,	-- override the file sorter							| default: true
		case_mode = "smart_case",		-- "smart_case" or "ignore_case" or "respect_case"	| default: "smart_case"
	}
}