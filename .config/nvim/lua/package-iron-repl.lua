local status_ok, iron_core = pcall(require, "iron.core")
if not status_ok then
  return
end

iron_core.setup {
  config = {
    repl_definition = {
      php = { command = {'psysh'} }
    },
    repl_open_cmd = require('iron.view').right(60),
  },
  keymaps = {
    -- send_motion = '<space>sc',
    visual_send = '<space>sc',
    send_file = '<space>sf',
    send_line = '<space>sl',
    cr = '<space>s<cr>',
    interrupt = '<space>s<space>',
    exit = '<space>sq',
    clear = '<space>cl',
  },
  highlight = { italic = true }
}
