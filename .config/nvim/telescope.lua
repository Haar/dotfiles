local telescope = require('telescope')

local utils = require('utils')

telescope.setup()

utils.map('n', '<leader>f', ':Telescope live_grep<CR>')
