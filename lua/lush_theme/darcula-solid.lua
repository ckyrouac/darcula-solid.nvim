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

-- GUI options
local bf, it, un = 'bold', 'italic', 'underline'

-- Base colors
local c0 = '#1d1e21'
local c1 = '#282829'
local c2 = '#2a2a2b'
local c3 = '#323233'
local c4 = '#373738'
local c5 = '#414142'
local c6 = '#6e6e70'
local c7 = '#c6c6c9'

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

-- Set NvimTree current line highlight when focused
local function set_nvim_tree_highlight()
  vim.api.nvim_create_autocmd({"BufEnter","FocusGained","WinEnter"}, {
    pattern = {"*NvimTree*"},
    callback = function()
      vim.cmd [[ hi! NvimTreeCursorLine guibg=#2e436e ]]
    end
  })

  vim.api.nvim_create_autocmd({"BufLeave","FocusLost","WinLeave"}, {
    pattern = {"*NvimTree*"},
    callback = function()
      vim.cmd [[ hi! NvimTreeCursorLine guibg=#43454a ]]
    end
  })
end
set_nvim_tree_highlight()

-- Set SidebarNvim current line highlight when focused
local function set_sidebar_highlight()
  vim.api.nvim_create_autocmd({"BufEnter","FocusGained","WinEnter"}, {
    pattern = {"*SidebarNvim*"},
    callback = function()
      vim.cmd [[ hi! SidebarNvimCursorLine guibg=#2e436e ]]
    end
  })

  vim.api.nvim_create_autocmd({"BufLeave","FocusLost","WinLeave"}, {
    pattern = {"*SidebarNvim*"},
    callback = function()
      vim.cmd [[ hi! SidebarNvimCursorLine guibg=#43454a ]]
    end
  })
end
set_sidebar_highlight()

return lush(function(injected_functions)
local sym = injected_functions.sym
return {
Normal       { fg='#c3cad1',      bg=bg };
NormalFloat  { fg=fg,      bg=overbg };
NormalNC     { fg=fg,      bg=bg }; -- normal text in non-current windows

Comment      { fg=comment,  gui=it };
Whitespace   { fg=mid };                  -- 'listchars'
Conceal      { fg='#404040' };
NonText      { fg=gray3 };              -- characters that don't exist in the text
SpecialKey   { Whitespace };              -- Unprintable characters: text displayed differently from what it really is


Cursor       { fg=bg,      bg=fg };
TermCursor   { fg=bg,      bg=fg };
ColorColumn  { bg=overbg };
CursorColumn { bg=subtle };
CursorLine   { bg='#26282e' };
MatchParen   { fg=pop, bg='#43454a' };

LineNr       { fg=faded };
CursorLineNr { fg=fg };
SignColumn   { LineNr };
VertSplit    { fg=overbg,  bg=bg };    -- column separating vertically split windows
Folded       { fg=comment, bg=overbg };
FoldColumn   { LineNr };

Pmenu        { bg=overbg };                -- Popup menu normal item
PmenuSel     { bg=mid };                   -- selected item
PmenuSbar    { Pmenu };                    -- scrollbar
PmenuThumb   { PmenuSel };                 -- Thumb of the scrollbar
WildMenu     { Pmenu };                    -- current match in 'wildmenu' completion
QuickFixLine { fg=pop };                   -- Current |quickfix| item in the quickfix window

StatusLine   { bg=subtle };
StatusLineNC { fg=faded,   bg=overbg };

TabLine      { bg=mid };                   -- not active tab page label
TabLineFill  { bg=overbg };                -- where there are no labels
TabLineSel   { bg=faded };                 -- active tab page label

Search       { fg=fg, bg=gray2 };      -- Last search pattern highlighting (see 'hlsearch')
CurSearch    { fg=fg, bg=dark_magenta };

IncSearch    { Search };                   -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
Substitute   { Search };                   -- |:substitute| replacement text highlighting

Visual       { bg='#214283' };                    -- Visual mode selection
VisualNOS    { bg=subtle };                -- Visual mode selection when Vim is "Not Owning the Selection".

ModeMsg      { fg=faded };                 -- 'showmode' message (e.g. "-- INSERT -- ")
MsgArea      { Normal };                   -- Area for messages and cmdline
MsgSeparator { fg=orange };                -- Separator for scrolled messages `msgsep` flag of 'display'
MoreMsg      { fg=green };                 -- |more-prompt|
Question     { fg=green };                 -- |hit-enter| prompt and yes/no questions
ErrorMsg     { fg=red };                   -- error messages on the command line
WarningMsg   { fg=red };                   -- warning messages

Directory    { fg=blue };                  -- directory names (and other special names in listings)
Title        { fg=blue };                  -- titles for output from ":set all" ":autocmd" etc.

DiffAdd      { fg='#606b4f' };
DiffDelete   { fg=red };
DiffChange   { fg='#915a00' };
DiffText     { DiffChange, gui=un };
DiffAdded    { DiffAdd };
DiffRemoved  { DiffDelete };

SpellBad     { fg=red,     gui=un };
SpellCap     { fg=magenta, gui=un };
SpellLocal   { fg=orange,  gui=un };
SpellRare    { fg=yellow,  gui=un };



---- Language Server Protocol highlight groups ---------------------------------

LspReferenceText                  { bg=mid };    -- highlighting "text" references
LspReferenceRead                  { bg=mid };    -- highlighting "read" references
LspReferenceWrite                 { bg=mid };    -- highlighting "write" references

-- base highlight groups. Other LspDiagnostic highlights link to these by default (except Underline)
LspDiagnosticsDefaultError           { fg=red };
LspDiagnosticsDefaultWarning         { fg=yellow };
LspDiagnosticsDefaultInformation     { fg=fg };
LspDiagnosticsDefaultHint            { fg=teal };

--LspDiagnosticsVirtualTextError       { };    -- "Error" diagnostic virtual text
--LspDiagnosticsVirtualTextWarning     { };    -- "Warning" diagnostic virtual text
--LspDiagnosticsVirtualTextInformation { };    -- "Information" diagnostic virtual text
--LspDiagnosticsVirtualTextHint        { };    -- "Hint" diagnostic virtual text
LspDiagnosticsUnderlineError         { gui=un };    -- underline "Error" diagnostics
LspDiagnosticsUnderlineWarning       { gui=un };    -- underline "Warning" diagnostics
LspDiagnosticsUnderlineInformation   { gui=un };    -- underline "Information" diagnostics
LspDiagnosticsUnderlineHint          { gui=un };    -- underline "Hint" diagnostics
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

Constant       { fg=orange };
Number         { fg=blue };
Float          { Number };
Boolean        { Constant };
Character      { fg=orange };
String         { fg=green };

Identifier     { fg=fg };
Function       { fg=fg };

Statement      { fg=orange }; -- (preferred) any statement
Conditional    { Statement };
Repeat         { Statement };
Label          { Statement };       -- case, default, etc.
Operator       { fg=fg };
Keyword        { Statement };    -- any other keyword
Exception      { fg=red };

PreProc        { fg=orange };    --  generic Preprocessor
Include        { PreProc };    -- preprocessor #include
Define         { PreProc };    -- preprocessor #define
Macro          { PreProc };    -- same as Define
PreCondit      { PreProc };    -- preprocessor #if, #else, #endif, etc.

Type           { fg=fg };
StorageClass   { fg=magenta };    -- static, register, volatile, etc.
Structure      { fg=magenta };    -- struct, union, enum, etc.
Typedef        { Type };

Special        { fg=orange };  -- (preferred) any special symbol
SpecialChar    { Special };    -- special character in a constant
Tag            { fg=yellow };  -- you can use CTRL-] on this
Delimiter      { Special };    -- character that needs attention
SpecialComment { Special };    -- special things inside a comment
Debug          { Special };    -- debugging statements

Underlined { gui = un };
Bold       { gui = bf };
Italic     { gui = it };
Ignore     { fg=faded };           --  left blank, hidden  |hl-Ignore|
Error      { fg=red };             --  any erroneous construct
Todo       { gui=bf };  --  anything that needs extra attention



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
sym "NvimTreeNormal"       { bg=gray3, fg=fg };
sym "NvimTreeIndentMarker" { fg='#4f5152' };
sym "NvimTreeRootFolder"   { fg=folder };
sym "NvimTreeFolderIcon"   { fg=folder };
sym "NvimTreeFolderName"   { fg=fg };
sym "NvimTreeOpenedFolderName"   { fg=fg };

-- Sidebar
sym "SidebarNvimNormal" {guibg=gray3, fg=fg};
sym "SidebarNvimNormalBG" {guibg=gray3, fg=fg};
sym "SidebarNvimNormalNC" {bg=gray3};
sym "SidebarNvimNormalFloat" {bg=gray3};
sym "SidebarNvimSectionTitle" {bg=gray3};
sym "SidebarNvimSectionSeparator" {bg=gray3};
sym "SidebarNvimSectionTitleSeparator" {bg=gray3};
sym "SidebarNvimLabel" {bg=gray3};
sym "SidebarNvimComment" {bg=gray3};
sym "SidebarNvimLineNr" {bg=gray3};
sym "SidebarNvimKeyword" {bg=gray3};
sym "SidebarNvimGitStatusState" {bg=gray3};
sym "SidebarNvimGitStatusFileName" {bg=gray3};
sym "SidebarNvimLspDiagnosticsError" {bg=gray3};
sym "SidebarNvimLspDiagnosticsWarn" {bg=gray3};
sym "SidebarNvimLspDiagnosticsInfo" {bg=gray3};
sym "SidebarNvimLspDiagnosticsHint" {bg=gray3};
sym "SidebarNvimLspDiagnosticsLineNumber" {bg=gray3};
sym "SidebarNvimLspDiagnosticsColNumber" {bg=gray3};
sym "SidebarNvimLspDiagnosticsFilename" {bg=gray3};
sym "SidebarNvimLspDiagnosticsTotalNumber" {bg=gray3};
sym "SidebarNvimLspDiagnosticsMessage" {bg=gray3};
sym "SidebarNvimTodoTag" {bg=gray3};
sym "SidebarNvimTodoTotalNumber" {bg=gray3};
sym "SidebarNvimTodoFilename" {bg=gray3};
sym "SidebarNvimTodoLineNumber" {bg=gray3};
sym "SidebarNvimTodoColNumber" {bg=gray3};
sym "SidebarNvimDockerContainerStatusRunning" {bg=gray3};
sym "SidebarNvimDockerContainerStatusExited" {bg=gray3};
sym "SidebarNvimDockerContainerName" {bg=gray3};
sym "SidebarNvimDatetimeClockName" {bg=gray3};
sym "SidebarNvimDatetimeClockValue" {bg=gray3};
sym "SidebarNvimBuffersActive" {bg=gray3};
sym "SidebarNvimBuffersNumber" {bg=gray3};

sym "SidebarNvimEndOfBuffer" {bg=gray3};
sym "SidebarNvimCursorLine" {bg=gray3};
sym "SidebarNvimCursorLineNr" {bg=gray3};
sym "SidebarNvimWinSeparator" {bg=gray3};
sym "SidebarNvimStatusLine" {bg=gray3};
sym "SidebarNvimStatuslineNC" {bg=gray3};
sym "SidebarNvimSignColumn" {bg=gray3};

-- GitSigns
sym "GitSignsAdd" {fg=green};
sym "GitSignsChange" {fg=blue};
sym "GitSignsDelete" {fg=red};
sym "GitSignsUntracked" {fg=yellow};

-- Lua
sym "@lsp.type.function.lua" {fg=fg}
}end)
