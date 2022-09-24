local fn = vim.fn
local M = {
  dump = function(...)
    print(vim.inspect(...))
  end,

  trim = function()
    vim.cmd [[%s/\s\+$//e]]
  end,

  mk_parent_dirs = function()
    local dir = fn.expand('<afile>:p:h')

    -- This handles URLs using netrw. See ':help netrw-transparent' for details.
    if dir:find('%l+://') == 1 then
      return
    end

    if fn.isdirectory(dir) == 0 then
      fn.mkdir(dir, 'p')
      vim.notify(dir, "info", { title = "Created parent directories", })
    end
  end
}

return M
