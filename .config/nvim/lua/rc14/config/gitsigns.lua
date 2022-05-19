local gitsigns = require('gitsigns')
local colorizer = { pcall(require, 'colorizer') }

-- Set colorizer to the colorizer module if it's available or nil if not.
if colorizer[1] then
	colorizer = colorizer[2]
else
	colorizer = nil
end

gitsigns.setup({
	numhl = true,
	word_diff = false,
	current_line_blame = false,
	diff_opts = {
		internal = true,
	}
})

vim.api.nvim_set_hl(0, "GitSignsAddInLine", { default = true, link = "GitSignsAddLn" })
vim.api.nvim_set_hl(0, "GitSignsDeleteInLine", { default = true, link = "GitSignsDeleteLn" })
vim.api.nvim_set_hl(0, "GitSignsChangeInLine", { default = true, link = "GitSignsChangeLn" })

local blameEnabled = false

local function toggleBlame(silent)
	blameEnabled = not blameEnabled

	gitsigns.toggle_word_diff(blameEnabled)
	gitsigns.toggle_current_line_blame(blameEnabled)

	-- If colorizer is present turn it on/off to make sure it doesn't interfere
	if colorizer then
		if blameEnabled and colorizer.is_buffer_attached(0) then
			colorizer.detach_from_buffer(0)
		elseif not blameEnabled and not colorizer.is_buffer_attached(0) then
			colorizer.attach_to_buffer(0)
		end
	end

	if silent then return end
	if blameEnabled then
		print("Blame enabled")
	else
		print("Blame disabled")
	end
end

vim.keymap.set("n", "<Leader>b", toggleBlame)
