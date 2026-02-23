-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

local absolute_number_group = vim.api.nvim_create_augroup("force_absolute_numbers", { clear = true })
vim.api.nvim_create_autocmd({ "BufEnter", "FocusGained", "WinEnter" }, {
  group = absolute_number_group,
  callback = function(event)
    local buf = event.buf
    local bt = vim.bo[buf].buftype
    if bt ~= "" and bt ~= "acwrite" then
      return
    end
    local win = vim.api.nvim_get_current_win()
    if vim.api.nvim_win_is_valid(win) then
      vim.wo[win].number = true
      vim.wo[win].relativenumber = false
    end
  end,
})
