local cartographer = require 'cartographer'

cartographer.t.i["<A-h>"] = [[<C-\><C-N><C-w>h]]
cartographer.t.i["<A-j>"] = [[<C-\><C-N><C-w>j]]
cartographer.t.i["<A-k>"] = [[<C-\><C-N><C-w>k]]
cartographer.t.i["<A-l>"] = [[<C-\><C-N><C-w>l]]
cartographer.t.i["<A-LEFT>"] = [[<C-\><C-N><C-w>h]]
cartographer.t.i["<A-DOWN>"] = [[<C-\><C-N><C-w>j]]
cartographer.t.i["<A-UP>"] = [[<C-\><C-N><C-w>k]]
cartographer.t.i["<A-RIGHT>"] = [[<C-\><C-N><C-w>l]]

cartographer.n["<A-h>"] = "<C-w>h"
cartographer.n["<A-j>"] = "<C-w>j"
cartographer.n["<A-k>"] = "<C-w>k"
cartographer.n["<A-l>"] = "<C-w>l"
cartographer.n["<A-LEFT>"] = "<C-w>h"
cartographer.n["<A-DOWN>"] = "<C-w>j"
cartographer.n["<A-UP>"] = "<C-w>k"
cartographer.n["<A-RIGHT>"] = "<C-w>l"

cartographer.n["<C-t>"] = "<cmd>:tabnew<CR>"
cartographer.n["<leader>tc"] = "<cmd>:tabclose<CR>"
cartographer.n["tn"] = "<cmd>:BufferLineCycleNext<CR>"
cartographer.n["tp"] = "<cmd>:BufferLineCyclePrev<CR>"
cartographer.n["<leader>cd"] = "<cmd>:cd %:p:h<cr>:pwd<cr>"
