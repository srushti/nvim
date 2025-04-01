return {
  {
    "tamton-aquib/staline.nvim",
    event = "VeryLazy",
    opts = {
      sections = {
        left = {
          "- ",
          "-mode",
          "left_sep_double",
          "file_name",
          "  ",
          "branch",
        },
        mid = { "lsp" },
        right = {
          "cool_symbol",
          "  ",
          vim.bo.fileencoding:upper(),
          "right_sep_double",
          "-line_column",
        },
      },
      defaults = {
        cool_symbol = "  ",
        left_separator = "",
        right_separator = "",
        bg = "#303030",
        full_path = false,
        branch_symbol = " ",
      },
      mode_colors = {
        -- n = "#986fec",
        n = "#d5e285",
        i = "#00d2d2",
        ic = "#e86671",
        c = "#e27d60",
      },
    },
  },
}
