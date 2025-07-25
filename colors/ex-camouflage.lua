-- This file is generated by ex-colors. The credit goes to the authors and contributors of the original colorscheme camouflage.
vim.api.nvim_set_var("colors_name", "ex-camouflage")
vim.api.nvim_set_var("terminal_color_0", "#1b1d2b")
vim.api.nvim_set_var("terminal_color_1", "#ff757f")
vim.api.nvim_set_var("terminal_color_2", "#c3e88d")
vim.api.nvim_set_var("terminal_color_3", "#ffc777")
vim.api.nvim_set_var("terminal_color_4", "#82aaff")
vim.api.nvim_set_var("terminal_color_5", "#c099ff")
vim.api.nvim_set_var("terminal_color_6", "#86e1fc")
vim.api.nvim_set_var("terminal_color_7", "#828bb8")
vim.api.nvim_set_var("terminal_color_8", "#444a73")
vim.api.nvim_set_var("terminal_color_9", "#ff8d94")
vim.api.nvim_set_var("terminal_color_10", "#c7fb6d")
vim.api.nvim_set_var("terminal_color_11", "#ffd8ab")
vim.api.nvim_set_var("terminal_color_12", "#9ab8ff")
vim.api.nvim_set_var("terminal_color_13", "#caabff")
vim.api.nvim_set_var("terminal_color_14", "#b2ebff")
vim.api.nvim_set_var("terminal_color_15", "#c8d3f5")
vim.api.nvim_set_hl(0, "@keyword.import", { link = "Special" })
vim.api.nvim_set_hl(0, "@punctuation.bracket", { link = "Delimiter" })
vim.api.nvim_set_hl(0, "@punctuation.delimiter", { link = "Normal" })
vim.api.nvim_set_hl(0, "@type.builtin", { link = "Type" })
vim.api.nvim_set_hl(0, "@variable", { ctermfg = 248, fg = 14017157 })
vim.api.nvim_set_hl(0, "@variable.builtin", { link = "Type" })
vim.api.nvim_set_hl(0, "Comment", { ctermfg = 242, fg = 11119017 })
vim.api.nvim_set_hl(0, "Conceal", { fg = 5198424 })
vim.api.nvim_set_hl(0, "Constant", { fg = 10854912 })
vim.api.nvim_set_hl(0, "Cursor", { bg = 16777215 })
vim.api.nvim_set_hl(0, "CursorColumn", { bg = 1051145, ctermbg = 242 })
vim.api.nvim_set_hl(0, "CursorLine", { bg = 1051145, ctermbg = 242 })
vim.api.nvim_set_hl(0, "Delimiter", { fg = 4227200 })
vim.api.nvim_set_hl(0, "DiffAdd", { bg = 8704, ctermbg = 2, ctermfg = 0 })
vim.api.nvim_set_hl(0, "DiffChange", { bg = 2236962, ctermbg = 242 })
vim.api.nvim_set_hl(0, "DiffDelete", { bg = 2228224, bold = true, cterm = { bold = true }, ctermbg = 1, ctermfg = 9 })
vim.api.nvim_set_hl(0, "DiffText", { bg = 3225663, ctermbg = 4, ctermfg = 0 })
vim.api.nvim_set_hl(0, "FoldColumn", { bg = 459008, ctermfg = 14, fg = 53970 })
vim.api.nvim_set_hl(0, "Folded", { bg = 459008, ctermfg = 14, fg = 53970 })
vim.api.nvim_set_hl(0, "Function", { ctermfg = 6, fg = 4227200 })
vim.api.nvim_set_hl(0, "Identifier", { ctermfg = 248, fg = 9876878 })
vim.api.nvim_set_hl(0, "Keyword", { ctermfg = 6, fg = 38500 })
vim.api.nvim_set_hl(0, "LineNr", { fg = 5198424, link = "PeacockFg" })
vim.api.nvim_set_hl(0, "MatchParen", { bg = 5263440, bold = true, cterm = { bold = true, underline = true } })
vim.api.nvim_set_hl(0, "NonText", { fg = 4868697 })
vim.api.nvim_set_hl(0, "Normal", { bg = 459008, ctermfg = 9, fg = 14017157, link = "@variable" })
vim.api.nvim_set_hl(0, "Number", { ctermfg = 121, fg = 6605962 })
vim.api.nvim_set_hl(0, "Operator", { ctermfg = 14, fg = 53970 })
vim.api.nvim_set_hl(0, "Pmenu", { bg = 3289650, cterm = { reverse = true }, fg = 10145074 })
vim.api.nvim_set_hl(
  0,
  "PmenuSel",
  { bg = 9109504, blend = 0, cterm = { reverse = true, underline = true }, fg = 10145074, reverse = true }
)
vim.api.nvim_set_hl(0, "PreProc", { ctermfg = 130, fg = 13189120 })
vim.api.nvim_set_hl(0, "Search", { cterm = { underline = true }, underline = true })
vim.api.nvim_set_hl(0, "Special", { ctermfg = 1, fg = 10824500 })
vim.api.nvim_set_hl(0, "SpecialKey", { ctermfg = 248, fg = 4868697 })
vim.api.nvim_set_hl(0, "Statement", { cterm = { bold = true }, ctermfg = 130, fg = 8476928 })
vim.api.nvim_set_hl(
  0,
  "StatusLine",
  { bg = 3680523, cterm = { reverse = true }, ctermfg = 14, fg = 53970, italic = true }
)
vim.api.nvim_set_hl(
  0,
  "StatusLineNC",
  { bg = 3090728, cterm = { bold = true, underline = true }, ctermfg = 14, fg = 53970 }
)
vim.api.nvim_set_hl(0, "String", { ctermfg = 81, fg = 4957619 })
vim.api.nvim_set_hl(0, "Title", { bold = true, cterm = { bold = true }, fg = 16763449 })
vim.api.nvim_set_hl(0, "Type", { ctermfg = 3, fg = 10855168 })
vim.api.nvim_set_hl(0, "Visual", { bg = 3223857, ctermbg = 242, ctermfg = 0 })
vim.api.nvim_set_hl(0, "lCursor", { bg = 14017157, fg = 459008 })
