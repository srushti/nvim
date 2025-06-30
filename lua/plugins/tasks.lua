return {
  {
    "Hashino/doing.nvim",
    lazy = true,
    cmd = "Do",
    keys = {
      {
        "<leader>da",
        function()
          require("doing").add()
        end,
        {},
      },
      {
        "<leader>dn",
        function()
          require("doing").done()
        end,
        {},
      },
      {
        "<leader>de",
        function()
          require("doing").edit()
        end,
        {},
      },
    },
  },
  {
    "zk-org/zk-nvim",
    lazy = true,
    dependencies = {
      "ibhagwan/fzf-lua",
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("zk").setup({
        pick = "fzf-lua",
      })
    end,
    cmd = {
      "ZkNew",
      "ZkNewFromTitleSelection",
      "ZkNewFromContentSelection",
      "ZKIndex",
      "ZkCd",
      "ZkNotes",
      "ZkNotesFromTitle",
      "ZkInsertLink",
      "ZkMatch",
      "ZkTags",
      "ZkBuffers",
      "ZkNewFromContentSelection",
    },
    keys = {
      { "<leader>zn", "<cmd>ZkNew<cr>", desc = "Zk New" },
      { "<leader>zb", "<cmd>ZkBuffers<cr>", desc = "Zk Buffers" },
    },
  },
}
