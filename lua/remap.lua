vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set("n", "<ESC>", "<cmd>nohlsearch<CR>")

vim.keymap.set({"n", "v", "i"}, "<left>", '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set({"n", "v", "i"}, "<right>", '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set({"n", "v", "i"}, "<up>", '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set({"n", "v", "i"}, "<down>", '<cmd>echo "Use j to move!!"<CR>')

-- vim tmux navigator
vim.keymap.set("n", "<C-h>", ":wincmd h<CR>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", ":wincmd l<CR>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", ":wincmd j<CR>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", ":wincmd k<CR>", { desc = "Move focus to the upper window" })

