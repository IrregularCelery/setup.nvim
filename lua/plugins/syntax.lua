return {
  -- Syntax highlighter
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        -- Systems languages
        "rust",
        "c",
        "cpp",
        "asm",

        -- High-level languages
        "go",
        "python",
        "java",

        -- Lua
        "lua",
        "luadoc",

        -- Vim
        "vim",
        "vimdoc",
        "query",

        -- Web development
        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",
        "svelte",
        "php",

        -- Config/Data formats
        "json",
        "yaml",
        "toml",
        "sql",
        "graphql",

        -- Shell/Scripting
        "bash",

        -- Build tools
        "make",
        "cmake",

        -- Documentation
        "markdown",
        "markdown_inline",
        "comment",

        -- Git
        "gitignore",
        "git_config",
        "gitcommit",

        -- Other
        "diff",
        "regex",
      },
      auto_install = true,
      highlight = {
        enable = true,
      },
      indent = { enable = true },
    })
  end,
}
