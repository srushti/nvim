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
    "otavioschwanck/arrow.nvim",
    dependencies = {
      { "nvim-tree/nvim-web-devicons" },
      -- or if using `mini.icons`
      -- { "echasnovski/mini.icons" },
    },
    opts = {
      show_icons = true,
      leader_key = "\\", -- Recommended to be a single key
      buffer_leader_key = "m", -- Per Buffer Mappings
    },
  },
  {
    "xzbdmw/clasp.nvim",
    config = function()
      require("clasp").setup({
        pairs = { ["{"] = "}", ['"'] = '"', ["'"] = "'", ["("] = ")", ["["] = "]" },
      })

      -- jumping from smallest region to largest region
      vim.keymap.set({ "n", "i" }, "<c-l>", function()
        require("clasp").wrap("next")
      end)

      -- jumping from largest region to smallest region
      vim.keymap.set({ "n", "i" }, "<c-l>", function()
        require("clasp").wrap("prev")
      end)
    end,
  },
  {
    "stevearc/oil.nvim",
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {},
    -- Optional dependencies
    dependencies = { { "echasnovski/mini.icons", opts = {} }, { "nvim-tree/nvim-web-devicons" } },
    -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
    lazy = false,
  },
  {
    "A7Lavinraj/fyler.nvim",
    dependencies = { "echasnovski/mini.icons" },
    opts = {
      window_config = {
        split = "left",
      },
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
  {
    "ibhagwan/fzf-lua",
    keys = {
      { "<leader><space>", LazyVim.pick("files", { root = false }), desc = "Find Files (cwd)" },
    },
  },
  {
    "rgroli/other.nvim",
    event = "LazyFile",
    config = function()
      require("other-nvim").setup({
        mappings = {
          {
            context = "test",
            pattern = "/(.*)/(.*).ts$",
            target = {
              { target = "/%1/%2.test.ts" },
              { target = "/%1/%2.spec.ts" },
            },
          },
          { context = "controller", pattern = "/(.*)/(.*).service.ts$", target = "/%1/%2.controller.ts" },
          { context = "service", pattern = "/(.*)/(.*).controller.ts$", target = "/%1/%2.service.ts" },
          { context = "source", pattern = "/(.*)/(.*).spec.ts$", target = "/%1/%2.ts" },
          { context = "source", pattern = "/(.*)/(.*).test.ts$", target = "/%1/%2.ts" },
        },
        showMissingFiles = false,
      })
    end,
    keys = {
      { "<leader>oo", ":Other<CR>", "Open related file", { silent = true } },
    },
  },
  {
    "leath-dub/snipe.nvim",
    keys = {
      {
        "gb",
        function()
          require("snipe").open_buffer_menu()
        end,
        desc = "Open Snipe buffer menu",
      },
    },
    opts = { sort = "last" },
  },
}
