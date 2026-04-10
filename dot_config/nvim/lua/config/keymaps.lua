-- Keymaps.
-- Defined after plugins load so we can require plugin modules directly.

local fzf = require("fzf-lua")

-- Find files by name across project (including hidden and git-ignored)
vim.keymap.set("n", "<C-p>", function()
  fzf.files({ hidden = true, no_ignore = true })
end, { desc = "Find files" })

-- Search text contents across entire project (requires ripgrep)
vim.keymap.set("n", "<leader>fg", fzf.live_grep, { desc = "Live grep" })

-- Search lines in the current buffer only
vim.keymap.set("n", "<leader>fb", fzf.blines, { desc = "Search buffer" })

-- Toggle file explorer (floating window)
vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal float<CR>", { desc = "File explorer" })
