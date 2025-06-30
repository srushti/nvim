return {
  {
    "rktjmp/lush.nvim",
    -- if you wish to use your own colorscheme:
    { dir = "~/.local/share/nvim/lazy/my.vim", lazy = true },
  },
  {
    "aileot/ex-colors.nvim",
    lazy = true,
    cmd = "ExColors",
    ---@type ExColors.Config
    opts = {},
    config = function()
      vim.cmd("colorscheme ex-camouflage")
    end,
  },
  {
    "rachartier/tiny-glimmer.nvim",
    event = "VeryLazy",
    opts = {
      enable = true,
      overwrite = {
        auto_map = true,
        yank = { enabled = true },
        paste = { enabled = true },
        undo = { enabled = true },
        redo = { enabled = true },
      },
    },
  },
}
