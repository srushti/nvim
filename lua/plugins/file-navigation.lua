return {
  {
    "aaronik/treewalker.nvim",
    event = "LazyFile",
    keys = {
      -- movement
      { "<C-k>", "<cmd>Treewalker Up<cr>", mode = { "n", "v" }, silent = true },
      { "<C-j>", "<cmd>Treewalker Down<cr>", mode = { "n", "v" }, silent = true },
      { "<C-h>", "<cmd>Treewalker Left<cr>", mode = { "n", "v" }, silent = true },
      { "<C-l>", "<cmd>Treewalker Right<cr>", mode = { "n", "v" }, silent = true },

      -- swapping
      { "<C-S-k>", "<cmd>Treewalker SwapUp<cr>", mode = "n", silent = true },
      { "<C-S-j>", "<cmd>Treewalker SwapDown<cr>", mode = "n", silent = true },
      { "<C-S-h>", "<cmd>Treewalker SwapLeft<cr>", mode = "n", silent = true },
      { "<C-S-l>", "<cmd>Treewalker SwapRight<cr>", mode = "n", silent = true },
    },
  },
  {
    "folke/which-key.nvim",
    event = "LazyFile",
    opts = {
      spec = {
        { "<BS>", desc = "Decrement Selection", mode = "x" },
        { "<c-space>", desc = "Increment Selection", mode = { "x", "n" } },
      },
    },
  },
  {
    "mileszs/ack.vim",
    event = "LazyFile",
    config = function()
      if 1 == vim.fn.executable("rg") then
        vim.g.ackprg = "rg --vimgrep --smart-case --hidden"
        vim.g.ack_use_cword_for_empty_search = 1
      end
    end,
    keys = {
      { "<leader>a", ":Ack! ", "Search using ack or ag" },
    },
  },
}
