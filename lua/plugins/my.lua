return {
  {
    "srushti/my.vim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd("colorscheme camouflage")
      vim.cmd("colorscheme ex-camouflage")
    end,
  },
}
