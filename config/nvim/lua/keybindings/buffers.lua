local cartographer = require 'cartographer'
cartographer.n['<leader>bd'] = "<cmd>:bdelete!<cr>"
cartographer.n['<leader>bda'] = "<cmd>:bufdo bd!<cr>"
cartographer.n['<leader>bf'] = "<cmd>:bnext<cr>"
cartographer.n['<leader>bp'] = "<cmd>:bprevious<cr>"
cartographer.n['<leader>b'] = "<cmd>:b#<cr>"
cartographer.n.nore.silent['<leader>bs'] = "<cmd>:BufferLinePick<cr>"
