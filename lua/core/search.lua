-- Search
return {
  {
    'ibhagwan/fzf-lua',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      local fzf = require 'fzf-lua'
      local actions = fzf.actions

      fzf.register_ui_select()

      fzf.setup {
        fzf_colors = true,
        winopts = {
          winblend = 100,
          backdrop = 100,
          width = 0.8,
          height = 0.6,
          row = 0.5,
          col = 0.5,
          border = 'rounded',
          treesitter = {
            enabled = true,
          },
          preview = {
            border = 'rounded',
            layout = 'horizontal',
            scrollbar = false,
            winopts = { number = true, cursorline = true },
          },
        },
        defaults = { header = false },
        oldfiles = {
          include_current_session = true,
          cwd_only = true,
          stat_file = true,
        },
        previewers = {
          builtin = {
            syntax_limit_b = 1024 * 100, -- 100KB
          },
        },
        files = {
          hidden = false,
          cwd_prompt = false,
          actions = {
            ['alt-i'] = { actions.toggle_ignore },
            ['alt-h'] = { actions.toggle_hidden },
            ['default'] = actions.file_edit,
            ['ctrl-s'] = actions.file_split,
            ['ctrl-v'] = actions.file_vsplit,
          },
        },
        grep = {
          rg_glob = true,
          glob_flag = '--iglob',
          glob_separator = '%s%-%-',
          actions = {
            ['alt-i'] = { actions.toggle_ignore },
            ['alt-h'] = { actions.toggle_hidden },
            ['ctrl-g'] = { actions.grep_lgrep },
            ['default'] = actions.file_edit,
            ['ctrl-s'] = actions.file_split,
            ['ctrl-v'] = actions.file_vsplit,
          },
        },
        lsp = {
          jump1 = true,
          symbols = {
            symbol_hl = function(s)
              return 'TroubleIcon' .. s
            end,
            symbol_fmt = function(s)
              return s:lower() .. '\t'
            end,
            child_prefix = false,
          },
          code_actions = {
            previewer = 'codeaction_native',
          },
        },
      }
    end,
    keys = {
      {
        '<leader>fr',
        function()
          require('fzf-lua').resume()
        end,
        desc = '[R]esume',
      },
      {
        '<leader>ff',
        function()
          require('fzf-lua').files()
        end,
        desc = '[F]iles',
      },
      {
        '<leader>fw',
        function()
          require('fzf-lua').live_grep()
        end,
        desc = '[Word]',
      },
      {
        '<leader>fW',
        function()
          require('fzf-lua').grep_project()
        end,
        desc = 'Fuzzy',
      },
      {
        '<leader>fg',
        function()
          require('fzf-lua').grep()
        end,
        desc = '[G]rep : Fuzzy',
      },
      {
        '<leader>fb',
        function()
          require('fzf-lua').buffers()
        end,
        desc = '[B]uffers',
      },
      {
        '<leader>fo',
        function()
          require('fzf-lua').oldfiles()
        end,
        desc = '[O]pened Recently',
      },
      {
        '<leader>ft',
        function()
          require('fzf-lua').treesitter()
        end,
        desc = '[T]reesitter',
      },
      {
        '<leader>fG',
        function()
          require('fzf-lua').git_stash()
        end,
        desc = '[T]reesitter',
      },
      {
        '<leader>fh',
        function()
          require('fzf-lua').builtin()
        end,
        desc = '[H]elp',
      },
      {
        '<leader>fs',
        function()
          require('fzf-lua').lsp_document_symbols()
        end,
        desc = 'Document [S]ymbols',
      },
      {
        '<leader>fS',
        function()
          vim.ui.input({ prompt = 'search symbol: ' }, function(sym)
            if not sym or sym == '' then
              return
            end
            require('fzf-lua').lsp_workspace_symbols { lsp_query = sym }
          end)
        end,
        desc = 'Workspace [S]ymbols',
      },
    },
  },
}
