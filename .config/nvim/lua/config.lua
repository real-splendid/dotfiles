vim.opt.langmap = 'ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz'

vim.opt.number = true

vim.g.nvcode_termcolors = 256
vim.g.termguicolors = true
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- ===== Indent with space =====
vim.opt.expandtab = true
vim.opt.ts = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4

-- ===== Invisible chars =====
vim.opt.list = true
vim.opt.listchars:append('tab:⟶ ')
vim.opt.listchars:append('trail:•')
-- vim.opt.listchars:append('space:⋅')
-- vim.opt.listchars:append('eol:↴')

-- ===== Spell =====
vim.opt.spell = true
vim.opt.spelllang = { 'en_us', 'ru' }
vim.opt.spellsuggest = 'best,10'
vim.opt.spelloptions = 'camel'

-- pcall(vim.cmd, "colorscheme gruvbox")
-- vim.o.timeoutlen = 1000

-- vim.cmd[[colorscheme slate]]
-- vim.cmd[[colorscheme tokyonight]]
-- vim.cmd('hi Pmenu ctermfg=230 ctermbg=238 guifg=#ffffd7 guibg=#444444')
-- vim.cmd('hi PmenuSel ctermfg=232 ctermbg=192 guifg=#080808 guibg=#cae982')
-- vim.opt.foldmethod = "expr"
-- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
