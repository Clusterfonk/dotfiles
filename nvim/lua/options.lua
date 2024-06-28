--options

-- leader
vim.g.mapleader = ' '
vim.keymap.set('n', '<leader>w', function() vim.cmd('write!') end)

local opt = vim.opt

opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.scrolloff = 8           -- Surrounds the cursor by N lines
opt.cmdheight = 1           -- Height of the command bar
opt.hid = true              -- Hide buffers when abandoned
opt.showmatch = true        -- Show matching parentheses
opt.matchtime = 2           -- N tenth of a second showmatch

--opt.clipboard = 'unnamedplus'                   -- Copy/paste to system clipboard
opt.completeopt = 'menuone,noinsert,noselect'   -- Autocomplete options
opt.showmode = false                            -- Hide current mode

opt.ignorecase = true       -- Ignore case letters when search
opt.smartcase = true        -- Ignore lowercase for the whole pattern
opt.linebreak = true        -- Wrap on word boundary
opt.termguicolors = true    -- Enable 24-bit RGB colors
opt.laststatus = 2            -- Always show statusline
opt.hlsearch = false
opt.hlsearch = true

-----------------------------------------------------------
-- Tabs, indent
-----------------------------------------------------------
opt.expandtab = true        -- Use spaces instead of tabs
opt.shiftwidth = 4          -- Shift N spaces when tab
opt.tabstop = 4             -- 1 tab == N spaces
opt.softtabstop = 4
opt.smartindent = true      -- Autoindent new lines
opt.tw = 200                -- Linebreak on N characters

-----------------------------------------------------------
-- Memory, CPU
-----------------------------------------------------------
opt.hidden = true           -- Enable background buffers
opt.history = 500           -- Remember N lines in history
opt.lazyredraw = true       -- Faster scrolling
opt.updatetime = 100        -- ms to wait for trigger an event
opt.swapfile = false                            -- Don't use swapfile
opt.undodir = os.getenv("HOME") .. "/.nvim/undodir"
opt.undofile = true

opt.backspace = [[indent,eol,start]]
opt.whichwrap:append "<>hl"

opt.list = true
opt.listchars = {eol='¬', tab='¦ ', nbsp='⎵'}

opt.signcolumn = "yes"
opt.isfname:append("@-@")

opt.termguicolors = true
opt.colorcolumn = "100"

