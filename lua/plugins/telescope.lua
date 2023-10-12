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
  }

}
