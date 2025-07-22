return {
  { "lmintmate/blue-mood-vim", event = "VeryLazy" },
  { "morhetz/gruvbox", event = "VeryLazy" },
  { "sainnhe/everforest", event = "VeryLazy" },
  { "khoido2003/classic_monokai.nvim", event = "VeryLazy" },
  { "szammyboi/dune.nvim", event = "VeryLazy" },
  {
    "HampusHauffman/peacock.nvim",
    lazy = false,
    config = function()
      require("peacock").setup()
    end,
  },
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
    -- config = function()
    --   vim.cmd("colorscheme ex-camouflage")
    -- end,
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
