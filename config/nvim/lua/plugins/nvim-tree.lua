vim.g.nvim_tree_highlight_opened_files = 1
require('nvim-tree').setup({
  disable_netrw = true,
  hijack_netrw = true,
  open_on_setup = true,
  auto_reload_on_write = true,
  open_on_tab = true,
})

