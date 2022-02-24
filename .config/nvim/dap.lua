require('dbg')

vim.g.dap_virtual_text = true

local utils = require('utils')

-- nvim-dap-ui
require("dapui").setup()

utils.map('n', '<leader>dui', '<cmd>lua require"dapui".toggle()<CR>')
