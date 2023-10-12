return {
	"jose-elias-alvarez/null-ls.nvim",
	config = function()
		local status, null_ls = pcall(require, "null-ls")
		if (not status) then return end
	end
}
