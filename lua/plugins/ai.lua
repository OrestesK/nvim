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
        -- disable_keymaps = true,
        -- keymaps = {
        --   accept_suggestion = '<tab>',
        --   clear_suggestion = '<C-h>',
        --   accept_word = '<C-;>',
        -- },
        ignore_filetypes = { 'md', 'txt' },
      }
      vim.keymap.set('n', '<leader>tm', function()
        local api = require 'supermaven-nvim.api'
        api.toggle()
        if api.is_running() then
          require 'notify'('Enabled AI autocompletion', 2)
        else
          require 'notify'('Disabled AI autocompletion', 2)
        end
      end, { desc = 'Toggle Inline AI autocompletion' })
    end,
  },
}
