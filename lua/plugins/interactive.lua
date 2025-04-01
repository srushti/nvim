return {
  {
    "Vigemus/iron.nvim",
    cmd = {
      "IronRepl",
      "IronReplHere",
      "IronRestart",
      "IronSend",
      "IronFocus",
      "IronHide",
      "IronWatch",
      "IronAttach",
    },
    keys = {
      { "<leader>ir", "<cmd>IronRepl<cr>" },
      { "<leader>is", "<cmd>IronRestart<cr>" },
      { "<leader>if", "<cmd>IronFocus<cr>" },
      { "<leader>ih", "<cmd>IronHide<cr>" },
    },
    main = "iron.core", -- <== This informs lazy.nvim to use the entrypoint of `iron.core` to load the configuration.
    opts = {
      config = {
        repl_open_cmd = "vertical botright 80 split",
        -- Whether a repl should be discarded or not
        scratch_repl = true,
        -- Your repl definitions come here
        repl_definition = {
          sh = {
            -- Can be a table or a function that
            -- returns a table (see below)
            command = { "fish" },
          },
          lua = {
            command = { "fish" },
          },
          typescript = {
            command = { "node" },
          },
        },
        -- How the repl window will be displayed
        -- See below for more information
        -- repl_open_cmd = require('iron.view').bottom(40),
      },
      -- Iron doesn't set keymaps by default anymore.
      -- You can set them here or manually add keymaps to the functions in iron.core
      keymaps = {},
      -- If the highlight is on, you can change how it looks
      -- For the available options, check nvim_set_hl
      highlight = { italic = true },
      ignore_blank_lines = true, -- ignore blank lines when sending visual select lines
    },
  },
  {
    "akinsho/toggleterm.nvim",
    config = function()
      require("toggleterm").setup({})
    end,
    cmd = { "ToggleTerm" },
    keys = {
      { "<leader>it", ":ToggleTerm<cr>", desc = "Toggle Terminal", silent = true, unique = true, mode = "n" },
    },
  },
}
