return {
  {
    'lervag/vimtex',
    lazy = false,
    init = function()
      vim.g.vimtex_view_method = 'zathura'
      vim.g.vimtex_mappings_enabled = 0
    end,
  },
  -- {
  --   'ray-x/lsp_signature.nvim',
  --   event = 'BufRead',
  --   config = function()
  --     require('lsp_signature').setup()
  --   end,
  -- },
}
