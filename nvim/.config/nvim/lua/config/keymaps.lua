local key = vim.keymap
local opts  = { noremap = true, silent = true }
local opts1 = { noremap = true, silent = false }


vim.o.clipboard = ""

key.set("n","<leader>wq"  , ":wqa<CR>"                  , opts  , { desc = "Save and Quit File"})

----------------LINE EDITING----------------
-- Normal
key.set("n", "<A-k>"      , ':m .-2<CR>=='              , opts  , {desc = "Move Line Up"})
key.set("n", "<A-j>"      , ':m .+1<CR>=='              , opts  , {desc = "Move Line Down"})
key.set("n", "<A-h>"      , "v<"                        , opts  , {desc = "Indent Line - IN"})
key.set("n", "<A-l>"      , "v>"                        , opts  , {desc = "Indent Line - OUT"} )
 -- Visual
key.set("v", "<A-k>"      , ":m '<-2<CR>gv=gv"          , opts  , {desc = "Move Code Block Up"})
key.set("v", "<A-j>"      , ":m '>+1<CR>gv=gv"          , opts  , {desc = "Move Code Block Down"})
key.set("v", "<A-h>"      , "<v"                        , opts  , {desc = "Indent Code Block - IN"})
key.set("v", "<A-l>"      , ">v"                        , opts  , {desc = "Indent Code Block - OUT"} )

----------------OTHERS----------------
--buffer nav
key.set("n", "<C-w>"      , ":bd<CR>"                   , opts1 , {desc = "Close Current File in Buffer"})
key.set("n", "<C-n>"      , ":bp<CR>"                   , opts  , {desc = "Go to Prev file in Buffer"})
key.set("n", "<C-m>"      , ":bn<CR>"                   , opts  , {desc = "Go to Next file in Buffer"})

-- Copy/paste to clipboard
key.set("v", "<leader>y"  , '"+y'                       , opts1 , {desc = "Copy to Selection System Clipboard [visual Mode]"})
key.set("n", "<leader>y"  , '"+y'                       , opts1 , {desc = "Copy to Selection System Clipboard"})
key.set("n", "<leader>yy" , '"+yy'                      , opts1 , {desc = "Copy Line to System Clipboard"})
key.set('n', '<leader>p'  , '"+p'                       , opts1 , {desc = "Paste from Clipboard - Below"})
key.set('n', '<leader>P'  , 'O<Esc>"+P'                 , opts1 , {desc = "Paste from Clipboard - Above"})

----------------LazyGit----------------
key.set("n", "<leader>lg" , ":LazyGit<CR>"              , opts  , {desc = "Open Lazygit"} )
-------------Telescope-------------
key.set("n", "<leader>fk" , ":Telescope keymaps<CR>"    , opts  , {desc = "Open Key Maps"})
key.set("n", "<leader>g"  , ":Telescope git_files<CR>"  , opts  , {desc = "Find File"})
key.set("n", "<leader>j"  , ":Telescope find_files<CR>" , opts  , {desc = "Find File"})
key.set("n", "<leader>h"  , ":Telescope live_grep<CR>," , opts  , {desc = "Live Grep"})
key.set("n", "<leader>k"  , ":Telescope buffers<CR>"    , opts  , {desc = "Buffer List"})
key.set("n", "<leader>t"  , "<cmd>TodoTelescope<cr>"    , opts  , {desc = "TODO List"})

----------------TODO Comments----------------
key.set("n", "[t"         , function() _G.todo_comments.jump_next() end,opts , { desc = "Next todo comment" })
key.set("n", "]t"         , function() _G.todo_comments.jump_prev() end,opts , { desc = "Previous todo comment" })
