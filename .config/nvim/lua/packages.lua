-- Bootstrap packer if necessary
local packer_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(packer_path)) > 0 then
  vim.fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', packer_path })
  vim.cmd('packadd packer.nvim')
end

return require('packer').startup({
  function(use)
    use 'wbthomason/packer.nvim'
    use 'mg979/vim-visual-multi'

    use { 'numToStr/Comment.nvim', config = function() require('Comment').setup() end }
    use { 'nvim-lualine/lualine.nvim', config = function() require('lualine').setup() end }
    use { 'nvim-zh/auto-save.nvim', config = function() require 'auto-save'.setup() end }
    use { 'folke/which-key.nvim', config = function() require 'which-key'.setup() end }
    use { 'lewis6991/gitsigns.nvim', config = function() require 'gitsigns'.setup() end }

    use {
      'ellisonleao/gruvbox.nvim',
      tag = '1.0.0',
      config = function()
        require("gruvbox").setup({
          overrides = { SpellBad = { link = "GruvboxAquaUnderline" } }
        })
        pcall(vim.cmd, 'colorscheme gruvbox')
      end
    }

    use {
      'nvim-telescope/telescope.nvim',
      tag = '0.1.0',
      requires = { 'nvim-lua/plenary.nvim' },
    }

    use {
      'akinsho/toggleterm.nvim',
      tag = '*',
      config = function()
        require('toggleterm').setup()
      end
    }

    use {
      'phaazon/hop.nvim',
      branch = 'v2',
      config = function() require 'hop'.setup { keys = 'etovxqpdygfblzhckisuran' } end
    }

    -- =============== Completion ===============
    use { 'hrsh7th/nvim-cmp', config = require('packages.completion') }
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-nvim-lsp-signature-help'
    use 'saadparwaiz1/cmp_luasnip'
    use {
      'L3MON4D3/LuaSnip',
      after = "nvim-cmp",
      -- requires = { 'rafamadriz/friendly-snippets' },
      config = function()
        -- require('luasnip.loaders.from_vscode').lazy_load()
        require("luasnip.loaders.from_vscode").lazy_load({ paths = { "./snippets" } })
      end
    }

    -- =============== LSP ===============
    -- use 'jose-elias-alvarez/null-ls.nvim'

    use {
      'neovim/nvim-lspconfig',
      config = function()
        require 'lspconfig'.intelephense.setup({})
      end
    }

    -- require 'lspconfig'.intelephense.setup({})
  end
})
