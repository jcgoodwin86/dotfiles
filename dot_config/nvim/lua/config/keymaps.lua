-- Global keymaps (always available)

-- Find files
vim.keymap.set("n", "<leader>ff", function()
  require("fzf-lua").files({ hidden = true, no_ignore = true })
end, { desc = "Find files" })

-- Live grep
vim.keymap.set("n", "<leader>fg", function()
  require("fzf-lua").live_grep()
end, { desc = "Live grep" })

-- Search buffer
vim.keymap.set("n", "<leader>fb", function()
  require("fzf-lua").blines()
end, { desc = "Search buffer" })

-- File explorer
vim.keymap.set(
  "n",
  "<leader>fe",
  "<cmd>Neotree filesystem reveal float<CR>",
  { desc = "File explorer" }
)
