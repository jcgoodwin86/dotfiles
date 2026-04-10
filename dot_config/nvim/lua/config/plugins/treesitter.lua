-- nvim-treesitter: syntax highlighting and indentation.
-- Pinned to the old `master` branch because the new `main` branch requires
-- the tree-sitter CLI to be installed, which is not available via brew on macOS.
-- The `master` branch only requires a C compiler (provided by Xcode tools).
--
-- Templ is not in the official parser registry so it is registered manually
-- before setup() is called.

return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "master",
    build = ":TSUpdate",
    config = function()
      -- Register templ parser manually (not in official registry)
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
}
