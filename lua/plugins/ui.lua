return {
  -- UI + Notifications
  {
    'folke/noice.nvim',
    event = 'VeryLazy',
    opts = {
      lsp = {
        override = {
          ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
          ['vim.lsp.util.stylize_markdown'] = true,
        },
        signature = {
          enabled = false,
        },
      },
      presets = {
        bottom_search = true, -- use a classic bottom cmdline for search
        command_palette = true, -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = false, -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = true, -- add a border to hover docs and signature help
      },
    },
    dependencies = {
      'MunifTanjim/nui.nvim',
      'rcarriga/nvim-notify',
    },
  },

  -- HEX colors
  {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup()
    end,
  },

  -- Tailwind colors
  {
    'themaxmarchuk/tailwindcss-colors.nvim',
    lazy = false,
    config = function()
      require('tailwindcss-colors').setup {}
    end,
  },

  -- Cursor animation
  {
    'sphamba/smear-cursor.nvim',
    opts = {
      smear_insert_mode = false,
      smear_between_buffers = false,
      smear_vertically = false,
      smear_diagonally = false,
      smear_to_cmd = false,

      stiffness = 0.8,
      trailing_stiffness = 0.5,
      distance_stop_animating = 0.5,
      never_draw_over_target = false,
    },
  },

  { 'nvim-pack/nvim-spectre' },

  -- Aerial (lsp symbol navigation)
  {
    'stevearc/aerial.nvim',
    opts = {},
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require('aerial').setup {
        on_attach = function(bufnr)
          vim.keymap.set('n', '{', '<cmd>AerialPrev<CR>', { buffer = bufnr })
          vim.keymap.set('n', '}', '<cmd>AerialNext<CR>', { buffer = bufnr })
        end,
      }
    end,
    keys = {
      { '<leader>aa', '<cmd>AerialToggle!<CR>', desc = 'Aerial' },
      { '<leader>as', '<cmd>Telescope aerial<CR>', desc = 'Aerial search' },
    },
  },

  -- Lazygit
  {
    'kdheepak/lazygit.nvim',
    lazy = true,
    cmd = {
      'LazyGit',
      'LazyGitConfig',
      'LazyGitCurrentFile',
      'LazyGitFilter',
      'LazyGitFilterCurrentFile',
    },
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    keys = {
      { '<leader>gg', '<cmd>LazyGit<cr>', desc = 'LazyGit' },
    },
  },
}
