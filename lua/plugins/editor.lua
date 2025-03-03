return {
  { "tpope/vim-surround", event = "LazyFile" },
  { "tpope/vim-unimpaired", event = "LazyFile" },
  { "tpope/vim-sleuth", event = "LazyFile" },
  { "simnalamburt/vim-mundo", event = "LazyFile" },
  {
    "hedyhli/outline.nvim",
    event = "LazyFile",
    config = function()
      -- Example mapping to toggle outline
      vim.keymap.set("n", "<leader>o", "<cmd>Outline<CR>", { desc = "Toggle Outline", unique = true })

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
        javascript = { "prettierd", "prettier" },
      },
    },
  },
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    build = ":Copilot auth",
    event = "InsertEnter",
    opts = {
      suggestion = {
        enabled = not vim.g.ai_cmp,
        auto_trigger = true,
        keymap = {
          accept = false, -- handled by nvim-cmp / blink.cmp
          next = "<M-]>",
          prev = "<M-[>",
        },
      },
      panel = { enabled = false },
      filetypes = {
        markdown = true,
        javascript = true,
        typescript = true,
        ruby = true,
        lua = true,
        help = true,
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
}
