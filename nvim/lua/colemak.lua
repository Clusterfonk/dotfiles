-------------------
-- leader
-------------------
vim.g.mapleader = ' '
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- escape
vim.keymap.set({'i', 'v'}, ',.', '<Esc>', {})

-------------------
-- movement
-------------------
vim.keymap.set('', 'm', 'h', {})
vim.keymap.set('', 'M', 'H', {})

vim.keymap.set({'n','o','x'}, 'n', 'j', {})
vim.keymap.set({'n','o','x'}, 'N', '', {})
vim.keymap.set('n', 'N', "v:m '>+1<CR>gv=gv<ESC>")
vim.keymap.set('v', 'N', ":m '>+1<CR>gv=gv")

vim.keymap.set({'n','o','x'}, 'e', 'k', {})
vim.keymap.set({'n','o','x'}, 'E', '', {})
vim.keymap.set('n', 'E', "v:m '<-2<CR>gv=gv<ESC>")
vim.keymap.set('v', 'E', ":m '<-2<CR>gv=gv")

vim.keymap.set('', 'i', 'l', {})
vim.keymap.set('', 'I', 'L', {})

-- half page jumping
vim.keymap.set('n', '<C-n>', "<C-d>zz")
vim.keymap.set('n', '<C-e>', "<C-u>zz")

-------------------
-- insert
-------------------
vim.keymap.set({'n', 'o', 'x'}, 'a', 'i', {})
vim.keymap.set({'n', 'o', 'x'}, 'A', 'I', {})
vim.keymap.set({'n', 'o', 'x'}, 't', 'a', {})
vim.keymap.set({'n', 'o', 'x'}, 'T', 'A', {})

-------------------
-- highlight
-------------------
vim.keymap.set({'n', 'o', 'x'}, 'h', 'n')
vim.keymap.set({'n', 'o', 'x'}, 'H', 'N')
vim.keymap.set({'n', 'o', 'x'}, '<leader>/', ":nohlsearch<CR>")

-------------------
-- line manipulation
-------------------
-- Stay inplace and append bottom line to current
vim.keymap.set('n', 'J', "mzJ`z")

-- replace current word
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-------------------
-- copy paste
-------------------
-- paste over selection and keep clipboard
vim.keymap.set('x', '<leader>p', "\"_dP")

-- delete into void register
vim.keymap.set('n', '<leader>d', "\"_d")
vim.keymap.set('v', '<leader>d', "\"_d")

--copy to system clipboard
vim.keymap.set('n', '<leader>y', "\"+y")
vim.keymap.set('v', '<leader>y', "\"+y")
vim.keymap.set('n', '<leader>Y', "\"+Y")

-------------------
-- buffer
-------------------
vim.keymap.set('n', '<leader>q', ":q<CR>")
-- ctrl-i go file forward
-- ctrl-o go file backwards

-------------------
-- quickfix nav.
-------------------
--vim.keymap.set('n', '<C-k>', "<cmd>cnext<CR>zz") -- TODO: diff. keybind 
--vim.keymap.set('n', '<C-k>', "<cmd>lnext<CR>zz") -- TODO: diff. keybind 
--
--vim.keymap.set('n', '<C-j>', "<cmd>cprev<CR>zz") -- TODO: diff. keybind 
--vim.keymap.set('n', '<C-k>', "<cmd>lprev<CR>zz") -- TODO: diff. keybind 


-------------------
-- misc
-------------------
-- switch CWD to the directory of the open buffer
vim.keymap.set({'n', 'o', 'x'}, '<leader>cd', function() 
    vim.cmd("cd %:p:h")
    vim.cmd("pwd")
end)

-- switch projects
vim.keymap.set('n', '<C-f>', "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set('n', '<leader>f', function()
    vim.lsp.buf.format()
end)

-- source current file
vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)

