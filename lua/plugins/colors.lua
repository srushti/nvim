return {
  {
    "rose-pine/neovim",
    name = "rose-pine",
  },
  { "dgox16/oldworld.nvim" },
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
}
