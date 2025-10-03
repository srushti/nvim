return {
  { "al-kot/typst-preview.nvim" },
  {
    "OXY2DEV/markview.nvim",
    event = "LazyFile",
    priority = 49,
    dependencies = {
      "saghen/blink.cmp",
    },
  },
  {
    "nvim-mini/mini.snippets",
    event = "LazyFile",
    config = function(_, opts)
      local gen_loader = require("mini.snippets").gen_loader
      opts = {
        snippets = {
          gen_loader.from_file("~/.config/nvim/snippets/global.json"),
        },

        -- Module mappings. Use `''` (empty string) to disable one.
        mappings = {
          -- Expand snippet at cursor position. Created globally in Insert mode.
          expand = "<C-j>",

          -- Interact with default `expand.insert` session.
          -- Created for the duration of active session(s)
          jump_next = "<C-l>",
          jump_prev = "<C-h>",
          stop = "<C-c>",
        },

        -- Functions describing snippet expansion. If `nil`, default values
        -- are `MiniSnippets.default_<field>()`.
        expand = {
          -- Resolve raw config snippets at context
          prepare = nil,
          -- Match resolved snippets at cursor position
          match = nil,
          -- Possibly choose among matched snippets
          select = nil,
          -- Insert selected snippet
          insert = nil,
        },
      }
      require("mini.snippets").setup(opts)
    end,
  },
}
