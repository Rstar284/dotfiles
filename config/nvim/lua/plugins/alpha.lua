local alpha = require('alpha')
local dashboard = require('alpha.themes.dashboard')

local leader = '<Space>'

local function button(sc, txt, leader_txt, keybind, keybind_opts)
  local sc_after = sc:gsub('%s', ''):gsub(leader_txt, '<Space>')

  local opts = {
    position = 'center',
    shortcut = sc,
    cursor = 5,
    width = 50,
    align_shortcut = 'right',
    hl_shortcut = 'Normal',
  }

  if nil == keybind then
    keybind = sc_after
  end
  keybind_opts = vim.F.if_nil(keybind_opts, { noremap = true, silent = true, nowait = true })
  opts.keymap = { 'n', sc_after, keybind, keybind_opts }

  local function on_press()
    local key = vim.api.nvim_replace_termcodes(sc_after .. '<Ignore>', true, false, true)
    vim.api.nvim_feedkeys(key, 't', false)
  end

  return {
    type = 'button',
    val = txt,
    on_press = on_press,
    opts = opts,
  }
end


dashboard.section.header.val = [[


 ________   _______   ________  ___      ___ ___  _____ ______
|\   ___  \|\  ___ \ |\   __  \|\  \    /  /|\  \|\   _ \  _   \
\ \  \\ \  \ \   __/|\ \  \|\  \ \  \  /  / | \  \ \  \\\__\ \  \
 \ \  \\ \  \ \  \_|/_\ \  \\\  \ \  \/  / / \ \  \ \  \\|__| \  \
  \ \  \\ \  \ \  \_|\ \ \  \\\  \ \    / /   \ \  \ \  \    \ \  \
   \ \__\\ \__\ \_______\ \_______\ \__/ /     \ \__\ \__\    \ \__\
    \|__| \|__|\|_______|\|_______|\|__|/       \|__|\|__|     \|__|





]]
dashboard.section.header.opts.hl = 'Normal'

dashboard.section.buttons.val= {
  button('e', 'ﱐ  New file', leader, '<cmd>ene<CR>'),
  button('c', '  Nvim Config', leader, '<cmd>e ~/.config/nvim/<CR>'),
  button('s', '  Sessions', leader, '<cmd>SessionManager load_session<CR>'),
  button(leader .. ' c', '  Colorscheme', leader, '<cmd>Telescope colorscheme<CR>'),
  button('q', '  Quit' , leader, '<cmd>qa<CR>')
}

local fortune = require('alpha.fortune')
dashboard.section.footer.val = fortune()
dashboard.section.footer.opts.hl = 'Normal'

local head_butt_padding = 5
local occu_height = #dashboard.section.header.val + 2 * #dashboard.section.buttons.val + head_butt_padding
local header_padding = math.max(5, math.ceil((vim.fn.winheight('$') - occu_height) * 0.50))
local foot_butt_padding_ub = vim.o.lines - header_padding - occu_height - #dashboard.section.footer.val + 2
local foot_butt_padding = math.floor((vim.fn.winheight('$') - 2 * header_padding - occu_height))
foot_butt_padding = math.max(5, math.max(math.min(5, foot_butt_padding), math.min(math.max(5, foot_butt_padding), foot_butt_padding_ub)))

dashboard.config.layout = {
  { type = 'padding', val = header_padding },
  dashboard.section.header,
  { type = 'padding', val = head_butt_padding },
  dashboard.section.buttons,
  { type = 'padding', val = foot_butt_padding },
  dashboard.section.footer
}

vim.cmd([[
	autocmd FileType alpha setlocal nofoldenable
]])

alpha.setup(dashboard.opts)
