-- neo-tree: file explorer in a floating window.
-- Configured to auto-close when a file is opened.

return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("neo-tree").setup({
        event_handlers = {
          {
            event = "file_opened",
            handler = function()
              -- Auto-close neo-tree when a file is opened
              require("neo-tree.command").execute({ action = "close" })
            end,
          },
        },
      })
    end,
  },
}
