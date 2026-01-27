return {
  -- Git actions
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
      on_attach = function(bufnr)
        local gitsigns = require 'gitsigns'

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map('n', ']c', function()
          if vim.wo.diff then
            vim.cmd.normal { ']c', bang = true }
          else
            gitsigns.nav_hunk 'next'
          end
        end, { desc = 'Jump to next git [c]hange' })

        map('n', '[c', function()
          if vim.wo.diff then
            vim.cmd.normal { '[c', bang = true }
          else
            gitsigns.nav_hunk 'prev'
          end
        end, { desc = 'Jump to previous git [c]hange' })

        -- Actions
        -- normal mode
        map('n', '<leader>gr', gitsigns.reset_hunk, { desc = 'git [r]eset hunk' })
        map('n', '<leader>gR', gitsigns.reset_buffer, { desc = 'git [R]eset buffer' })
        map('n', '<leader>gp', gitsigns.preview_hunk, { desc = 'git [p]review hunk' })
        map('n', '<leader>gb', gitsigns.blame_line, { desc = 'git [b]lame line' })
        map('n', '<leader>gd', gitsigns.diffthis, { desc = 'git [d]iff against index' })
        map('n', '<leader>gD', function()
          gitsigns.diffthis '@'
        end, { desc = 'git [D]iff against last commit' })
        -- Toggles
        map('n', '<leader>tb', gitsigns.toggle_current_line_blame, { desc = '[T]oggle git show [b]lame line' })
        map('n', '<leader>tD', gitsigns.preview_hunk_inline, { desc = '[T]oggle git show [D]eleted' })
      end,
    },
  },

  -- Various small plugins
  {
    'echasnovski/mini.nvim',
    config = function()
      -- Better Around/Inside textobjects. Ex:
      --  - va)  - [V]isually select [A]round [)]paren
      --  - yinq - [Y]ank [I]nside [N]ext [Q]uote
      --  - ci'  - [C]hange [I]nside [']quote
      require('mini.ai').setup { n_lines = 500 }

      -- Add/delete/replace surroundings (brackets, quotes, etc.). Ex:
      -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
      -- - sd'   - [S]urround [D]elete [']quotes
      -- - sr)'  - [S]urround [R]eplace [)] [']
      -- require('mini.surround').setup()

      -- Simple and easy statusline.
      local statusline = require 'mini.statusline'
      statusline.setup { use_icons = vim.g.have_nerd_font }
      ---@diagnostic disable-next-line: duplicate-set-field
      statusline.section_location = function()
        return '%2l:%-2v'
      end
    end,
  },

  -- NOTE: requires tree-sitter-cli to be installed
  { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    build = ':TSUpdate',
    branch = 'main',
    -- [[ Configure Treesitter ]] See `:help nvim-treesitter-intro`
    config = function()
      --   ---@param buf integer
      --   ---@param language string
      --   local function treesitter_try_attach(buf, language)
      --     -- check if parser exists and load it
      --     if not vim.treesitter.language.add(language) then
      --       return
      --     end
      --     -- enables syntax highlighting and other treesitter features
      --     vim.treesitter.start(buf, language)
      --
      --     -- enables treesitter based folds
      --     -- for more info on folds see `:help folds`
      --     -- vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
      --
      --     -- enables treesitter based indentation
      --     vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      --   end

      -- local available_parsers = require('nvim-treesitter').get_available()
      -- vim.api.nvim_create_autocmd('FileType', {
      --   callback = function(args)
      --     local buf, filetype = args.buf, args.match
      --     local language = vim.treesitter.language.get_lang(filetype)
      --     if not language then
      --       return
      --     end
      --
      --     local installed_parsers = require('nvim-treesitter').get_installed 'parsers'
      --
      --     if vim.tbl_contains(installed_parsers, language) then
      --       -- enable the parser if it is installed
      --       treesitter_try_attach(buf, language)
      --     elseif vim.tbl_contains(available_parsers, language) then
      --       -- if a parser is available in `nvim-treesitter` enable it after ensuring it is installed
      --       require('nvim-treesitter').install(language):await(function()
      --         treesitter_try_attach(buf, language)
      --       end)
      --     else
      --       -- try to enable treesitter features in case the parser exists but is not available from `nvim-treesitter`
      --       treesitter_try_attach(buf, language)
      --     end
      --   end,
      -- })

      -- ensure basic parser are installed
      local parsers = { 'bash', 'c', 'diff', 'html', 'lua', 'luadoc', 'markdown', 'markdown_inline', 'query', 'vim', 'vimdoc' }
      require('nvim-treesitter').install(parsers)
    end,
    --    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
    --    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects (using the `main` branch)
  },

  -- Very useful actions with labels
  {
    'folke/flash.nvim',
    event = 'VeryLazy',
    ---@type Flash.Config
    opts = {},
  -- stylua: ignore
    keys = {
      -- perform action (provide search)
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
      -- perform action (choose from treesitter positions)
      { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      -- set cursor position elsewhere (provide search) and perform action
      { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
      -- set cussor position elsewhere (provide search) and choose a label
      { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    },
  },
}
