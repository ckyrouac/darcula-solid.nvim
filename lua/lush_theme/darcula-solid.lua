-- darcula-solid/init.lua
-- Mantainer: Briones Dos Santos Gabriel <@briones-gabriel>
-- last update: 2021-05-16
--
-- Built with,
--
--        ,gggg,
--       d8" "8I                         ,dPYb,
--       88  ,dP                         IP'`Yb
--    8888888P"                          I8  8I
--       88                              I8  8'
--       88        gg      gg    ,g,     I8 dPgg,
--  ,aa,_88        I8      8I   ,8'8,    I8dP" "8I
-- dP" "88P        I8,    ,8I  ,8'  Yb   I8P    I8
-- Yb,_,d88b,,_   ,d8b,  ,d8b,,8'_   8) ,d8     I8,
--  "Y8P"  "Y888888P'"Y88P"`Y8P' "YY8P8P88P     `Y8

local lush = require 'lush'

--------------------------------------------------

vim.o.fillchars='eob: '

-- GUI options
local bf, it, un = 'bold', 'italic', 'underline'

-- Set base colors
local bg      = '#1e1f22'
local overbg  = '#282829'
local subtle  = '#2a2a2b'

local fg      = '#c3cad1'
local comment = '#7A7E85'
local folder  = '#848c91'
local mid     = '#2f2f30'
local faded   = '#7e8387'
local pop     = '#c6c6c9'

-- Color palette
local red     = '#F75464'
local salmon  = '#FA6675'
local orange  = '#CF8E6D'
local dark_orange = '#CC7832'
-- local yellow  = '#D5B778'
local yellow = '#AFBF7E' -- this is the actual yellow in goland, it's too green
local gold    = '#B09D79'

local green   = '#6AAB73'
local teal    = '#293C40'
local cyan    = '#6FAFBD'

local blue    = '#56A8F5'
local purple  = '#B189F5'
local magenta = '#C77DBB'

-- my colors
local dark_magenta = '#402f33'
local gray2 = '#373b39'
local gray3 = '#2b2d30'

-- local bufferline_tab_inactive_bg = '#222326'
local bufferline_tab_inactive_bg = bg
local bufferline_tab_active = bufferline_tab_inactive_bg

-- Window focus/unfocus actions
local function set_nvim_tree_highlight()
  vim.cmd[[au FileType TelescopePrompt* setlocal nocursorline]]

  vim.api.nvim_create_autocmd({"BufEnter","FocusGained","WinEnter"}, {
    pattern = {"*"},
    callback = function()
      vim.o.cursorline = true
    end
  })

  vim.api.nvim_create_autocmd({"BufLeave","FocusLost","WinLeave"}, {
    pattern = {"*"},
    callback = function()
      vim.o.cursorline = false
    end
  })
end
set_nvim_tree_highlight()

-- Line number config
local List=require('plenary.collections.py_list');
local DisableLineNumberWindowList = List {"NvimTree", "SidebarNvim", "GitSigns*", "HoverHint"};


vim.o.signcolumn = 'no'
vim.o.foldcolumn = '0'

vim.api.nvim_create_autocmd({"BufEnter","FocusGained","WinEnter"}, {
  pattern = {"*"},
  callback = function()
    if DisableLineNumberWindowList:contains(vim.bo.filetype) then
      vim.o.rnu = false
      vim.o.number = false
      vim.o.signcolumn = 'no'
      vim.o.foldcolumn = '0'
    else
      vim.o.number = true
      vim.o.rnu = true

      vim.o.signcolumn = 'yes'
      vim.o.foldcolumn = '0'
    end
  end
})

vim.api.nvim_create_autocmd({"BufLeave","FocusLost","WinLeave"}, {
  pattern = {"*"},
  callback = function()
    if DisableLineNumberWindowList:contains(vim.bo.filetype) then
      vim.o.rnu = false
      vim.o.number = false
      vim.o.signcolumn = 'no'
      vim.o.foldcolumn = '0'
    else
      vim.o.number = false
      vim.o.rnu = false

      vim.o.signcolumn = 'no'
      vim.o.foldcolumn = '6'
    end
  end
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

local signs = { Error = "󰅚", Warn = "󰀪", Hint = "💡", Info = "" }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl })
end

return lush(function(injected_functions)
local sym = injected_functions.sym
return {
sym "Normal"       { fg='#c3cad1',      bg=bg };
sym "NormalFloat" { fg=fg,      bg=bg };
sym "NormalNC" { fg=fg,      bg=bg }; -- normal text in non-current windows

sym "Comment" { fg=comment,  gui=it };
sym "Whitespace" { fg=mid };                  -- 'listchars'
sym "Conceal" { fg='#404040' };
sym "NonText" { fg=bg };              -- characters that don't exist in the text
-- sym "SpecialKey" { Whitespace };              -- Unprintable characters: text displayed differently from what it really is


sym "Cursor" { fg=bg,      bg=fg };
sym "TermCursor" { fg=bg,      bg=fg };
sym "ColorColumn" { bg=overbg };
sym "CursorColumn" { bg=subtle };
sym "CursorLine" { bg='#26282e' };
sym "MatchParen" { fg=pop, bg='#43454a' };

sym "LineNr" { fg=faded };
sym "CursorLineNr" { fg=fg };
sym "SignColumn" { LineNr };
sym "VertSplit" { fg=gray3,  bg=bg };    -- column separating vertically split windows
sym "Folded" { fg=comment, bg=overbg };
sym "FoldColumn" { LineNr };

sym "Pmenu" { bg=overbg };                -- Popup menu normal item
sym "PmenuSel" { bg=mid };                   -- selected item
sym "PmenuSbar" { Pmenu };                    -- scrollbar
sym "PmenuThumb" { PmenuSel };                 -- Thumb of the scrollbar
sym "WildMenu" { Pmenu };                    -- current match in 'wildmenu' completion
sym "QuickFixLine" { fg=pop };                   -- Current |quickfix| item in the quickfix window

sym "StatusLine" { bg=bg, fg=bg };
sym "StatusLineNC" { fg=faded,   bg=bg };

sym "TabLine" { bg=mid };                   -- not active tab page label
sym "TabLineFill" { bg=overbg };                -- where there are no labels
sym "TabLineSel" { bg=faded };                 -- active tab page label

sym "Search" { fg=fg, bg=gray2 };      -- Last search pattern highlighting (see 'hlsearch')
sym "CurSearch" { fg=fg, bg=dark_magenta };

sym "IncSearch" { Search };                   -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
sym "Substitute" { Search };                   -- |:substitute| replacement text highlighting

sym "Visual" { bg='#214283' };                    -- Visual mode selection
sym "VisualNOS" { bg=subtle };                -- Visual mode selection when Vim is "Not Owning the Selection".

sym "ModeMsg" { fg=faded };                 -- 'showmode' message (e.g. "-- INSERT -- ")
sym "MsgArea" { Normal };                   -- Area for messages and cmdline
sym "MsgSeparator" { fg=orange };                -- Separator for scrolled messages `msgsep` flag of 'display'
sym "MoreMsg" { fg=green };                 -- |more-prompt|
sym "Question" { fg=green };                 -- |hit-enter| prompt and yes/no questions
sym "ErrorMsg" { fg=red };                   -- error messages on the command line
sym "WarningMsg" { fg=red };                   -- warning messages

sym "Directory" { fg=blue };                  -- directory names (and other special names in listings)
sym "Title" { fg=blue };                  -- titles for output from ":set all" ":autocmd" etc.

sym "DiffAdd" { fg='#606b4f' };
sym "DiffDelete" { fg=red };
sym "DiffChange" { fg='#915a00' };
sym "DiffText" { DiffChange, gui=un };
sym "DiffAdded" { DiffAdd };
sym "DiffRemoved" { DiffDelete };

sym "SpellBad" { fg=red,     gui=un };
sym "SpellCap" { fg=magenta, gui=un };
sym "SpellLocal" { fg=orange,  gui=un };
sym "SpellRare" { fg=yellow,  gui=un };



---- Language Server Protocol highlight groups ---------------------------------

sym "LspReferenceText" { bg=mid };    -- highlighting "text" references
sym "LspReferenceRead" { bg=mid };    -- highlighting "read" references
sym "LspReferenceWrite" { bg=mid };    -- highlighting "write" references

-- base highlight groups. Other LspDiagnostic highlights link to these by default (except Underline)
sym "LspDiagnosticsDefaultError" { fg=red };
sym "LspDiagnosticsDefaultWarning" { fg=yellow };
sym "LspDiagnosticsDefaultInformation" { fg=fg };
sym "LspDiagnosticsDefaultHint" { fg=teal };

--LspDiagnosticsVirtualTextError       { };    -- "Error" diagnostic virtual text
--LspDiagnosticsVirtualTextWarning     { };    -- "Warning" diagnostic virtual text
--LspDiagnosticsVirtualTextInformation { };    -- "Information" diagnostic virtual text
--LspDiagnosticsVirtualTextHint        { };    -- "Hint" diagnostic virtual text
sym "LspDiagnosticsUnderlineError" { gui=un };    -- underline "Error" diagnostics
sym "LspDiagnosticsUnderlineWarning" { gui=un };    -- underline "Warning" diagnostics
sym "LspDiagnosticsUnderlineInformation" { gui=un };    -- underline "Information" diagnostics
sym "LspDiagnosticsUnderlineHint" { gui=un };    -- underline "Hint" diagnostics
--LspDiagnosticsFloatingError          { };    -- color "Error" diagnostic messages in diagnostics float
--LspDiagnosticsFloatingWarning        { };    -- color "Warning" diagnostic messages in diagnostics float
--LspDiagnosticsFloatingInformation    { };    -- color "Information" diagnostic messages in diagnostics float
--LspDiagnosticsFloatingHint           { };    -- color "Hint" diagnostic messages in diagnostics float
--LspDiagnosticsSignError              { };    -- "Error" signs in sign column
--LspDiagnosticsSignWarning            { };    -- "Warning" signs in sign column
--LspDiagnosticsSignInformation        { };    -- "Information" signs in sign column
--LspDiagnosticsSignHint               { };    -- "Hint" signs in sign column



---- Standard highlight groups -------------------------------------------------
-- See :help group-name

sym "Constant" { fg=orange };
sym "Number" { fg=blue };
sym "Float" { Number };
sym "Boolean" { Constant };
sym "Character" { fg=orange };
sym "String" { fg=green };

sym "Identifier" { fg=fg };
sym "Function" { fg=fg };

sym "Statement" { fg=orange }; -- (preferred) any statement
sym "Conditional" { Statement };
sym "Repeat" { Statement };
sym "Label" { Statement };       -- case, default, etc.
sym "Operator" { fg=fg };
sym "Keyword" { Statement };    -- any other keyword
sym "Exception" { fg=red };

sym "PreProc" { fg=orange };    --  generic Preprocessor
sym "Include" { PreProc };    -- preprocessor #include
sym "Define" { PreProc };    -- preprocessor #define
sym "Macro" { PreProc };    -- same as Define
sym "PreCondit" { PreProc };    -- preprocessor #if, #else, #endif, etc.

sym "Type" { fg=fg };
sym "StorageClass" { fg=magenta };    -- static, register, volatile, etc.
sym "Structure" { fg=magenta };    -- struct, union, enum, etc.
sym "Typedef" { Type };

sym "Special" { fg=orange };  -- (preferred) any special symbol
sym "SpecialChar" { Special };    -- special character in a constant
sym "Tag" { fg=yellow };  -- you can use CTRL-] on this
sym "Delimiter" { Special };    -- character that needs attention
sym "SpecialComment" { Special };    -- special things inside a comment
sym "Debug" { Special };    -- debugging statements

sym "Underlined" { gui = un };
sym "Bold" { gui = bf };
sym "Italic" { gui = it };
sym "Ignore" { fg=faded };           --  left blank, hidden  |hl-Ignore|
sym "Error" { fg=red };             --  any erroneous construct
sym "Todo" { gui=bf };  --  anything that needs extra attention



---- TREESITTER ----------------------------------------------------------------

sym "@constant"                 { Constant };
sym "@constant.builtin"         { Constant,   gui=it };    -- constant that are built in the language: `nil` in Lua.
sym "@constant.macro"           { Constant,   gui=bf };    -- constants that are defined by macros: `NULL` in C.
sym "@number"                   { Number };
sym "@float"                    { Float };
sym "@boolean"                  { Boolean };
sym "@character"                { Character };
sym "@string"                   { String };
sym "@string.regex"             { Character };
sym "@string.escape"            { Character };             -- escape characters within a string
sym "@symbol"                   { fg=green, gui=it };      -- For identifiers referring to symbols or atoms.

sym "@field"                    { fg=purple };
sym "@property"                 { fg=purple };
sym "@parameter"                { fg=fg };
sym "@parameter.reference"      { fg=fg };
sym "@variable"                 { fg=fg };                 -- Any variable name that does not have another highlight
sym "@variable.builtin"         { Constant,      gui=it }; -- Variable names that are defined by the languages like `this` or `self`.

sym "@function"                 { Function };
sym "@function.builtin"         { Function };
sym "@function.macro"           { Function };              -- macro defined fuctions: each `macro_rules` in Rust
sym "@method"                   { Function };
sym "@constructor"              { fg=fg };                 -- For constructor: `{}` in Lua and Java constructors.
sym "@keyword.function"         { Keyword };

sym "@keyword"                  { Keyword };
sym "@conditional"              { Conditional };
sym "@repeat"                   { Repeat };
sym "@label"                    { Label };
sym "@operator"                 { Operator };
sym "@exception"                { Exception };

sym "@namespace"                { PreProc };               -- identifiers referring to modules and namespaces.
sym "@annotation"               { PreProc };               -- C++/Dart attributes annotations that can be attached to the code to denote some kind of meta information
sym "@attribute"                { PreProc };               -- Unstable
sym "@include"                  { PreProc };               -- includes: `#include` in C `use` or `extern crate` in Rust or `require` in Lua.

