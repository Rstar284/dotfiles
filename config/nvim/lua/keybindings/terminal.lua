function _G.OpenTerminal()
    vim.cmd [[
         split term://zsh
          resize 20
    ]]
end

local cartographer = require 'cartographer'
cartographer.n['<leader>`'] = ':call v:lua.OpenTerminal()<CR>'
