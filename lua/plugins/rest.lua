return {
  "rest-nvim/rest.nvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      table.insert(opts.ensure_installed, "http")
    end,
  },
  config = function()
    require("rest-nvim").setup({
      result = {
        split = {
          horizontal = false,  -- split vertical
          in_place = false,    -- evita mover panel, abre nuevo
          size = 0.4,          -- 40% del ancho
        },
        formatters = {
          json = "jq",
        },
      },
    })
  end,
}