sym "@type"                     { Type };
sym "@type.builtin"             { Type,     gui=it };

sym "@punctuation.delimiter"    { Delimiter };             -- delimiters ie: `.`
sym "@punctuation.bracket"      { fg=fg };                 -- brackets and parens.
sym "@punctuation.special"      { Delimiter };             -- special punctutation that does not fall in the catagories before.

sym "@comment"                  { Comment };
sym "@tag"                      { Tag };                   -- Tags like html tag names.
sym "@tag.delimiter"            { Special };               -- Tag delimiter like < > /
sym "@text"                     { fg=fg };
sym "@text.emphasis"            { fg=fg,     gui=it };
sym "@text.underline"           { fg=fg,     gui=un };
sym "@text.strike"              { Comment,   gui=un };
sym "@text.strong"              { fg=fg,     gui=bf };
sym "@text.title"               { fg=orange };             -- Text that is part of a title
sym "@text.literal"             { String };                -- Literal text
sym "@text.uri"                 { fg=green, gui=it };      -- Any URI like a link or email

sym "@error"                    { fg=red };                -- syntax/parser errors.

-- Other stuff
HelpHyperTextJump {fg=yellow};
markdownLinkText {fg=fg};

-- go
sym "@namespace.go" { fg=yellow };
sym "@property.go" { fg=fg };
sym "@field.go" { fg=fg };
sym "@type.go" { fg=cyan };
sym "@type.builtin.go" { fg=dark_orange };
sym "@method.call.go" { fg=gold };
sym "@lsp.type.function.go" { fg=gold };
sym "@comment.go" { fg=comment };
sym "@punctuation.delimiter.go" { fg=fg };
sym "@method.go" { fg=blue };
sym "@lsp.type.namespace.go" { fg = yellow };
sym "@lsp.type.type.go" { fg = blue };
sym "@lsp.mod.defaultLibrary.go" { fg = dark_orange };
sym "@lsp.mod.readonly.go" { fg = purple, gui=it };
sym "@lsp.typemod.variable.defaultLibrary.go" { fg = dark_orange };

