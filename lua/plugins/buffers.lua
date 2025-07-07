return {
  {
    "famiu/bufdelete.nvim",
    event = "VeryLazy",
    keys = {
      { "<leader>bd", "<cmd>Bdelete<cr>", desc = "Delete Buffer" },
      { "<leader>bp", "<cmd>BufferLinePick<cr>", desc = "Pick Buffer" },
      { "<leader>bl", "<cmd>BufferLineCloseLeft<cr>", desc = "Close Left Buffers" },
      { "<leader>br", "<cmd>BufferLineCloseRight<cr>", desc = "Close Right Buffers" },
      { "<leader>bc", "<cmd>BufferLineCloseRight<cr>", desc = "Close Other Buffers" },
    },
  },
}
