local telescope = require('telescope')

local utils = require('utils')

telescope.setup()

utils.map('n', '<leader>f', ':Telescope live_grep<CR>')

require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "eex",
    "elixir",
    "erlang",
    "heex",
    "html",
    "surface",
  },
  highlight = {enable = true},
  disable = { "typescript" },
})
