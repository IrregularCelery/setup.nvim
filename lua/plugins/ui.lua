return {
  {
    -- Status bar
    "nvim-lualine/lualine.nvim",
    config = function()
      require("lualine").setup({
        options = {
          theme = "palenight",
        },
      })
    end,
  },
  {
    -- Tabs bar for availables buffer
    "romgrk/barbar.nvim",
    dependencies = {
      "lewis6991/gitsigns.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("barbar").setup({
        insert_at_start = true,
      })

      vim.keymap.set("n", "<tab>", "<cmd>BufferNext<cr>", { noremap = true, silent = true })
      vim.keymap.set("n", "<s-tab>", "<cmd>BufferPrevious<cr>", { noremap = true, silent = true })
      vim.keymap.set("n", "<leader>w", "<cmd>BufferClose<cr>", { noremap = true, silent = true })
    end,
  },
  {
    -- Draw vertical lines for better visual indentaion
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    config = function()
      require("ibl").setup({
        indent = {
          char = "▏",
        },
        scope = {
          show_start = false,
          show_end = false,
          show_exact_scope = false,
        },
      })
    end,
  },
  {
    -- Highlight comments containing todo, notes, fixme, etc.
    "folke/todo-comments.nvim",
    event = "VimEnter",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("todo-comments").setup({
        signs = false,
      })
    end,
  },
  {
    -- Animate cursor movement
    "sphamba/smear-cursor.nvim",
    config = function()
      require("smear_cursor").setup({
        smear_between_buffers = true,
        smear_between_neighbor_lines = true,
        scroll_buffer_space = true,
      })
    end,
  },
  {
    -- Highlight color values
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup()
    end,
  },
}
