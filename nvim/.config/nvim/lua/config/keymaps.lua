local key = vim.keymap
local opts  = { noremap = true, silent = true }
local opts1 = { noremap = true, silent = false }



--Directory / navigation / tree.lua
-- key.set("n", "<leader>j", ":NvimTreeToggle<CR>", opts)    --Toggle tree  show / hide
-- key.set("n", "<leader>k", ":NvimTreeFocus<CR>", opts)   --Focus on tree

-- Disable clipboard sync
vim.o.clipboard = ""

--save an quit all
key.set("n","<leader>wq", ":wqa<CR>", opts, { desc = "Save and Quit File"})  --write, quit all
-- key.set("n","<leader>q", ":q!<CR>", opts, {desc = "Quit NeoVim"})   --write, quit all
-- key.set("n","<leader>w", ":w<CR>",opts1, { desc = "Save File"})   --write, quit all

----------------WINDOW MANAGMENT----------------
-- Panel Navgation
key.set("n", "<C-h>", "<C-w>h", opts, {desc = "Focus Window: Move Left"}) -- Navigate left
key.set("n", "<C-j>", "<C-w>j", opts, {desc = "Focus Window: Move Down"}) -- Navigate Down
key.set("n", "<C-k>", "<C-w>k", opts, {opts,desc = "Focus Window: Move Up"}) -- Navigate Up
key.set("n", "<C-l>", "<C-w>l", opts, {desc = "Focus Window: Nove Right"}) -- Navigate right
--Window Management
key.set("n", "<leader>sv", ":vsplit<CR>", opts, {desc = "Split Window Vertical"}) -- split Vertical
key.set("n", "<leader>sh", ":split<CR>", opts, {desc = "Split Window Horizontal"}) -- split Horizontal
key.set("n", "<leader>sm", ":MaximizerToggle<CR>", opts, {desc = "Toggle Window Minimize/Maximize"}) -- toggle Minimize / maximaze

----------------LINE EDITING----------------
-- Move line up
key.set("n", "<A-k>", ':m .-2<CR>==', opts, {desc = "Move Line Up"})
key.set("v", "<A-k>", ":m '<-2<CR>gv=gv", opts,{desc = "Move Code Block Up"})
 -- Move line down
key.set("n", "<A-j>", ':m .+1<CR>==', opts, {desc = "Move Line Down"})
key.set("v", "<A-j>", ":m '>+1<CR>gv=gv", opts, {desc = "Move Code Block Down"})
--indentation
    --  v-mode
key.set("v", "<A-h>", "<v", opts, {desc = "Indent Code Block - IN"})
key.set("v", "<A-l>", ">v", opts, {desc = "Indent Code Block - OUT"} )
key.set("n", "<A-h>", "v<", opts, {desc = "Indent Line - IN"})
key.set("n", "<A-l>", "v>", opts, {desc = "Indent Line - OUT"} )
-- Comments 
vim.api.nvim_set_keymap("n", "<A-m>", "gcc", {noremap = false})
vim.api.nvim_set_keymap("n", "<A-o>", "gco", {noremap = false})
vim.api.nvim_set_keymap("n", "<A-O>", "gcO", {noremap = false})
vim.api.nvim_set_keymap("n", "<A-a>", "gcA", {noremap = false})
vim.api.nvim_set_keymap("v", "<A-m>", "gb",  {noremap = false})

----------------OTHERS----------------
--buffer nav
key.set("n", "<C-w>", ":bd<CR>", opts, {desc = "Close Current File in Buffer"}) -- Close buffer
key.set("n", "<C-n>", ":bp<CR>", opts, {desc = "Go to Prev file in Buffer"}) -- prev buffer
key.set("n", "<C-m>", ":bn<CR>", opts, {desc = "Go to Next file in Buffer"}) -- next buffer

-- Copy/paste to clipboard
key.set("v", "<leader>y", '"+y', opts1, {desc = "Copy to Selection System Clipboard [visual Mode]"}) -- system clipboard copy (visual mode)
key.set("n", "<leader>y", '"+y', opts1, {desc = "Copy to Selection System Clipboard"}) -- system clipboard copy (normal mode)
key.set("n", "<leader>yy",'"+yy', opts1, {desc = "Copy Line to System Clipboard"}) -- copy line
key.set('n', '<leader>p', '"+p', opts1, {desc = "Paste from Clipboard - Below"})
key.set('n', '<leader>P', 'O<Esc>"+P', opts1, {desc = "Paste from Clipboard - Above"})
-- vim.api.nvim_set_keymap('n', '<leader>p', '"+p', opts)


-- Copy/Past to primary selection
--[[ key.set("v", "y", '"*y', opts)
key.set("n", "y", '"*y', opts)
key.set("n", "yy", '"*yy', opts)
key.set('n', "p", '"*p', opts) ]]

--other--
-- key.set("n", "<leader>p", "\"_dP", opts)
--remove keybinds

----------------LazyGit----------------
key.set("n", "<leader>lg", ":LazyGit<CR>", {desc = "Open Lazygit"} )

----------------LSP----------------
-- local opts2 = { noremap = true, silent = true, buffer = bufnr, }
key.set("n", "<leader>fd", function() vim.lsp.buf.definition() end, {desc = "Go to fuction definition"}, opts)
-- key.set("n", "<leader>ff", function() vim.lsp.buf.implementation() end, {desc = "Go to fuction Implementation"}, opts)
key.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, { desc = "Rename Function"}, opts)

----------------LSP----------------
key.set("n", "<leader>fk", ":Telescope keymaps<CR>", {desc = "Open Key Maps"})
key.set("n", "<leader>h", ":Telescope find_files<CR>", {desc = "Find File"})
key.set("n", "<leader>g", ":Telescope live_grep<CR>,", {desc = "Live Grep"})
key.set("n", "<leader>j", ":Telescope buffers<CR>", {desc = "Buffer List"})
key.set("n", "<leader>k", "<cmd>TodoTelescope<cr>", {desc = "TODO List"})

----------------TODO Comments----------------
key.set("n", "[t", function() _G.todo_comments.jump_next() end, { desc = "Next todo comment" })
key.set("n", "]t", function() _G.todo_comments.jump_prev() end, { desc = "Previous todo comment" })
