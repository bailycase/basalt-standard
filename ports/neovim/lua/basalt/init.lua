local M = {}
local watcher

local function default_marker_path()
  local support = vim.env.SHEPHERD_SUPPORT_DIR
  if not support or support == "" then
    support = vim.fn.expand("~/Library/Application Support/Shepherd")
  end
  return support .. "/shepherd-active-theme"
end

local function apply(path)
  local ok, lines = pcall(vim.fn.readfile, path, "", 1)
  if not ok then
    return
  end

  local backgrounds = {
    ["basalt-dark"] = "dark",
    ["basalt-light"] = "light",
  }
  local background = backgrounds[lines[1]]
  if not background then
    return
  end

  if vim.o.background ~= background or vim.g.colors_name ~= "basalt" then
    vim.o.background = background
    vim.cmd.colorscheme("basalt")
  end
end

function M.setup(options)
  vim.o.termguicolors = true
  if vim.g.colors_name ~= "basalt" then
    vim.cmd.colorscheme("basalt")
  end

  local path = (options and options.path) or vim.g.basalt_shepherd_theme_path or default_marker_path()
  apply(path)

  if watcher then
    watcher:stop()
    watcher:close()
  end

  watcher = vim.uv.new_fs_event()
  local started = watcher:start(vim.fs.dirname(path), {}, vim.schedule_wrap(function()
    vim.defer_fn(function()
      apply(path)
    end, 50)
  end))
  if not started then
    watcher:close()
    watcher = nil
  end

  local group = vim.api.nvim_create_augroup("BasaltShepherdTheme", { clear = true })
  vim.api.nvim_create_autocmd("VimLeavePre", {
    group = group,
    once = true,
    callback = function()
      if watcher then
        watcher:stop()
        watcher:close()
        watcher = nil
      end
    end,
  })
end

return M