-- bash
sym "@function.call" { fg = dark_orange };
sym "@function.builtin.bash" { fg = dark_orange };
sym "@constant.bash" { fg = fg };
sym "@function.bash" { fg = blue };
sym "@punctuation.bracket.bash" { fg = orange };
sym "@punctuation.special.bash" { fg = fg };
sym "@number.bash" { fg = blue };
sym "@comment.bash" { fg=comment };

-- javascript
-- python
-- rust
-- java

-- NvimTree
sym "NvimTreeNormal"       { bg=bg, fg=fg };
sym "NvimTreeIndentMarker" { fg='#4f5152' };
sym "NvimTreeRootFolder"   { fg=folder };
sym "NvimTreeFolderIcon"   { fg=folder };
sym "NvimTreeFolderName"   { fg=fg };
sym "NvimTreeOpenedFolderName"   { fg=fg };
sym "NvimTreeCursorLine"   { bg='#2e436e' };

-- Sidebar
sym "SidebarNvimNormal" {guibg=bg, fg=fg, ctermbg=nil};
sym "SidebarNvimNormalBG" {bg=bg, fg=fg};
sym "SidebarNvimNormalNC" {bg=bg};
sym "SidebarNvimNormalFloat" {bg=bg};
sym "SidebarNvimEndOfBuffer" {bg=bg};
sym "SidebarNvimCursorLine" {bg='#2e436e', ctermbg=nil};
sym "SidebarNvimCursorLineNr" {bg=bg};
sym "SidebarNvimWinSeparator" {bg=bg};
sym "SidebarNvimStatusLine" {bg=bg, fg=bg};
sym "SidebarNvimStatuslineNC" {bg=bg, fg=faded};

