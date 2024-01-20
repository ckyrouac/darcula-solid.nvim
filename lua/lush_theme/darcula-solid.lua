local lush = require('lush')
local colors = require('lush_theme/colors')
require('lush_theme/cursor')
require('lush_theme/diagnostics')
require('lush_theme/line-numbers')
require('lush_theme/options')
require('lush_theme/terminal')

-- GUI options
local bf, it, un = 'bold', 'italic', 'underline'

return lush(function(injected_functions)
local sym = injected_functions.sym
return {
sym "Normal" { fg=colors.fg, bg=colors.bg };
sym "NormalFloat" { fg=colors.fg, bg=colors.bg };
sym "NormalNC" { fg=colors.fg,      bg=colors.bg }; -- normal text in non-current windows

sym "Comment" { fg=colors.comment,  gui=it };
sym "Whitespace" { fg=colors.mid };                  -- 'listchars'
sym "Conceal" { fg='#404040' };
sym "NonText" { fg=colors.bg };              -- characters that don't exist in the text
sym "SpecialKey" { sym("Whitespace") };              -- Unprintable characters: text displayed differently from what it really is


sym "Cursor" { fg=colors.bg,      bg=colors.fg };
sym "TermCursor" { fg=colors.bg,      bg=colors.fg };
sym "ColorColumn" { bg=colors.overbg };
sym "CursorColumn" { bg=colors.subtle };
sym "CursorLine" { bg='#26282e' };
sym "MatchParen" { fg=colors.pop, bg='#43454a' };

sym "LineNr" { fg=colors.faded };
sym "CursorLineNr" { fg=colors.fg };
sym "SignColumn" { sym("LineNr") };
sym "VertSplit" { fg=colors.gray3,  bg=colors.bg };    -- column separating vertically split windows
sym "Folded" { fg=colors.comment, bg=colors.overbg };
sym "FoldColumn" { sym("LineNr") };

sym "Pmenu" { bg=colors.overbg };                -- Popup menu normal item
sym "PmenuSel" { bg=colors.mid };                   -- selected item
sym "PmenuSbar" { sym("Pmenu") };                    -- scrollbar
sym "PmenuThumb" { sym("PmenuSel") };                 -- Thumb of the scrollbar
sym "WildMenu" { sym("Pmenu") };                    -- current match in 'wildmenu' completion
sym "QuickFixLine" { fg=colors.pop };                   -- Current |quickfix| item in the quickfix window

sym "StatusLine" { bg=colors.bg, fg=colors.bg };
sym "StatusLineNC" { fg=colors.faded,   bg=colors.bg };

sym "TabLine" { bg=colors.mid };                   -- not active tab page label
sym "TabLineFill" { bg=colors.overbg };                -- where there are no labels
sym "TabLineSel" { bg=colors.faded };                 -- active tab page label

sym "Search" { fg=colors.fg, bg=colors.gray2 };      -- Last search pattern highlighting (see 'hlsearch')
sym "CurSearch" { fg=colors.fg, bg=colors.dark_magenta };

sym "IncSearch" { sym("Search") };                   -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
sym "Substitute" { sym("Search") };                   -- |:substitute| replacement text highlighting

sym "Visual" { bg='#214283' };                    -- Visual mode selection
sym "VisualNOS" { bg=colors.subtle };                -- Visual mode selection when Vim is "Not Owning the Selection".

sym "ModeMsg" { fg=colors.faded };                 -- 'showmode' message (e.g. "-- INSERT -- ")
sym "MsgArea" { sym("Normal") };                   -- Area for messages and cmdline
sym "MsgSeparator" { fg=colors.orange };                -- Separator for scrolled messages `msgsep` flag of 'display'
sym "MoreMsg" { fg=colors.green };                 -- |more-prompt|
sym "Question" { fg=colors.green };                 -- |hit-enter| prompt and yes/no questions
sym "ErrorMsg" { fg=colors.red };                   -- error messages on the command line
sym "WarningMsg" { fg=colors.red };                   -- warning messages

sym "Directory" { fg=colors.blue };                  -- directory names (and other special names in listings)
sym "Title" { fg=colors.blue };                  -- titles for output from ":set all" ":autocmd" etc.

sym "DiffAdd" { fg='#606b4f' };
sym "DiffDelete" { fg=colors.red };
sym "DiffChange" { fg='#915a00' };
sym "DiffText" { sym("DiffChange"), gui=un };
sym "DiffAdded" { sym("DiffAdd") };
sym "DiffRemoved" { sym("DiffDelete") };

sym "SpellBad" { fg=colors.red,     gui=un };
sym "SpellCap" { fg=colors.magenta, gui=un };
sym "SpellLocal" { fg=colors.orange,  gui=un };
sym "SpellRare" { fg=colors.yellow,  gui=un };



---- Language Server Protocol highlight groups ---------------------------------

sym "LspReferenceText" { bg=colors.mid };    -- highlighting "text" references
sym "LspReferenceRead" { bg=colors.mid };    -- highlighting "read" references
sym "LspReferenceWrite" { bg=colors.mid };    -- highlighting "write" references

-- base highlight groups. Other LspDiagnostic highlights link to these by default (except Underline)
sym "LspDiagnosticsDefaultError" { fg=colors.red };
sym "LspDiagnosticsDefaultWarning" { fg=colors.yellow };
sym "LspDiagnosticsDefaultInformation" { fg=colors.fg };
sym "LspDiagnosticsDefaultHint" { fg=colors.teal };

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

sym "Constant" { fg=colors.orange };
sym "Number" { fg=colors.blue };
sym "Float" { sym("Number") };
sym "Boolean" { sym("Constant") };
sym "Character" { fg=colors.orange };
sym "String" { fg=colors.green };

sym "Identifier" { fg=colors.fg };
sym "Function" { fg=colors.fg };

sym "Statement" { fg=colors.orange }; -- (preferred) any statement
sym "Conditional" { sym("Statement") };
sym "Repeat" { sym("Statement") };
sym "Label" { sym("Statement") };       -- case, default, etc.
sym "Operator" { fg=colors.fg };
sym "Keyword" { sym("Statement") };    -- any other keyword
sym "Exception" { fg=colors.red };

sym "PreProc" { fg=colors.orange };    --  generic Preprocessor
sym "Include" { sym("PreProc") };    -- preprocessor #include
sym "Define" { sym("PreProc") };    -- preprocessor #define
sym "Macro" { sym("PreProc") };    -- same as Define
sym "PreCondit" { sym("PreProc") };    -- preprocessor #if, #else, #endif, etc.

sym "Type" { fg=colors.fg };
sym "StorageClass" { fg=colors.magenta };    -- static, register, volatile, etc.
sym "Structure" { fg=colors.magenta };    -- struct, union, enum, etc.
sym "Typedef" { sym("Type") };

sym "Special" { fg=colors.orange };  -- (preferred) any special symbol
sym "SpecialChar" { sym("Special") };    -- special character in a constant
sym "Tag" { fg=colors.yellow };  -- you can use CTRL-] on this
sym "Delimiter" { sym("Special") };    -- character that needs attention
sym "SpecialComment" { sym("Special") };    -- special things inside a comment
sym "Debug" { sym("Special") };    -- debugging statements

sym "Underlined" { gui = un };
sym "Bold" { gui = bf };
sym "Italic" { gui = it };
sym "Ignore" { fg=colors.faded };           --  left blank, hidden  |hl-Ignore|
sym "Error" { fg=colors.red };             --  any erroneous construct
sym "Todo" { gui=bf };  --  anything that needs extra attention



---- TREESITTER ----------------------------------------------------------------

sym "@constant"                 { sym("Constant") };
sym "@constant.builtin"         { sym("Constant"),   gui=it };    -- constant that are built in the language: `nil` in Lua.
sym "@constant.macro"           { sym("Constant"),   gui=bf };    -- constants that are defined by macros: `NULL` in C.
sym "@number"                   { sym("Number") };
sym "@float"                    { sym("Float") };
sym "@boolean"                  { sym("Boolean") };
sym "@character"                { sym("Character") };
sym "@string"                   { sym("String") };
sym "@string.regex"             { sym("Character") };
sym "@string.escape"            { sym("Character") };             -- escape characters within a string
sym "@symbol"                   { fg=colors.green, gui=it };      -- For identifiers referring to symbols or atoms.

sym "@field"                    { fg=colors.purple };
sym "@property"                 { fg=colors.purple };
sym "@parameter"                { fg=colors.fg };
sym "@parameter.reference"      { fg=colors.fg };
sym "@variable"                 { fg=colors.fg };                 -- Any variable name that does not have another highlight
sym "@variable.builtin"         { sym("Constant"),      gui=it }; -- Variable names that are defined by the languages like `this` or `self`.

sym "@function"                 { sym("Function") };
sym "@function.builtin"         { sym("Function") };
sym "@function.macro"           { sym("Function") };              -- macro defined fuctions: each `macro_rules` in Rust
sym "@method"                   { sym("Function") };
sym "@constructor"              { fg=colors.fg };                 -- For constructor: `{}` in Lua and Java constructors.
sym "@keyword.function"         { sym("Keyword") };

sym "@keyword"                  { sym("Keyword") };
sym "@conditional"              { sym("Conditional") };
sym "@repeat"                   { sym("Repeat") };
sym "@label"                    { sym("Label") };
sym "@operator"                 { sym("Operator") };
sym "@exception"                { sym("Exception") };

sym "@namespace"                { sym("PreProc") };               -- identifiers referring to modules and namespaces.
sym "@annotation"               { sym("PreProc") };               -- C++/Dart attributes annotations that can be attached to the code to denote some kind of meta information
sym "@attribute"                { sym("PreProc") };               -- Unstable
sym "@include"                  { sym("PreProc") };               -- includes: `#include` in C `use` or `extern crate` in Rust or `require` in Lua.

sym "@type"                     { sym("Type") };
sym "@type.builtin"             { sym("Type"), gui=it };

sym "@punctuation.delimiter"    { sym("Delimiter") };             -- delimiters ie: `.`
sym "@punctuation.bracket"      { fg=colors.fg };                 -- brackets and parens.
sym "@punctuation.special"      { sym("Delimiter") };             -- special punctutation that does not fall in the catagories before.

sym "@comment"                  { sym("Comment") };
sym "@tag"                      { sym("Tag") };                   -- Tags like html tag names.
sym "@tag.delimiter"            { sym("Special") };               -- Tag delimiter like < > /
sym "@text"                     { fg=colors.fg };
sym "@text.emphasis"            { fg=colors.fg, gui=it };
sym "@text.underline"           { fg=colors.fg, gui=un };
sym "@text.strike"              { sym("Comment"), gui=un };
sym "@text.strong"              { fg=colors.fg, gui=bf };
sym "@text.title"               { fg=colors.orange };             -- Text that is part of a title
sym "@text.literal"             { sym("String") };                -- Literal text
sym "@text.uri"                 { fg=colors.green, gui=it };      -- Any URI like a link or email

sym "@error"                    { fg=colors.red };                -- syntax/parser errors.

-- Other stuff
sym "HelpHyperTextJump" {fg=colors.yellow};
sym "markdownLinkText" {fg=colors.fg};

-- go
sym "@namespace.go" { fg=colors.yellow };
sym "@property.go" { fg=colors.fg };
sym "@field.go" { fg=colors.fg };
sym "@type.go" { fg=colors.cyan };
sym "@type.builtin.go" { fg=colors.dark_orange };
sym "@method.call.go" { fg=colors.gold };
sym "@lsp.type.function.go" { fg=colors.gold };
sym "@comment.go" { fg=colors.comment };
sym "@punctuation.delimiter.go" { fg=colors.fg };
sym "@method.go" { fg=colors.blue };
sym "@lsp.type.namespace.go" { fg =colors.yellow };
sym "@lsp.type.type.go" { fg =colors.blue };
sym "@lsp.mod.defaultLibrary.go" { fg =colors.dark_orange };
sym "@lsp.mod.readonly.go" { fg=colors.purple, gui=it };
sym "@lsp.typemod.variable.defaultLibrary.go" { fg=colors.dark_orange };

-- bash
sym "@function.call" { fg=colors.dark_orange };
sym "@function.builtin.bash" { fg=colors.dark_orange };
sym "@constant.bash" { fg=colors.fg };
sym "@function.bash" { fg=colors.blue };
sym "@punctuation.bracket.bash" { fg=colors.orange };
sym "@punctuation.special.bash" { fg=colors.fg };
sym "@number.bash" { fg=colors.blue };
sym "@comment.bash" { fg=colors.comment };

-- javascript
-- python
-- rust
-- java

-- NvimTree
sym "NvimTreeNormal"       { bg=colors.bg, fg=colors.fg };
sym "NvimTreeIndentMarker" { fg='#4f5152' };
sym "NvimTreeRootFolder"   { fg=colors.folder };
sym "NvimTreeFolderIcon"   { fg=colors.folder };
sym "NvimTreeFolderName"   { fg=colors.fg };
sym "NvimTreeOpenedFolderName"   { fg=colors.fg };
sym "NvimTreeCursorLine"   { bg='#2e436e' };

-- Sidebar
sym "SidebarNvimNormal" {guibg=colors.bg, fg=colors.fg, ctermbg=nil};
sym "SidebarNvimNormalBG" {bg=colors.bg, fg=colors.fg};
sym "SidebarNvimNormalNC" {bg=colors.bg};
sym "SidebarNvimNormalFloat" {bg=colors.bg};
sym "SidebarNvimEndOfBuffer" {bg=colors.bg};
sym "SidebarNvimCursorLine" {bg='#2e436e', ctermbg=nil};
sym "SidebarNvimCursorLineNr" {bg=colors.bg};
sym "SidebarNvimWinSeparator" {bg=colors.bg};
sym "SidebarNvimStatusLine" {bg=colors.bg, fg=colors.bg};
sym "SidebarNvimStatuslineNC" {bg=colors.bg, fg=colors.faded};

-- sym "SidebarNvimStatuslineNC" { bg=colors.bg, fg=colors.bg };
-- sym "SidebarNvimStatuslineNC" { fg=colors.faded,   bg=colors.bg };
sym "SidebarNvimSignColumn" {bg=colors.bg};

-- GitSigns
sym "GitSignsAdd" {fg=colors.green};
sym "GitSignsChange" {fg=colors.blue};
sym "GitSignsDelete" {fg=colors.red};
sym "GitSignsUntracked" {fg=colors.yellow};

-- bufferline
 -- for some reason the background needs to be set in the bufferline config
-- sym "BufferLineBackground" { bg=colors.bg };sym "BufferLineTab" { bg=colors.bg };
sym "BufferLineFill" { bg=colors.bg };
sym "BufferLineCloseButtonVisible" { bg=colors.bg };
sym "BufferLineBufferVisible" { bg=colors.bg };
sym "BufferLineBuffer" { bg=colors.bg };
sym "BufferLineNumbersVisible" { bg=colors.bg };
sym "BufferLineNumbers" { bg=colors.bg };
sym "BufferLineDiagnostic" { bg=colors.bg };
sym "BufferLineDiagnosticVisible" { bg=colors.bg };
sym "BufferLineHintDiagnosticVisible" { bg=colors.bg };
sym "BufferLineHintDiagnostic" { bg=colors.bg };
sym "BufferLineHintVisible" { bg=colors.bg };
sym "BufferLineHint" { bg=colors.bg };
sym "BufferLineInfoVisible" { bg=colors.bg };
sym "BufferLineInfo" { bg=colors.bg };
sym "BufferLineInfoDiagnosticVisible" { bg=colors.bg };
sym "BufferLineInfoDiagnostic" { bg=colors.bg };
sym "BufferLineWarningDiagnosticVisible" { bg=colors.bg };
sym "BufferLineWarningDiagnostic" { bg=colors.bg };
sym "BufferLineWarning" { bg=colors.bg };
sym "BufferLineWarningVisible" { bg=colors.bg };
sym "BufferLineErrorDiagnosticVisible" { bg=colors.bg };
sym "BufferLineErrorDiagnostic" { bg=colors.bg };
sym "BufferLineError" { bg=colors.bg };
sym "BufferLineErrorVisible" { bg=colors.bg };
sym "BufferLineModifiedVisible" { bg=colors.bg };
sym "BufferLineDuplicate" { bg=colors.bg, fg=colors.comment };
sym "BufferLineDuplicateVisible" { bg=colors.bg, fg=colors.comment };
sym "BufferLineDuplicateSelected" { bg=colors.bg, fg=colors.fg };
sym "BufferLineSeparator" { bg=colors.bg, fg=colors.bg };
sym "BufferLineSeparatorVisible" { bg=colors.bg };
sym "BufferLineIndicatorVisible" { bg=colors.bg, fg=colors.bg };
sym "BufferLineIndicatorSelected" { bg=colors.bg, fg=colors.bg };
sym "BufferLinePick" { bg=colors.bg };
sym "BufferLinePickVisible" { bg=colors.bg };
sym "BufferLineOffsetSeparator" { bg=colors.bg };
sym "BufferLineTruncMarker" { bg=colors.bg };
sym "BufferLineTabSeparator" { bg=colors.bg };
sym "BufferLineTabClose" { bg=colors.bg };
sym "BufferLineCloseButton" { bg=colors.bg, fg=colors.comment };
sym "BufferLineCloseButtonSelected" { bg=colors.bg, fg=colors.fg };
sym "BufferLineModified" { bg=colors.bg };
sym "BufferLineDevIconDefaultSelected" { bg=colors.bg };
sym "BufferLineDevIconDefaultInactive" { bg=colors.bg };
sym "BufferLineLineGroupSeparator" { bg=colors.bg };

-- Lua
sym "@lsp.type.function.lua" {fg=colors.fg};

-- Telescope
sym "TelescopePromptNormal" {fg=colors.fg, bg=colors.bg};
sym "TelescopePreviewMatch" {fg=colors.fg, bg=colors.bg};
sym "TelescopeBorder" {fg=colors.faded, bg=colors.bg};
sym "TelescopePromptCounter" {bg=colors.bg, fg=colors.gold};
sym "TelescopeResultsBorder" {fg=colors.blue, bg=colors.bg};
sym "TelescopePromptPrefix" {fg=colors.blue, bg=colors.bg};
}end)
