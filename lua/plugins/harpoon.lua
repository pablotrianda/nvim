return {
	"ThePrimeagen/harpoon",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-lua/popup.nvim",
	},
	config = function()
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
	end
}
