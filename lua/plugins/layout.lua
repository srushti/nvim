return {
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
