-- Fancier statusline
return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	version = "*",
	config = function()
		require('lualine').setup {
			options = {
				icons_enabled = true,
				theme = 'onedark',
				component_separators = '|',
				section_separators = '',
				globalstatus = true,
			},
			sections = {
				lualine_c = { { "filename", file_status = true, path = 1 } },
			},
			inactive_winbar = {
				lualine_c = { "filename" },
			}
		}
	end
}
