-- General editor options.
-- Set before plugins load so settings are in place from the start.

vim.g.mapleader = " "       -- leader key (must be set before lazy.nvim)
vim.o.termguicolors = true  -- enable 24-bit color

-- Indentation (2 spaces, no tabs)
vim.o.expandtab = true
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2

-- Treat .templ files as templ filetype for treesitter/LSP
vim.filetype.add({ extension = { templ = "templ" } })
