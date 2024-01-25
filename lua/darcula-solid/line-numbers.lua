local List = require("plenary.collections.py_list")
local DisableLineNumberWindowList = List({
  "NvimTree",
  "SidebarNvim",
  "GitSigns*",
  "HoverHint",
  "dapui_watches",
  "dapui_stacks",
  "dapui_breakpoints",
  "dapui_scopes",
  "dapui_console",
  "dapui_console",
  "dap-repl",
})

vim.o.signcolumn = "no"
vim.o.foldcolumn = "0"

vim.api.nvim_create_autocmd({ "BufEnter", "FocusGained", "WinEnter" }, {
  pattern = { "*" },
  callback = function()
    if DisableLineNumberWindowList:contains(vim.bo.filetype) then
      vim.o.rnu = false
      vim.o.number = false
      vim.o.signcolumn = "no"
      vim.o.foldcolumn = "0"
    else
      vim.o.number = true
      vim.o.rnu = true

      vim.o.signcolumn = "yes"
      vim.o.foldcolumn = "0"
    end
  end,
})

vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost", "WinLeave" }, {
  pattern = { "*" },
  callback = function()
    if DisableLineNumberWindowList:contains(vim.bo.filetype) then
      vim.o.rnu = false
      vim.o.number = false
      vim.o.signcolumn = "no"
      vim.o.foldcolumn = "0"
    else
      vim.o.number = false
      vim.o.rnu = false

      vim.o.signcolumn = "no"
      vim.o.foldcolumn = "6"
    end
  end,
})

-- -- Keeping this code here in case I want to show signs in inactive windows
-- -- keep the relative numbers, but hide them
-- -- so the text doesn't move when switching panes
-- local active_ns = vim.api.nvim_create_namespace('ActiveBuffer')
-- local inactive_ns = vim.api.nvim_create_namespace('InactiveBuffer')
-- vim.api.nvim_create_autocmd({"BufEnter","FocusGained","WinEnter"}, {
--   pattern = {"*"},
--   callback = function()
--     vim.api.nvim_win_set_hl_ns(0, inactive_ns)
--     vim.api.nvim_set_hl(inactive_ns, 'LineNr', {fg='#7e8387'})
--   end
-- })
--
-- vim.api.nvim_create_autocmd({"BufLeave","FocusLost","WinLeave"}, {
--   pattern = {"*"},
--   callback = function()
--     vim.api.nvim_win_set_hl_ns(0, active_ns)
--     vim.api.nvim_set_hl(active_ns, 'LineNr', {fg='#1e1f22'})
--   end
-- })
--
