local M = {}

function M.smart_quit()
  local bufnr = vim.api.nvim_get_current_buf()
  local modified = vim.api.nvim_buf_get_option(bufnr, "modified")
  if not modified then
    vim.cmd "q!"
    return
  end
  vim.ui.input(
    { prompt = "Save changes before closing? (y/n) " },
    function(input)
      if input == "y" then
        vim.cmd "wq"
      end
      if input == "n" then
        vim.cmd "q!"
      end
    end
  )
end

--[[
echo 123
321
]]
function M.send_to_tmux()
  if not os.getenv('TMUX') then
    error ("Not in a tmux session")
  end

  local function send_lines(lines)
    for _, line in ipairs(lines) do
      os.execute(
        string.format("tmux send-keys -t .2 '%s' C-m", line)
      )
    end
  end
      -- send_lines({vim.fn.mode()})
  if vim.fn.mode() == "v" then
      -- send_lines({"visual"})
    local _, ls, cs = unpack(vim.fn.getpos('v'))
    local _, le, ce = unpack(vim.fn.getpos('.'))
    local lines = vim.api.nvim_buf_get_text(0, ls-1, cs-1, le-1, ce, {})
    send_lines(lines)
    return
  end
  if vim.fn.mode() == "V" then
      -- send_lines({"visual lines"})
    local start_line = vim.fn.line("'<")
    local end_line = vim.fn.line("'>")
    -- print(start_line, end_line)
    -- send_lines({start_line .. " " .. end_line})
    local lines = vim.api.nvim_buf_get_lines(0, start_line - 1, end_line, true)
    -- local lines = vim.api.nvim_buf_get_lines(0, start_line - 1, end_line, false)
    send_lines(lines)
    return
  end

  send_lines({vim.api.nvim_get_current_line()})
end

return M
