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
    opts = {},
  },

  -- Tailwind colors
  {
    'themaxmarchuk/tailwindcss-colors.nvim',
    lazy = false,
    opts = {},
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

  -- Temporarily highlight word under cursor
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
        debounce_timeout = 500,
      }
    end,
  },

  -- Search and Replace
  {
    'MagicDuck/grug-far.nvim',
    -- Note (lazy loading): grug-far.lua defers all it's requires so it's lazy by default
    -- additional lazy config to defer loading is not really needed...
    config = function()
      -- optional setup call to override plugin options
      -- alternatively you can set options with vim.g.grug_far = { ... }
      require('grug-far').setup {
        -- options, see Configuration section below
        -- there are no required options atm
      }
    end,
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
