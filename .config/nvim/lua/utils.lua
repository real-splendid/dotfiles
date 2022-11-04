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

return M
