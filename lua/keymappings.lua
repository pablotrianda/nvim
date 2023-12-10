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
vim.keymap.set('n', '<leader>e', require("nvim-tree").toggle, { desc = 'Toggle NvimTree' })
vim.keymap.set('n', '<leader>E', require("nvim-tree").focus, { desc = 'Find File NvimTree' })

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

-- [[ Telescope ]]
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
	-- You can pass additional configuration to telescope to change theme, layout, etc.
	require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
		winblend = 10,
		previewer = false,
	})
end, { desc = '[/] Fuzzily search in current buffer]' })

function vim.getVisualSelection()
	vim.cmd('noau normal! "vy"')
	local text = vim.fn.getreg('v')
	vim.fn.setreg('v', {})

	text = string.gsub(text, "\n", "")
	if #text > 0 then
		return text
	else
		return ''
	end
end

vim.keymap.set('n', '<c-p>', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>F', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('v', '<leader>F',
	function()
		local text = vim.getVisualSelection()
		require('telescope.builtin').grep_string({ default_text = text })
	end, { noremap = true, silent = true, desc = '[S]earch [T]ext selected' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>rp', function()
		require('telescope.builtin').find_files({
			prompt_title = "Plugins",
			cwd = "~/.config/nvim/lua/plugins",
			attach_mappings = function(_, map)
				local actions = require("telescope.actions")
				local action_state = require("telescope.actions.state")
				map("i", "<c-y>", function(prompt_bufnr)
					local new_plugin = action_state.get_current_line()
					actions.close(prompt_bufnr)
					vim.cmd(string.format("edit ~/.config/nvim/lua/plugins/%s.lua", new_plugin))
				end)
				return true
			end
		})
	end,
	{ desc = "[R]ead [P]lugins" }
)

-- [[ Harpoon ]]
vim.keymap.set("n", "<leader>hl", function() require("harpoon.ui").toggle_quick_menu() end, { desc = "Harpoon Menu" })
vim.keymap.set("n", "<leader>ha", function() require("harpoon.mark").add_file() end, { desc = "Harpoon Add file" })
vim.keymap.set("n", "<leader>ht",
	function()
		vim.api.nvim_command [[vsplit]]
		require("harpoon.term").gotoTerminal(1)
		vim.api.nvim_command [[startinsert]]
	end,
	{ desc = "Harpoon quick split Terminal" }
)
local binds = 5 -- 5 fast access
for i = 1, binds do
	vim.keymap.set("n",
		string.format("<leader>%s", i),
		function()
			require("harpoon.ui").nav_file(i)
		end,
		{ desc = "Harpoon go to file " .. i }
	)
end

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
