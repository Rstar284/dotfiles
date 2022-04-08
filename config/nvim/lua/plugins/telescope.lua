-- Telescope
require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
    },
  },
}

-- Enable telescope fzf native
require('telescope').load_extension 'fzf'
require("telescope").load_extension 'ui-select'

-- Keybindings
-- TODO: Move to the `keybindings` directory
local cartographer = require('cartographer')
cartographer.n.nore['<C-b>'] = '<cmd>:Telescope buffers<cr>'
