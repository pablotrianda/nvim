--DAP (Debug Adapter Protocol)
local options = {
	icons_enabled = true,
	theme = 'onedark',
	component_separators = '|',
	section_separators = '',
	globalstatus = true,
}
local inactive_winbar = {
	lualine_c = { "filename" },
}

return {
	"rcarriga/nvim-dap-ui",
	event = "VeryLazy",
	dependencies = {
		"mfussenegger/nvim-dap",
		"nvim-lualine/lualine.nvim",
		"nvim-neotest/nvim-nio"
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")
		require("dapui").setup()
		dap.listeners.after.event_initialized["dapui_config"] = function()
			-- Disable lualine inactive_winbar to avoid cover the debug controls
			require('lualine').setup {
				inactive_winbar = {}
			}
			dapui.open()
		end
		dap.listeners.before.event_terminated["dapui_config"] = function()
			require('lualine').setup {
				options = options,
				inactive_winbar = inactive_winbar
			}
			dapui.close()
		end
		dap.listeners.before.event_exited["dapui_config"] = function()
			require('lualine').setup {
				options = options,
				inactive_winbar = inactive_winbar
			}
			dapui.close()
		end
	end
}
