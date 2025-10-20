-- Shorthands
local n = "n"
local i = "i"
local v = "v"
local x = "x"
local nv = { n, v }
local niv = { n, i, v }
local opts = {
	n = { noremap = true },
	s = { silent = true },
	ns = { noremap = true, silent = true },
}

-- Remap leader to `<space>` key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Disable spacebar
vim.keymap.set(nv, "<space>", "<nop>", opts.s)

-- Prevents from yanking the selected text
vim.keymap.set(x, "p", [["_dP]], opts.n)
vim.keymap.set(nv, "x", [["_x]], opts.n)
vim.keymap.set(nv, "c", [["_c]], opts.n)
vim.keymap.set(n, "ciw", [["_ciw]], opts.n)
vim.keymap.set(n, 'ci"', [["_ci"]], opts.n)
vim.keymap.set(n, "ci'", [["_ci']], opts.n)
vim.keymap.set(n, "ci(", [["_ci(]], opts.n)
vim.keymap.set(n, "ci)", [["_ci)]], opts.n)
vim.keymap.set(n, "ci[", '"_ci[', opts.n)
vim.keymap.set(n, "ci}", '"_ci]', opts.n)
vim.keymap.set(n, "ci{", [["_ci{]], opts.n)
vim.keymap.set(n, "ci}", [["_ci}]], opts.n)
vim.keymap.set(n, "ci<", [["_ci<]], opts.n)
vim.keymap.set(n, "ci>", [["_ci>]], opts.n)

-- Move lines vertically in `Visual` mode
vim.keymap.set(v, "J", ":m '>+1<cr>gv=gv")
vim.keymap.set(v, "K", ":m '<-2<cr>gv=gv")

-- Append next line to current line while keeping the cursor's position
vim.keymap.set(n, "J", "mzJ`z")

-- Center the screen after key action
vim.keymap.set(n, "G", "Gzz")
vim.keymap.set(n, "<c-i>", "<c-i>zz")
vim.keymap.set(n, "<c-o>", "<c-o>zz")
vim.keymap.set(n, "<c-d>", "<c-d>zz")
vim.keymap.set(n, "<c-u>", "<c-u>zz")
vim.keymap.set(n, "n", "nzz")
vim.keymap.set(n, "N", "Nzz")

-- Find and replace current word under cursor globally in current buffer (Thanks to `Theprimeagen`)
vim.keymap.set(n, "<leader>s", [[:%s/\<<c-r><c-w>\>/<c-r><c-w>/gI<Left><Left><Left>]])

-- Clear search highlights
vim.keymap.set(n, "<esc>", "<cmd>nohlsearch<cr>")

-- Close window
vim.keymap.set(n, "<leader>W", "<cmd>close<cr>", opts.ns)

-- Split window
vim.keymap.set(n, "<leader>V", "<c-w>v", opts.ns)
vim.keymap.set(n, "<leader>H", "<c-w>s", opts.ns)

-- Move between windows
vim.keymap.set(n, "<leader>h", "<c-w>h", opts.ns)
vim.keymap.set(n, "<leader>j", "<c-w>j", opts.ns)
vim.keymap.set(n, "<leader>k", "<c-w>k", opts.ns)
vim.keymap.set(n, "<leader>l", "<c-w>l", opts.ns)

-- Resize windows
vim.keymap.set(n, "<c-e>", "<c-w>=", opts.ns)
vim.keymap.set(n, "<c-h>", "5<c-w><", opts.ns)
vim.keymap.set(n, "<c-j>", "<c-w>+", opts.ns)
vim.keymap.set(n, "<c-k>", "<c-w>-", opts.ns)
vim.keymap.set(n, "<c-l>", "5<c-w>>", opts.ns)

-- Disable arrow keys
vim.keymap.set(niv, "<left>", "<nop>", opts.ns)
vim.keymap.set(niv, "<down>", "<nop>", opts.ns)
vim.keymap.set(niv, "<up>", "<nop>", opts.ns)
vim.keymap.set(niv, "<right>", "<nop>", opts.ns)
