return {
  {
    "srushti/my.vim",
    dependencies = { "rktjmp/lush.nvim" },
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd("colorscheme camouflage")
      vim.cmd("colorscheme ex-camouflage")
    end,
  },
}
