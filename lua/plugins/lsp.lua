return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        vtsls = {
          -- Explicitly enable vtsls for TypeScript
          enabled = true,
          -- Force Mason to manage this
          mason = true,
          -- Ensure diagnostics are enabled in vtsls settings
          settings = {
            vtsls = {
              -- Enable experimental features including better diagnostics
              experimental = {
                completion = {
                  enableServerSideFuzzyMatch = true,
                },
              },
            },
            typescript = {
              -- TypeScript-specific settings to ensure diagnostics work
              preferences = {
                includeInlayParameterNameHints = "all",
                includeInlayParameterNameHintsWhenArgumentMatchesName = true,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHints = true,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayEnumMemberValueHints = true,
              },
              -- Explicitly enable diagnostics
              diagnostics = {
                ignoredCodes = {},
              },
              suggest = {
                completeFunctionCalls = true,
              },
            },
            javascript = {
              preferences = {
                includeInlayParameterNameHints = "all",
                includeInlayParameterNameHintsWhenArgumentMatchesName = true,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHints = true,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayEnumMemberValueHints = true,
              },
              diagnostics = {
                ignoredCodes = {},
              },
            },
          },
        },
        tsserver = {
          enabled = false,
        },
        ts_ls = {
          enabled = false,
        },
      },
    },
  },
}
