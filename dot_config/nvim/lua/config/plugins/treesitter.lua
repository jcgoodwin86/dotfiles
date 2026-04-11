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
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      local ts = require("nvim-treesitter")

      ts.setup({
        install_dir = vim.fn.stdpath("data") .. "/site",
      })

      vim.api.nvim_create_autocmd("User", {
        pattern = "TSUpdate",
        callback = function()
          require("nvim-treesitter.parsers").templ = {
            install_info = {
              url = "https://github.com/vrischmann/tree-sitter-templ",
              files = { "src/parser.c", "src/scanner.c" },
              branch = "master",
            },
          }
        end,
      })

      vim.treesitter.language.register("templ", { "templ" })

      ts.install({
        "lua",
        "javascript",
        "go",
        "yaml",
        "json",
        "bash",
        "templ",
      })

      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "lua", "javascript", "go", "yaml", "json", "sh", "templ" },
        callback = function(args)
          vim.treesitter.start(args.buf)

          local ok = pcall(vim.treesitter.query.get, vim.bo[args.buf].filetype, "indents")
          if ok then
            vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
          end
        end,
      })
    end,
  },
}
