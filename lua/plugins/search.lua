return {
  -- Fuzzy finder
  "nvim-telescope/telescope.nvim",
  event = "VimEnter",
  branch = "master",
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      cond = function()
        return vim.fn.executable("make") == 1
      end,
    },
    { "nvim-telescope/telescope-ui-select.nvim" },
    { "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
  },
  config = function()
    local builtin = require("telescope.builtin")

    require("telescope").setup({
      defaults = {
        mappings = {
          i = {
            ["<c-n>"] = "move_selection_next",
            ["<c-p>"] = "move_selection_previous",
            ["<c-y>"] = "select_default",
          },
        },
      },
      pickers = {
        find_files = {
          file_ignore_patterns = { "%.git" },
          hidden = true,
        },
      },
      extensions = {
        ["ui-select"] = {
          require("telescope.themes").get_dropdown(),
        },
      },
    })

    pcall(require("telescope").load_extension, "fzf")
    pcall(require("telescope").load_extension, "ui-select")

    vim.keymap.set("n", "<leader>f", builtin.find_files)
    vim.keymap.set("n", "<leader>/", builtin.live_grep)
    vim.keymap.set("n", "<leader>.", builtin.oldfiles)
    vim.keymap.set("n", "<leader>d", builtin.diagnostics)
    vim.keymap.set("n", "<leader>r", builtin.resume)
    vim.keymap.set("n", "<leader><leader>", builtin.buffers)
  end,
}
