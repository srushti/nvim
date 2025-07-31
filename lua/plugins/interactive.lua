return {
  {
    "nvzone/floaterm",
    dependencies = { "nvzone/volt" },
    event = "VeryLazy",
    keys = {
      { "<leader>iT", "<cmd>FloatermToggle<cr>", desc = "Toggle Floaterm" },
      { "<leader>iF", "<cmd>FloatermFind<cr>", desc = "Find Floaterm" },
    },
  },
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
      { "<leader>ip", "<cmd>IronRepl<cr>", desc = "IronRepl" },
      { "<leader>is", "<cmd>IronRestart<cr>", desc = "IronRestart" },
      { "<leader>if", "<cmd>IronFocus<cr>", desc = "IronFocus" },
      { "<leader>ih", "<cmd>IronHide<cr>", desc = "IronHide" },
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
    "waiting-for-dev/ergoterm.nvim",
    event = "VeryLazy",
    config = function(opts)
      require("ergoterm").setup(opts)
    end,
    cmd = { "TermNew", "TermSelect" },
    keys = {
      { "<leader>it", "<cmd>TermNew<cr>", desc = "New Term" },
      { "<leader>iS", "<cmd>TermSelect<cr>", desc = "Find Term" },
    },
  },
  { "xb-bx/editable-term.nvim", config = true },
  {
    "stevearc/overseer.nvim",
    opts = {},
    keys = {
      { "<leader>io", ":OverseerToggle<cr>", desc = "Overseer Toggle", silent = true, unique = true, mode = "n" },
      { "<leader>ir", ":OverseerRun<cr>", desc = "Overseer Run", silent = true, unique = true, mode = "n" },
      {
        "<leader>iR",
        ":OverseerRestartLast<cr>",
        desc = "Overseer Restart Last",
        silent = true,
        unique = true,
        mode = "n",
      },
    },
  },
}
