return {
  {
    "yarospace/dev-tools.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" }, -- code manipulation in buffer
    specs = {
      {
        "folke/snacks.nvim",
        opts = {
          picker = { enabled = true }, -- actions picker
          terminal = { enabled = true }, -- terminal for running spec actions
        },
      },
      {
        "ThePrimeagen/refactoring.nvim", -- refactoring library
        dependencies = { "nvim-lua/plenary.nvim" },
      },
    },

    opts = {
      ---@type Action[]|fun():Action[]
      actions = {},

      filetypes = { -- filetypes for which to attach the LSP
        include = {}, -- {} to include all
        exclude = {},
      },

      builtin_actions = {
        include = {}, -- filetype/group/name of actions to include or {} to include all
        exclude = {}, -- filetype/group/name of actions to exclude or true to exclude all
      },

      action_opts = { -- override options for actions
        {
          group = "Debugging",
          name = "Log vars under cursor",
          opts = {
            keymap = nil, -- action keymap, e.g.
            -- {
            --   global = "<leader>dl" | { "<leader>dl", mode = { "n", "x" } },
            --   picker = "<M-l>",
            --   hide = true,  -- hide the action from the picker
            -- }
          },
        },
      },

      ui = {
        override = true, -- override vim.ui.select
        group_actions = true, -- group actions by group name
      },
    },
  },
}
