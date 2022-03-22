-- lualine
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'tokyonight',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
  },
  sections = {
    lualine_b = {'branch', 'diagnostics'},
    lualine_x = {'filetype', 'encoding'}
  },
}
