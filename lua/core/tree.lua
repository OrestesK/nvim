local keybind = '<leader>e'
return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
  },
  cmd = 'Neotree',
  keys = {
    { keybind, ':Neotree reveal<CR>', desc = 'Tree', silent = true },
  },
  opts = {
    close_if_last_window = true,
    sort_case_insensitive = true,
    event_handlers = {
      -- auto close
      {
        event = 'file_open_requested',
        handler = function()
          require('neo-tree.command').execute { action = 'close' }
        end,
      },
    },
    filesystem = {
      window = {
        position = 'right',
        mappings = {
          [keybind] = 'close_window',
          ['P'] = { 'toggle_preview', config = { use_float = true, use_image_nvim = true } },
          ['l'] = 'open',
          ['L'] = 'open_tabnew',
          ['h'] = 'close_node',
        },
      },
    },
  },
}
