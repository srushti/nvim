return {
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
    "bassamsdata/namu.nvim",
    config = function()
      require("namu").setup({
        -- Enable the modules you want
        namu_symbols = {
          enable = true,
          options = {}, -- here you can configure namu
        },
        -- Optional: Enable other modules if needed
        colorscheme = {
          enable = false,
          options = {
            -- NOTE: if you activate persist, then please remove any vim.cmd("colorscheme ...") in your config, no needed anymore
            persist = true, -- very efficient mechanism to Remember selected colorscheme
            write_shada = false, -- If you open multiple nvim instances, then probably you need to enable this
          },
        },
        ui_select = { enable = false }, -- vim.ui.select() wrapper
      })
      -- === Suggested Keymaps: ===
      local namu = require("namu.namu_symbols")
      local colorscheme = require("namu.colorscheme")
      vim.keymap.set("n", "<leader>Ns", namu.show, {
        desc = "Jump to LSP symbol",
        silent = true,
        unique = true,
      })
      vim.keymap.set("n", "<leader>th", colorscheme.show, {
        desc = "Colorscheme Picker",
        silent = true,
        unique = true,
      })
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
  { "nvim-treesitter/playground", event = "LazyFile" },
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
          { context = "source", pattern = "/(.*)/(.*).spec.ts$", target = "/%1/%2.ts" },
          { context = "source", pattern = "/(.*)/(.*).test.ts$", target = "/%1/%2.ts" },
        },
        showMissingFiles = false,
      })
    end,
    keys = {
      { "<leader>O", ":Other<CR>", "Open related file" },
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
