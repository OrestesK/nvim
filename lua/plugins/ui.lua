return {
  -- Notifications
  {
    'rcarriga/nvim-notify',
    config = function()
      require('notify').setup {
        level = 2,
        timeout = 1000,
        top_down = false,
        render = 'wrapped-compact',
        stages = 'fade',
        fps = 60,
      }
    end,
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
  -- {
  --   'sphamba/smear-cursor.nvim',
  --   opts = {
  -- smear_insert_mode = false,
  -- smear_between_buffers = false,
  -- smear_vertically = false,
  -- smear_diagonally = false,
  -- smear_to_cmd = false,
  --
  -- stiffness = 0.8,
  -- trailing_stiffness = 0.5,
  -- distance_stop_animating = 0.5,
  -- never_draw_over_target = false,
  --   },
  -- },

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
