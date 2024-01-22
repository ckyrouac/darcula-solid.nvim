local colors = require("darcula-solid/colors")

local M = {
  normal = {
    a = { bg = colors.gray2, fg = colors.fg, gui = "bold" },
    b = { bg = colors.bg_alt, fg = colors.comment },
    c = { bg = colors.bg_alt, fg = colors.red, gui = "bold" },
    x = { bg = colors.bg_alt, fg = colors.comment },
    y = { bg = colors.bg_alt, fg = colors.comment },
    z = { bg = colors.gray2, fg = colors.fg },
  },
  insert = {
    a = { bg = colors.green, fg = colors.bg, gui = "bold" },
    b = { bg = colors.bg_alt, fg = colors.comment },
    c = { bg = colors.bg_alt, fg = colors.red, gui = "bold" },
    x = { bg = colors.bg_alt, fg = colors.comment },
    y = { bg = colors.bg_alt, fg = colors.comment },
    z = { bg = colors.green, fg = colors.bg },
  },
  replace = {
    a = { bg = colors.purple, fg = colors.bg, gui = "bold" },
    b = { bg = colors.bg_alt, fg = colors.comment },
    c = { bg = colors.bg_alt, fg = colors.red, gui = "bold" },
    x = { bg = colors.bg_alt, fg = colors.comment },
    y = { bg = colors.bg_alt, fg = colors.comment },
    z = { bg = colors.purple, fg = colors.bg },
  },
  visual = {
    a = { bg = colors.yellow, fg = colors.bg, gui = "bold" },
    b = { bg = colors.bg_alt, fg = colors.comment },
    c = { bg = colors.bg_alt, fg = colors.red, gui = "bold" },
    x = { bg = colors.bg_alt, fg = colors.comment },
    y = { bg = colors.bg_alt, fg = colors.comment },
    z = { bg = colors.yellow, fg = colors.bg },
  },
  command = {
    a = { bg = colors.cyan, fg = colors.bg, gui = "bold" },
    b = { bg = colors.bg_alt, fg = colors.comment },
    c = { bg = colors.bg_alt, fg = colors.red, gui = "bold" },
    x = { bg = colors.bg_alt, fg = colors.comment },
    y = { bg = colors.bg_alt, fg = colors.comment },
    z = { bg = colors.cyan, fg = colors.bg },
  },
  inactive = {
    a = { bg = colors.gray2, fg = colors.fg, gui = "bold" },
    b = { bg = colors.bg_alt, fg = colors.comment },
    c = { bg = colors.bg_alt, fg = colors.comment },
    x = { bg = colors.bg_alt, fg = colors.comment },
    y = { bg = colors.bg_alt, fg = colors.comment },
    z = { bg = colors.gray2, fg = colors.fg },
  },
  terminal = {
    a = { bg = colors.dark_orange, fg = colors.bg, gui = "bold" },
    b = { bg = colors.bg_alt, fg = colors.comment },
    c = { bg = colors.bg_alt, fg = colors.red, gui = "bold" },
    x = { bg = colors.bg_alt, fg = colors.comment },
    y = { bg = colors.bg_alt, fg = colors.comment },
    z = { bg = colors.dark_orange, fg = colors.bg },
  },
}

return M
