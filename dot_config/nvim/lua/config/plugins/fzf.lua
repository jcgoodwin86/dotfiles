-- fzf-lua: fuzzy finder for files, grep, buffers, etc.
-- Replaces telescope.nvim due to a neovim 0.12 input focus bug that breaks
-- telescope's prompt buffer.

return {
  {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("fzf-lua").setup({
        winopts = {
          height = 0.85,
          width = 0.85,
          preview = {
            layout = "horizontal",
          },
        },
      })
    end,
  },
}
