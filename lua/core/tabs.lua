return {
  {
    'romgrk/barbar.nvim',
    dependencies = {
      'lewis6991/gitsigns.nvim',
      'nvim-tree/nvim-web-devicons',
    },
    init = function()
      vim.g.barbar_auto_setup = false
    end,
    lazy = false,
    opts = {
      animation = false,
      auto_hide = false,
      clickable = false,
      preset = 'powerline',
    },
    keys = {
      {
        '<A-c>',
        '<Cmd>BufferClose<CR>',
        mode = 'n',
        desc = 'Close Buffer',
      },
      {
        '<A-b>',
        '<Cmd>BufferPick<CR>',
        mode = 'n',
        desc = 'Pick Buffer',
      },
      {
        '<A-j>',
        '<Cmd>BufferPrevious<CR>',
        mode = 'n',
        desc = 'Previous Buffer',
      },
      {
        '<A-k>',
        '<Cmd>BufferNext<CR>',
        mode = 'n',
        desc = 'Next Buffer',
      },
      {
        '<A-J>',
        '<Cmd>BufferMovePrevious<CR>',
        mode = 'n',
        desc = 'Order Previous Buffer',
      },
      {
        '<A-K>',
        '<Cmd>BufferMoveNext<CR>',
        mode = 'n',
        desc = 'Order Next Buffer',
      },
      { '<A-1>', '<Cmd>BufferGoto 1<CR>', mode = 'n' },
      { '<A-2>', '<Cmd>BufferGoto 2<CR>', mode = 'n' },
      { '<A-3>', '<Cmd>BufferGoto 3<CR>', mode = 'n' },
      { '<A-4>', '<Cmd>BufferGoto 4<CR>', mode = 'n' },
      { '<A-5>', '<Cmd>BufferGoto 5<CR>', mode = 'n' },
      { '<A-6>', '<Cmd>BufferGoto 6<CR>', mode = 'n' },
      { '<A-7>', '<Cmd>BufferGoto 7<CR>', mode = 'n' },
      { '<A-8>', '<Cmd>BufferGoto 8<CR>', mode = 'n' },
      { '<A-9>', '<Cmd>BufferGoto 9<CR>', mode = 'n' },
    },
  },
}
