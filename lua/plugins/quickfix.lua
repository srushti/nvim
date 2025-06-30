return {
  { "kevinhwang91/nvim-bqf", ft = "qf", dependencies = { "nvim-treesitter/nvim-treesitter" } },
  {
    "stevearc/quicker.nvim",
    event = "FileType qf",
    ---@module "quicker"
    ---@type quicker.SetupOptions
    opts = {},
  },
  {
    "gabrielpoca/replacer.nvim",
    event = "FileType qf",
    opts = { rename_files = false },
    -- keys = {
    --   {
    --     "<leader>h",
    --     function()
    --       require("replacer").run()
    --       require("bqf.main").toggle()
    --     end,
    --     desc = "run replacer.nvim",
    --   },
    -- },
  },
}
