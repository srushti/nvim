return {
  { "tpope/vim-surround", event = "LazyFile" },
  { "tpope/vim-unimpaired", event = "LazyFile" },
  { "tpope/vim-sleuth", event = "LazyFile" },
  {
    "mbbill/undotree",
    event = "LazyFile",
  },
  {
    "hedyhli/outline.nvim",
    event = "LazyFile",
    config = function()
      -- Example mapping to toggle outline
      vim.keymap.set("n", "<leader>o", "<cmd>Outline<CR>", { desc = "Toggle Outline", silent = true, unique = true })

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
      formatters_by_ft = {
        lua = { "stylua" },
        -- Conform will run multiple formatters sequentially
        python = { "isort", "black" },
        -- You can customize some of the format options for the filetype (:help conform.format)
        rust = { "rustfmt", lsp_format = "fallback" },
        -- Conform will run the first available formatter
        typescript = { "biome", "biome-check", "biome-organize-imports" },
        -- javascript = { "prettierd", "prettier" },
      },
    },
  },
  {
    "folke/snacks.nvim",
    ---@type snacks.Config
    opts = {
      image = {},
      dashboard = {
        width = 50,
        sections = {
          {
            pane = 1,
            section = "terminal",
            cmd = "basename `pwd` | figlet -f slant | lolcat",
            height = 20,
            padding = 1,
          },
          {
            pane = 2,
            section = "terminal",
            cmd = "cowsay -rC `fortune -s`",
            height = 20,
            padding = 1,
          },
          { section = "keys", gap = 1, padding = 1 },
          { pane = 2, icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
          { pane = 2, icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
          {
            pane = 2,
            icon = " ",
            title = "Git Status",
            section = "terminal",
            enabled = function()
              return Snacks.git.get_root() ~= nil
            end,
            cmd = "git status --short --branch --renames",
            height = 5,
            padding = 1,
            ttl = 5 * 60,
            indent = 3,
          },
          { section = "startup" },
        },
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
      },
    },
    opts = {
      sources = {
        default = { "lsp", "path", "snippets", "buffer", "copilot", "avante", "ripgrep" },
        providers = {
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
                -- item.kind_name = "File"
                item.kind_icon = "📄"
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
                item.kind_icon = "🔎"
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
