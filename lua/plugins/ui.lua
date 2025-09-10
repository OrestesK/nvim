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
        merge_duplicates = false,
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

  -- Highlight words
  {
    'lfv89/vim-interestingwords',
    keys = {
      {
        '<leader>k',
        mode = { 'n' },
        ":call InterestingWords('n')",
        desc = 'Highlight Word',
        silent = true,
      },
      {
        '<leader>k',
        mode = { 'v' },
        ":call InterestingWords('v')",
        desc = 'Highlight Word',
        silent = true,
      },
      {
        '<leader>K',
        mode = { 'n' },
        ':call UncolorAllWords()',
        desc = 'Clear Highlighted Words',
        silent = true,
      },
    },
  },

  {
    'tzachar/local-highlight.nvim',
    config = function()
      require('local-highlight').setup {
        insert_mode = false,
        min_match_len = 1,
        max_match_len = 100,
        highlight_single_match = true,
        animate = {
          enabled = false,
        },
        debounce_timeout = 0,
      }
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

  -- Search and Replace
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
