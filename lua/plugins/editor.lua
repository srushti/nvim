return {
  { "r0nsha/multinput.nvim", event = "VeryLazy" },
  { "RaafatTurki/corn.nvim" },
  { "tpope/vim-surround", event = "LazyFile" },
  { "tpope/vim-unimpaired", event = "LazyFile" },
  { "tpope/vim-sleuth", event = "LazyFile" },
  { "ervandew/supertab", event = "LazyFile" },
  { "axelvc/template-string.nvim", event = "LazyFile" },
  {
    "zaucy/mcos.nvim",
    dependencies = {
      "jake-stewart/multicursor.nvim",
    },
    config = function()
      local mcos = require("mcos")
      mcos.setup({})

      -- mcos doesn't setup any keymaps
      -- here are some recommended ones
      vim.keymap.set({ "n", "v" }, "gms", mcos.opkeymapfunc, { expr = true })
      vim.keymap.set({ "n" }, "gmss", mcos.bufkeymapfunc)
    end,
  },
  {
    "tpope/vim-abolish",
    event = "LazyFile",
    config = function()
      vim.cmd("Abolish projcet{s} project{}")
    end,
  },
  { "MeanderingProgrammer/render-markdown.nvim", opts = { anti_conceal = { enabled = false } }, event = "LazyFile" },
  {
    "jiaoshijie/undotree",
    dependencies = "nvim-lua/plenary.nvim",
    config = true,
    keys = { -- load the plugin only when using it's keybinding:
      { "<leader>u", "<cmd>lua require('undotree').toggle()<cr>" },
    },
  },
  { "HiPhish/rainbow-delimiters.nvim", event = "LazyFile" },
  {
    "hedyhli/outline.nvim",
    event = "LazyFile",
    config = function()
      -- Example mapping to toggle outline
      vim.keymap.set("n", "<leader>O", "<cmd>Outline<CR>", { desc = "Toggle Outline", silent = true, unique = true })

      require("outline").setup({
        -- Your setup opts here (leave empty to use defaults)
      })
    end,
  },
  {
    "stevearc/conform.nvim",
    event = "LazyFile",
    optional = true,
    opts = {
      formatters = {
        kulala = {
          command = "kulala-fmt",
          args = { "format", "$FILENAME" },
          stdin = false,
        },
      },
      formatters_by_ft = {
        lua = { "stylua" },
        -- Conform will run multiple formatters sequentially
        python = { "isort", "black" },
        -- You can customize some of the format options for the filetype (:help conform.format)
        rust = { "rustfmt", lsp_format = "fallback" },
        -- Conform will run the first available formatter
        typescript = { "biome", "biome-check", "biome-organize-imports" },
        -- javascript = { "prettierd", "prettier" },
        http = { "kulala" },
        ruby = { "rubocop", "rubocop-autocorrect" },
      },
    },
  },
  {
    "saghen/blink.cmp",
    dependencies = {
      {
        "giuxtaposition/blink-cmp-copilot",
        "Kaiser-Yang/blink-cmp-avante",
        "mikavilpas/blink-ripgrep.nvim",
        "rafamadriz/friendly-snippets",
        "milanglacier/minuet-ai.nvim",
      },
    },
    opts = {
      keymap = {
        ["<A-m>"] = require("minuet").make_blink_map(),
      },
      sources = {
        default = { "lsp", "path", "ripgrep", "snippets", "minuet", "copilot", "avante" },
        providers = {
          minuet = {
            name = "minuet",
            module = "minuet.blink",
            async = true,
            timeout_ms = 3000,
            score_offset = 50,
            transform_items = function(_, items)
              for _, item in ipairs(items) do
                item.kind_icon = "💃🏽"
                item.labelDisplays = {
                  description = "(minuet)",
                }
              end
              return items
            end,
          },
          copilot = {
            name = "copilot",
            module = "blink-cmp-copilot",
            score_offset = 100,
            async = true,
          },
          avante = {
            module = "blink-cmp-avante",
            name = "Avante",
            opts = {
              command = {
                get_kind_name = function()
                  return "AvanteCmd"
                end,
              },
              mention = {
                get_kind_name = function()
                  return "AvanteMention"
                end,
              },
            },
            transform_items = function(_, items)
              for _, item in ipairs(items) do
                item.kind_icon = "⏩︎"
                item.labelDisplays = {
                  description = "(avante)",
                }
              end
              return items
            end,
          },
          ripgrep = {
            module = "blink-ripgrep",
            name = "Ripgrep",
            ---@module "blink-ripgrep"
            ---@type blink-ripgrep.Options
            opts = {
              search_casing = "--smart-case",
            },
            transform_items = function(_, items)
              for _, item in ipairs(items) do
                item.kind_name = "File"
                item.kind_icon = "📄"
                item.labelDisplays = {
                  description = "(rg)",
                }
              end
              return items
            end,
          },
        },
      },
    },
  },
}
