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
123
456
789
000
]]
function M.send_to_tmux(target)
  if not os.getenv('TMUX') then
    error ("Not in a tmux session")
  end

  local function send_lines(lines)
    for _, line in ipairs(lines) do
      os.execute(string.format(
        "tmux send-keys -t %s '%s' C-m",
        target,
        line
      ))
    end
  end

  if vim.fn.mode() == "v" then
    local ls, cs = unpack(vim.fn.getpos('v'), 2, 3)
    local le, ce = unpack(vim.fn.getpos('.'), 2, 3)
    local lines = vim.api.nvim_buf_get_text(0, ls-1, cs-1, le-1, ce, {})
    send_lines(lines)
    return
  end
  if vim.fn.mode() == "V" then
    -- vim.api.nvim_input("<Esc>")
    local start_line = vim.fn.line("v")
    local end_line = unpack(vim.fn.getcurpos(), 2)
    -- send_lines({"\"" .. start_line .. " " .. end_line .. "\""})
    send_lines({"\"" .. vim.v.lnum .. " " .. vim.fn.line("v") .. "\""})
    local lines = vim.api.nvim_buf_get_lines(0, start_line - 1, end_line, true)
    send_lines(lines)
    return
  end

  send_lines({vim.api.nvim_get_current_line()})
end

return M
