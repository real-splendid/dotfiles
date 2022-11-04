bind = vim.api.nvim_set_keymap
opts = { noremap = true, silent = true }

-- bind('n', '<F4>', ':', {})
-- bind('n', '<c-s>', ':w<cr>', {})
-- bind('i', '<c-s>', '<Esc>:w<cr>a', {})

-- Movement with wrapped text
bind('n', 'j', 'gj', opts)
bind('n', 'k', 'gk', opts)

bind('n', '<c-j>', '<c-w>j', opts)
bind('n', '<c-h>', '<c-w>h', opts)
bind('n', '<c-k>', '<c-w>k', opts)
bind('n', '<c-l>', '<c-w>l', opts)

bind('i', 'jj', '<Esc>', opts)

bind('n', '<Leader>f', '<cmd>vim.lsp.buf.formatting()<cr>', opts)
bind('n', '<Leader>ca', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)

bind('n', '<Leader>q', '<cmd>lua require "utils".smart_quit()<cr>', opts)

if pcall(require, 'telescope') then
  bind('n', '<F1>', '<cmd>Telescope commands<cr>', opts)
  bind('n', '<F3>', '<cmd>Telescope find_files<cr>', opts)
end

if pcall(require, 'hop') then
  bind('n', '<Leader><Leader>', '<cmd>HopChar1<cr>', opts)
end

if pcall(require, 'toggleterm') then
  bind('v', 'tt', '<cmd>ToggleTermSendVisualLines<cr>', opts)
  bind('n', 'tt', '<cmd>ToggleTermSendCurrentLine<cr>', opts)
  bind('t', '<esc>', [[<C-\><C-n>]], opts)
  bind('t', 'jj', [[<C-\><C-n>]], opts)
  bind('t', '<C-h>', [[<C-\><C-n><C-W>h]], opts)
  bind('t', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
  bind('t', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
  bind('t', '<C-l>', [[<C-\><C-n><C-W>l]], opts)
end

if pcall(require, 'luasnip') then
  bind('i', '<c-j>', '<cmd>lua require "luasnip".jump(1)<cr>', opts)
  bind('i', '<c-k>', '<cmd>lua require "luasnip".jump(-1)<cr>', opts)
end
