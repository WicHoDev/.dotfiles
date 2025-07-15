local keymap = vim.api.nvim_set_keymap
local opts = {remap = false, silent = true}
keymap('i', '1', '!', opts)
keymap('i', '!', '1', opts)
keymap('i', '2', '@', opts)
keymap('i', '@', '2', opts)
keymap('i', '3', '#', opts)
keymap('i', '#', '3', opts)
keymap('i', '4', '$', opts)
keymap('i', '$', '4', opts)
keymap('i', '5', '%', opts)
keymap('i', '%', '5', opts)
keymap('i', '6', '^', opts)
keymap('i', '^', '6', opts)
keymap('i', '7', '&', opts)
keymap('i', '&', '7', opts)
keymap('i', '8', '*', opts)
keymap('i', '*', '8', opts)
keymap('i', '9', '(', opts)
keymap('i', '(', '9', opts)
keymap('i', '0', ')', opts)
keymap('i', ')', '0', opts)


