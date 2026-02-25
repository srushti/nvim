local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "isort", "black" },
    rust = { "rustfmt" },
    typescript = { "biome", "biome-check", "biome-organize-imports" },
    ruby = { "rubocop", "rubocop-autocorrect" },
    elixir = { "mix" },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

return options
