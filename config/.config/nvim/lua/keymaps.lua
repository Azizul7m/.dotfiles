-- fetch keymap
local keymap = vim.api.nvim_set_keymap
-- Silent keymap option
local opts = { silent = true }

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "


-- map the key jk to normal mode
keymap('i', 'jk', [[<esc>]], {})

-- Normal --
-- Split window --

keymap("n", "<leader>wv", ":vsplit<CR>", opts)
keymap("n", "<leader>ws", ":split<CR>", opts)
keymap("n", "<leader>wc", ":exit<CR>", opts)
keymap("n", "<leader>wq", ":q<CR>", opts)
-- Better window navigation
keymap("n", "<leader>wh", "<C-w>h", opts)
keymap("n", "<leader>wj", "<C-w>j", opts)
keymap("n", "<leader>wk", "<C-w>k", opts)
keymap("n", "<leader>wl", "<C-w>l", opts)

keymap("n", "<C-l>", "<C-w>l", opts)
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-j>", "<C-w>j", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<leader>bn", ":tabnew<CR>", opts)
keymap("n", "<leader>bc", ":tabclose<CR>", opts)
keymap("n", "<leader>bq", ":q<CR>", opts)
keymap("n", "<leader>bi", ":Telescope buffers<CR>", opts)
keymap("n", "<leader>bl", ":bnext<CR>", opts)
keymap("n", "<leader>bh", ":bprevious<CR>", opts)
keymap("n", "<tab>", ":bnext<CR>", opts)
keymap("n", "S-<tab>", ":bprevious<CR>", opts)
keymap("n", "<leader>bh", ":bprevious<CR>", opts)

-- Clear highlights
keymap("n", "<leader>th", ":nohlsearch<CR>", opts)


--Open <leader>o
keymap('n', 'm', [[:NeoTreeRevealToggle<CR>]], {})
keymap('n', '<leader>op', [[:NeoTreeFloatToggle<CR>]], {})
keymap('n', '<leader>ot','<Cmd>ToggleTerm<CR>', {})

-- Telescope
keymap("n", "<leader> ", ":Telescope find_files<CR>", opts)
keymap("n", "<leader>ft", ":Telescope live_grep<CR>", opts)
keymap("n", "<leader>fp", ":Telescope projects<CR>", opts)
keymap("n", "<leader>fb", ":Telescope buffers<CR>", opts)

-- Git
keymap("n", "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", opts)


keymap("n", "<leader>gh", "<cmd>Lspsaga lsp_finder<CR>", opts)
-- Rename all occurrences of the hovered word for the entire file
keymap("n", "<leader>gr", "<cmd>Lspsaga rename<CR>", opts)
-- Rename all occurrences of the hovered word for the selected files
keymap("n", "<leader>gr", "<cmd>Lspsaga rename ++project<CR>", opts)

