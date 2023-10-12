-- Nvim tree
return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  tag = 'nightly',
  config = function()
    require("nvim-tree").setup {}
  end
}
