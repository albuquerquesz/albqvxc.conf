local M = {}

local installed = false
local enabled = true

local function set_enabled(value)
  if value == nil then
    return
  end
  enabled = value and true or false
end

local function trigger_review()
  if not enabled then
    return
  end
  vim.schedule(function()
    local ok, err = pcall(function()
      require("goose.review").review()
    end)
    if not ok then
      vim.notify("[goose auto-diff] " .. err, vim.log.levels.ERROR)
    end
  end)
end

function M.setup(opts)
  set_enabled(opts and opts.enabled)
  if installed then
    return
  end

  local job = require("goose.job")
  local original_execute = job.execute

  job.execute = function(prompt, handlers)
    handlers = handlers or {}
    local user_on_exit = handlers.on_exit

    local function on_exit_wrapper(...)
      if user_on_exit then
        pcall(user_on_exit, ...)
      end
      trigger_review()
    end

    local new_handlers = {}
    for key, value in pairs(handlers) do
      new_handlers[key] = value
    end
    new_handlers.on_exit = on_exit_wrapper

    return original_execute(prompt, new_handlers)
  end

  installed = true
end

function M.enable()
  enabled = true
end

function M.disable()
  enabled = false
end

function M.toggle()
  enabled = not enabled
end

return M
