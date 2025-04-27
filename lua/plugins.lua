return {
  -- Theme
  {
    'sainnhe/gruvbox-material',
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.gruvbox_material_enable_italic = true
      vim.cmd.colorscheme 'gruvbox-material'
    end,
  },

  -- Keys
  {
    'folke/which-key.nvim',
    event = 'VimEnter',
    opts = {
      delay = 200,
      icons = {
        mappings = vim.g.have_nerd_font,
        keys = {},
      },
      spec = {
        { '<leader>f', group = '[F]ind' },
        { '<leader>t', group = '[T]oggle' },
        { '<leader>s', group = '[S]search' },
        { '<leader>l', group = '[L]sp' },
        { '<leader>g', group = '[G]it', mode = { 'n', 'v' } },
      },
    },
  },

  require 'core.search',
  require 'core.lsp',
  require 'core.autoformat',
  require 'core.autocompletion',
  require 'core.tabs',
  require 'core.tree',
  require 'core.debug',
  require 'core.navigate',

  require 'plugins.basic',
  require 'plugins.ui',
  require 'plugins.ai',
  require 'plugins.misc',
}
