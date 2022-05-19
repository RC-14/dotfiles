local extensionList = {
	'coc-sh',				-- Bash / Shell
	'coc-sumneko-lua',		-- Lua & Neovim Lua Completion
	'coc-vimlsp',			-- VIM Script
	'coc-clangd',			-- C / C++
	'coc-tsserver',			-- Javascript / Typescript
	'coc-json',				-- JSON
	'coc-html',				-- HTML
	'coc-css',				-- CSS
	'coc-html-css-support',	-- HTML & CSS id and class attributes completion
	'coc-markdownlint',		-- Markdownlint
}

local function installAll()
	vim.fn['coc#util#install_extension'](extensionList)
end