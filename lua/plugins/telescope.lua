-- Fuzzy Finder (files, lsp, etc)
return {
	'nvim-telescope/telescope.nvim',
	branch = '0.1.x',
	dependencies = { 'nvim-lua/plenary.nvim' },
	setup = {
		defaults = {
			mappings = {
				i = {
					['<C-u>'] = false,
					['<C-d>'] = false,
				},
			},
			file_ignore_patterns = { "node_modules", "dir" },
		}
	},
	config = function()
		vim.g.mapleader = ' '
		vim.g.maplocalleader = ' '
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
	end,

}
