local function tmux_nav(key, direction)
  local cmd = "TmuxNavigate" .. direction
  local fallback = { Left = "h", Down = "j", Up = "k", Right = "l" }
  vim.keymap.set("n", key, function()
    if vim.fn.exists(":" .. cmd) == 2 then
      vim.cmd(cmd)
    else
      vim.cmd("wincmd " .. fallback[direction])
    end
  end, { silent = true, desc = "Navigate splits/tmux " .. direction:lower() })
end

tmux_nav("<C-h>", "Left")
tmux_nav("<C-j>", "Down")
tmux_nav("<C-k>", "Up")
tmux_nav("<C-l>", "Right")
