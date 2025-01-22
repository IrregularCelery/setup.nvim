-- ----------------------------- Comment Divider ---------------------------- --

local devider_max_length = 80

local function create_divider(text)
	local width = vim.o.textwidth > 0 and math.min(vim.o.textwidth, devider_max_length) or 80

	if width % 2 ~= 0 then
		width = width - 1
	end

	local commentstring = vim.bo.commentstring or "//%s//" -- Default
	local comment_start, comment_end = commentstring:match("^(.-)%%s(.-)$")

	if not comment_start then -- Handle cases where %s is not present or regex fails
		comment_start = "//"
		comment_end = ""
	end

	local divider_length = width - #comment_start or 0 - #comment_end or 0

	if #comment_end < 1 then
		comment_end = string.reverse(comment_start)
	end

	-- Trim the spaces because we manually add them
	comment_start = comment_start:match("^%s*(.-)%s*$")
	comment_end = comment_end:match("^%s*(.-)%s*$")

	local padding = math.floor((divider_length - #text) / 2)
	local divider = comment_start
		.. " "
		.. string.rep("-", padding - 3) -- Accounting for the spaces
		.. " "
		.. text
		.. " "
		.. string.rep("-", divider_length - padding - #text - 3) -- Accounting for the spaces
		.. " "
		.. comment_end

	return divider
end

vim.api.nvim_create_user_command("CreateDivider", function(opts)
	local text = opts.args

	if text == "" then
		text = vim.fn.input("Divider Text: ")
	end

	local divider = create_divider(text)

	vim.api.nvim_put({ divider }, "l", true, true)
end, { nargs = "?", desc = "Create a comment divider" })

vim.keymap.set("n", "<leader>d", ":CreateDivider <CR>", { desc = "Insert a comment divider" })
