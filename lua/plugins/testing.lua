return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {
      adapters = { "neotest-jest" },
    },
    event = "LazyFile",
  },
  {
    "nvim-neotest/neotest-jest",
    dependencies = {
      "nvim-neotest/neotest",
    },
    event = "LazyFile",
  },
}
