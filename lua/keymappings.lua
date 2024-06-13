-- [[ Basic Keymaps ]]
-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Reselect visual selection after indenting
vim.api.nvim_set_keymap("v", ">", ">gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<", "<gv", { noremap = true, silent = true })

-- Ntree
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle NvimTree" })
vim.keymap.set("n", "<leader>E", ":NvimTreeFocus<CR>", { desc = "Find File NvimTree" })

-- Exit from terminal mode to normal mode
vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]])

-- Navigation on insert mode
-- vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.keymap.set('i', '<C-h>', '<Left>')
vim.keymap.set('i', '<C-l>', '<Right>')
vim.keymap.set('i', '<C-j>', '<Down>')
vim.keymap.set('i', '<C-k>', '<Up>')

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

-- [[ Oil]]
vim.keymap.set("n", "<leader>-", "<CMD>Oil --float<CR>", { desc = "Open parent directory" })

-- [[Debugger]]
vim.keymap.set("n", "<leader>dt", ":lua require('dapui').toggle()<CR>", { desc = "[DEBUG] Toggle UI" })
vim.keymap.set("n", "<leader>db", ":DapToggleBreakpoint<CR>", { desc = "[DEBUG] Toggle breakpoint" })
vim.keymap.set("n", "<leader>dc", ":DapContinue<CR>", { desc = "[DEBUG] Continue" })
vim.keymap.set("n", "<leader>dr", ":lua require('dapui').open({reset = true})<CR>", { desc = "[DEBUG] Reset UI" })

-- [{Request}]
vim.keymap.set("n", "<leader>rr", ":lua require('rest-nvim').run()<CR>", { desc = "[REQUEST] Run request" })

-- [[ Neogit]]
vim.keymap.set("n", "<leader>gs", function() require("neogit").open() end, { desc = "Open Neo[GIT]" })

-- [[Rustacean]]
vim.keymap.set("n", "<leader>ca",
	function()
		vim.cmd.RustLsp('codeAction')
	end,
	{ desc = "[RUST] Show code actions", silent = true }
)

-- [[Format file]]
vim.keymap.set("n","<leader>f",function() vim.lsp.buf.format() end, {desc = "[F]ormat file"})

-- [[Move over quick list]]
vim.keymap.set("n","<leader>.",":cnext <CR>",{ noremap = true, silent = true })
vim.keymap.set("n","<leader>,",":cprevious <CR>",{ noremap = true, silent = true })

-- [[Remove highlight selection]]
vim.keymap.set("n","<leader>n",":noh <CR>",{ noremap = true, silent = true })
