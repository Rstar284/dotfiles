local cartographer = require('cartographer')
cartographer['<SPACE>'] = '<LEADER>'
cartographer.n.nore['<C-d>'] = '<NOP>'
cartographer.n.nore['<C-u>'] = '<NOP>'
cartographer.n.nore['<LEADER>q'] = '<CMD>q!<CR>'
cartographer.n.nore['<LEADER>w'] = '<CMD>w!<CR>'
cartographer.n.nore['<LEADER>x'] = '<CMD>x!<CR>'
cartographer.n.nore['j'] = 'gj'
cartographer.n.nore['k'] = 'gk'
cartographer.n.nore['<LEADER>nt'] = '<CMD>:NvimTreeToggle<CR>'
cartographer.n.nore['<F5>'] = '<CMD>:UndotreeToggle<CR>'
cartographer.n.nore['<C-p><C-i>'] = '<CMD>:PaqSync<CR>'