-- sym "SidebarNvimStatuslineNC" { bg=bg, fg=bg };
-- sym "SidebarNvimStatuslineNC" { fg=faded,   bg=bg };
sym "SidebarNvimSignColumn" {bg=bg};

-- GitSigns
sym "GitSignsAdd" {fg=green};
sym "GitSignsChange" {fg=blue};
sym "GitSignsDelete" {fg=red};
sym "GitSignsUntracked" {fg=yellow};

-- bufferline
 -- for some reason the background needs to be set in the bufferline config
-- sym "BufferLineBackground" { bg=bufferline_tab_inactive_bg };sym "BufferLineTab" { bg=bufferline_tab_inactive_bg };
sym "BufferLineFill" { bg=bg };
sym "BufferLineCloseButtonVisible" { bg=bufferline_tab_inactive_bg };
sym "BufferLineBufferVisible" { bg=bufferline_tab_inactive_bg };
sym "BufferLineBuffer" { bg=bufferline_tab_inactive_bg };
sym "BufferLineNumbersVisible" { bg=bufferline_tab_inactive_bg };
sym "BufferLineNumbers" { bg=bufferline_tab_inactive_bg };
sym "BufferLineDiagnostic" { bg=bufferline_tab_inactive_bg };
sym "BufferLineDiagnosticVisible" { bg=bufferline_tab_inactive_bg };
sym "BufferLineHintDiagnosticVisible" { bg=bufferline_tab_inactive_bg };
sym "BufferLineHintDiagnostic" { bg=bufferline_tab_inactive_bg };
sym "BufferLineHintVisible" { bg=bufferline_tab_inactive_bg };
sym "BufferLineHint" { bg=bufferline_tab_inactive_bg };
sym "BufferLineInfoVisible" { bg=bufferline_tab_inactive_bg };
sym "BufferLineInfo" { bg=bufferline_tab_inactive_bg };
sym "BufferLineInfoDiagnosticVisible" { bg=bufferline_tab_inactive_bg };
sym "BufferLineInfoDiagnostic" { bg=bufferline_tab_inactive_bg };
sym "BufferLineWarningDiagnosticVisible" { bg=bufferline_tab_inactive_bg };
sym "BufferLineWarningDiagnostic" { bg=bufferline_tab_inactive_bg };
sym "BufferLineWarning" { bg=bufferline_tab_inactive_bg };
sym "BufferLineWarningVisible" { bg=bufferline_tab_inactive_bg };
sym "BufferLineErrorDiagnosticVisible" { bg=bufferline_tab_inactive_bg };
sym "BufferLineErrorDiagnostic" { bg=bufferline_tab_inactive_bg };
sym "BufferLineError" { bg=bufferline_tab_inactive_bg };
sym "BufferLineErrorVisible" { bg=bufferline_tab_inactive_bg };
sym "BufferLineModifiedVisible" { bg=bufferline_tab_inactive_bg };
sym "BufferLineDuplicate" { bg=bufferline_tab_inactive_bg, fg=comment };
sym "BufferLineDuplicateVisible" { bg=bufferline_tab_inactive_bg, fg=comment };
sym "BufferLineDuplicateSelected" { bg=bufferline_tab_inactive_bg, fg=fg };
sym "BufferLineSeparator" { bg=bufferline_tab_inactive_bg, fg=bufferline_tab_inactive_bg };
sym "BufferLineSeparatorVisible" { bg=bufferline_tab_inactive_bg };
sym "BufferLineIndicatorVisible" { bg=bufferline_tab_inactive_bg, fg=bufferline_tab_inactive_bg };
sym "BufferLineIndicatorSelected" { bg=bufferline_tab_inactive_bg, fg=bufferline_tab_inactive_bg };
sym "BufferLinePick" { bg=bufferline_tab_inactive_bg };
sym "BufferLinePickVisible" { bg=bufferline_tab_inactive_bg };
sym "BufferLineOffsetSeparator" { bg=bufferline_tab_inactive_bg };
sym "BufferLineTruncMarker" { bg=bufferline_tab_inactive_bg };
sym "BufferLineTabSeparator" { bg=bufferline_tab_inactive_bg };
sym "BufferLineTabClose" { bg=bufferline_tab_inactive_bg };
sym "BufferLineCloseButton" { bg=bufferline_tab_inactive_bg, fg=comment };
sym "BufferLineCloseButtonSelected" { bg=bufferline_tab_inactive_bg, fg=fg };
sym "BufferLineModified" { bg=bufferline_tab_inactive_bg };
sym "BufferLineDevIconDefaultSelected" { bg=bufferline_tab_inactive_bg };
sym "BufferLineDevIconDefaultInactive" { bg=bufferline_tab_inactive_bg };
sym "BufferLineLineGroupSeparator" { bg=bufferline_tab_inactive_bg };

-- Lua
sym "@lsp.type.function.lua" {fg=fg};

-- Telescope
sym "TelescopePromptNormal" {fg=fg, bg=bg};
sym "TelescopePreviewMatch" {fg=fg, bg=bg};
sym "TelescopeBorder" {fg=faded, bg=bg};
sym "TelescopePromptCounter" {bg=bg, fg=gold};
sym "TelescopeResultsBorder" {fg=blue, bg=bg};
sym "TelescopePromptPrefix" {fg=blue, bg=bg};
}end)
