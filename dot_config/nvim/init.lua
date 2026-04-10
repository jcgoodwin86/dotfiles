-- =============================================================================
-- Options
-- =============================================================================

vim.g.mapleader = " "
vim.o.termguicolors = true
vim.o.expandtab = true
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2

-- =============================================================================
-- Bootstrap lazy.nvim (plugin manager)
-- =============================================================================

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- =============================================================================
-- Plugins
-- =============================================================================

require("lazy").setup({

  -- Colorscheme
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
  },

  -- Fuzzy finder (replaces telescope due to neovim 0.12 input focus bug)
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

  -- Syntax highlighting and indentation
  {
  "nvim-treesitter/nvim-treesitter",
  branch = "master",
  build = ":TSUpdate",
  config = function()
    local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
    parser_config.templ = {
      install_info = {
        url = "https://github.com/vrischmann/tree-sitter-templ",
        files = { "src/parser.c", "src/scanner.c" },
        branch = "master",
      },
      filetype = "templ",
    }

    require("nvim-treesitter.configs").setup({
      ensure_installed = { "lua", "javascript", "go", "yaml", "json", "bash", "templ" },
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
  },
  -- File explorer
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
          handler = function(file_path)
            -- close neo-tree when a file is opened
            require("neo-tree.command").execute({ action = "close" })
          end,
        },
      },
    })
  end,
},
})

vim.filetype.add({ extension = { templ = "templ" } })

-- =============================================================================
-- Colorscheme
-- =============================================================================

require("catppuccin").setup()
vim.cmd.colorscheme("catppuccin")

-- =============================================================================
-- Keymaps
-- =============================================================================

local fzf = require("fzf-lua")

-- Find files by name across project (including hidden and git-ignored)
vim.keymap.set("n", "<C-p>", function()
  fzf.files({ hidden = true, no_ignore = true })
end, { desc = "Find files" })

-- Search text contents across entire project
vim.keymap.set("n", "<leader>fg", fzf.live_grep, { desc = "Live grep" })

-- Search lines in current buffer only
vim.keymap.set("n", "<leader>fb", fzf.blines, { desc = "Search buffer" })

-- Toggle file explorer
vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal float<CR>", { desc = "File explorer" })
