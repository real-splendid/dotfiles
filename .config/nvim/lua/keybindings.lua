bind = vim.api.nvim_set_keymap
opts = { noremap = true, silent = true }

-- bind('n', '<F4>', ':', {})
bind('n', '<c-s>', ':w<CR>', {})
bind('i', '<c-s>', '<Esc>:w<CR>a', {})

bind('n', '<Leader>w', ':write<CR>', opts)
bind('n', '<Leader>q', ':quit<CR>', opts)

bind('n', '<c-j>', '<c-w>j', opts)
bind('n', '<c-h>', '<c-w>h', opts)
bind('n', '<c-k>', '<c-w>k', opts)
bind('n', '<c-l>', '<c-w>l', opts)

bind('i', 'jj', '<Esc>', opts)

bind('n', '<Leader>f', '<cmd>vim.lsp.buf.formatting()<cr>', opts)
bind('n', '<Leader>ca', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)

if pcall(require, "telescope") then
  bind('n', '<F1>', '<cmd>Telescope commands<cr>', opts)
  bind('n', '<F3>', '<cmd>Telescope find_files<cr>', opts)
end

if pcall(require, "hop") then
  bind('n', '<Leader><Leader>', '<cmd>HopChar1<CR>', opts)
end
