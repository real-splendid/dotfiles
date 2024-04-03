return {
  'mg979/vim-visual-multi',
  {
    'Exafunction/codeium.vim',
    event = 'BufEnter',
  },
  {
    'nvim-pack/nvim-spectre',
    config = function()
      require('spectre').setup()
    end,
    keys = {
      { '<leader>sp', '<CMD>lua require("spectre").open()<CR>', desc = 'Open [Sp]ectre search', noremap = true },
    },
  },
  {
    'ray-x/go.nvim',
    dependencies = { -- optional packages
      'ray-x/guihua.lua',
      'neovim/nvim-lspconfig',
      'nvim-treesitter/nvim-treesitter',
    },
    config = function()
      require('go').setup()
    end,
    keys = {
      -- { '<leader>tn', '<CMD>exe "GoTest -n" | sleep 400m | only<CR>', desc = 'Go: Test Nearest', noremap = true },
      { '<leader>tn', '<CMD>GoTest -n -v<CR>', desc = 'Go: Test Nearest', noremap = true },
      { '<leader>ts', '<CMD>GoTestSubCase<CR>', desc = 'Go: Test Subcase', noremap = true },
      { '<leader>tf', '<CMD>GoTestFunc<CR>', desc = 'Go: Test Function', noremap = true },
      { '<leader>ta', '<CMD>GoTest<CR>', desc = 'Go: Test All', noremap = true },
    },
    event = { 'CmdlineEnter' },
    ft = { 'go', 'gomod' },
    build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
  },
}
