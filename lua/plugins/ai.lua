return {
  {
    'supermaven-inc/supermaven-nvim',
    opts = {},
    config = function()
      require('supermaven-nvim').setup {
        color = {
          suggestion_color = '#ffffff',
          cterm = 244,
        },
        ignore_filetypes = { 'md', 'txt' },
        keymaps = {
          clear_suggestion = '<C-h>',
          accept_word = '<C-l>',
          accept_suggestion = '<Tab>',
        },
      }
      vim.keymap.set('n', '<leader>ta', function()
        local api = require 'supermaven-nvim.api'
        api.toggle()
        if api.is_running() then
          require 'notify'('Enabled AI Autocompletion', 2)
        else
          require 'notify'('Disabled AI Autocompletion', 2)
        end
      end, { desc = '[T]oggle AI [A]utocompletion' })
    end,
  },
}
