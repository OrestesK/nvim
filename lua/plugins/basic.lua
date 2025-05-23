-- Basic functionality
return {
  -- Keybind to comment
  {
    'numToStr/Comment.nvim',
    opts = {
      mappings = {
        basic = false,
        extra = true,
      },
    },
  },
  -- Highlight keywords in comments
  { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },

  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',

  -- Autopairs
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    opts = {},
  },

  -- Better yanking
  {
    'gbprod/yanky.nvim',
    opts = {
      highlight = {
        on_put = true,
        on_yank = true,
        timer = 100,
      },
      preserve_cursor_position = {
        enabled = true,
      },
    },
    keys = {
      { '<leader>c', mode = { 'n' }, ':Telescope yank_history<CR>', desc = 'Clipboard', silent = true },
      { 'y', mode = { 'n', 'x' }, '<Plug>(YankyYank)', desc = 'Yanky Yank', silent = true },
      { 'p', mode = { 'n', 'x' }, '<Plug>(YankyPutAfter)', desc = 'Yanky Put After', silent = true },
      { 'P', mode = { 'n', 'x' }, '<Plug>(YankyPutBefore)', desc = 'Yanky Put Before', silent = true },
      { '=p', mode = { 'n' }, '<Plug>(YankyPutBeforeFilter)', desc = 'Yanky Put Before Filter', silent = true },
      { '=P', mode = { 'n' }, '<Plug>(YankyPutAfterFilter)', desc = 'Yanky Put After Filter', silent = true },
      { '<c-p>', mode = { 'n' }, '<Plug>(YankyPreviousEntry)', desc = 'Yanky Previous Entry', silent = true },
      { '<c-n>', mode = { 'n' }, '<Plug>(YankyNextEntry)', desc = 'Yanky Next Entry', silent = true },
    },
  },

  -- Folds
  {
    'kevinhwang91/nvim-ufo',
    dependencies = 'kevinhwang91/promise-async',
    config = function()
      require('ufo').setup {
        provider_selector = function(bufnr, filetype, buftype)
          return { 'treesitter', 'indent' }
        end,
      }
    end,
    keys = {
      {
        'zR',
        mode = { 'n' },
        function()
          require('ufo').openAllFolds()
        end,
        desc = 'Open All Folds',
        silent = true,
      },
      {
        'zM',
        mode = { 'n' },
        function()
          require('ufo').closeAllFolds()
        end,
        desc = 'Close All Folds',
        silent = true,
      },
    },
  },
  {
    'chrisgrieser/nvim-origami',
    event = 'VeryLazy',
    opts = {},
  },

  -- Escape insert with jj
  {
    'max397574/better-escape.nvim',
    config = function()
      require('better_escape').setup {
        timeout = vim.o.timeoutlen,
        default_mappings = false,
        mappings = {
          i = {
            j = {
              j = '<Esc>',
            },
          },
        },
      }
    end,
  },

  -- Add indentation guides even on blank lines
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    ---@module "ibl"
    ---@type ibl.config
    opts = {},
    config = function()
      local highlight = {
        'CursorColumn',
        'Whitespace',
      }
      require('ibl').setup {
        indent = { highlight = highlight, char = '' },
        whitespace = {
          highlight = highlight,
          remove_blankline_trail = false,
        },
        scope = { enabled = false },
      }
    end,
  },

  -- Linting
  -- {
  --   'mfussenegger/nvim-lint',
  --   event = { 'BufReadPre', 'BufNewFile' },
  --   config = function()
  --     local lint = require 'lint'
  --     -- lint.linters_by_ft = {
  --     --   markdown = { 'markdownlint' },
  --     -- }
  --
  --     -- To allow other plugins to add linters to require('lint').linters_by_ft,
  --     -- instead set linters_by_ft like this:
  --     -- lint.linters_by_ft = lint.linters_by_ft or {}
  --     -- lint.linters_by_ft['markdown'] = { 'markdownlint' }
  --     --
  --     -- However, note that this will enable a set of default linters,
  --     -- which will cause errors unless these tools are available:
  --     -- {
  --     --   clojure = { "clj-kondo" },
  --     --   dockerfile = { "hadolint" },
  --     --   inko = { "inko" },
  --     --   janet = { "janet" },
  --     --   json = { "jsonlint" },
  --     --   markdown = { "vale" },
  --     --   rst = { "vale" },
  --     --   ruby = { "ruby" },
  --     --   terraform = { "tflint" },
  --     --   text = { "vale" }
  --     -- }
  --     --
  --     -- You can disable the default linters by setting their filetypes to nil:
  --     -- lint.linters_by_ft['clojure'] = nil
  --     -- lint.linters_by_ft['dockerfile'] = nil
  --     -- lint.linters_by_ft['inko'] = nil
  --     -- lint.linters_by_ft['janet'] = nil
  --     -- lint.linters_by_ft['json'] = nil
  --     -- lint.linters_by_ft['markdown'] = nil
  --     -- lint.linters_by_ft['rst'] = nil
  --     -- lint.linters_by_ft['ruby'] = nil
  --     -- lint.linters_by_ft['terraform'] = nil
  --     -- lint.linters_by_ft['text'] = nil
  --
  --     -- Create autocommand which carries out the actual linting
  --     -- on the specified events.
  --     local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })
  --     vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
  --       group = lint_augroup,
  --       callback = function()
  --         -- Only run the linter in buffers that you can modify in order to
  --         -- avoid superfluous noise, notably within the handy LSP pop-ups that
  --         -- describe the hovered symbol using Markdown.
  --         if vim.opt_local.modifiable:get() then
  --           lint.try_lint()
  --         end
  --       end,
  --     })
  --   end,
  -- },
}
