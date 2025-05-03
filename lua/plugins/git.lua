return {
  {
    "tpope/vim-fugitive",
    event = "LazyFile",
    config = function()
      vim.keymap.set(
        "n",
        "<leader>gci",
        "<cmd>Git commit<CR>",
        { silent = true, desc = "Commit the changes", unique = true }
      )
      vim.keymap.set("n", "<leader>Gw", ":Gwrite<cr>", { silent = true, desc = "Git write", unique = true })
      vim.keymap.set("n", "<leader>Gi", ":Git<cr>", { silent = true, desc = "Git status", unique = true })
      vim.api.nvim_create_autocmd({ "FileType" }, {
        pattern = "fugitive",
        desc = "QuickFix <leader><Enter>",
        nested = true,
        callback = function()
          vim.keymap.set("n", "q", ":close<cr>", { buffer = true, desc = "Close fugitive window", silent = true })
        end,
      })
    end,
  },
  { "akinsho/git-conflict.nvim", version = "*", config = true },
  {
    "tanvirtin/vgit.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons" },
    event = "VimEnter",
    config = function()
      require("vgit").setup({
        settings = {
          live_blame = {
            enabled = false,
          },
        },
      })
    end,
    keys = {
      {
        "<leader>Gs",
        function()
          require("vgit").buffer_hunk_stage()
        end,
        desc = "Stage the current hunk",
      },
      {
        "<leader>GS",
        function()
          require("vgit").buffer_stage()
        end,
        desc = "Stage the current buffer",
      },
      {
        "<leader>GU",
        function()
          require("vgit").buffer_unstage()
        end,
        desc = "Unstage the current buffer",
      },
      {
        "<leader>Gci",
        function()
          require("vgit").project_commit_preview()
        end,
        desc = "Preview the commit message for the current project",
      },
      {
        "<leader>Gd",
        function()
          require("vgit").buffer_diff_preview()
        end,
        desc = "Preview the diff of the current file",
      },
    },
  },
}
