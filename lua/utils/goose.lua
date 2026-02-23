local M = {}

local STEP = 0.05
local MIN_WIDTH = 0.2
local MAX_WIDTH = 0.8

local function clamp(value)
  return math.max(MIN_WIDTH, math.min(MAX_WIDTH, value))
end

local function set_width(width)
  local cfg = require("goose.config")
  local new_width = clamp(width)
  cfg.setup({ ui = { window_width = new_width } })

  local windows = require("goose.state").windows
  if windows then
    require("goose.ui.window_config").configure_window_dimensions(windows)
  end
end

function M.adjust_width(delta)
  local ui = require("goose.config").get("ui") or {}
  local current = ui.window_width or 0.35
  set_width(current + (delta or 0))
end

function M.increase_width(step)
  M.adjust_width(step or STEP)
end

function M.decrease_width(step)
  M.adjust_width(-1 * (step or STEP))
end

return M
