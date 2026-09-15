return {
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				vtsls = {
					enabled = true,
					mason = true,
					settings = {
						vtsls = {
							autoUseWorkspaceTsdk = true,
							tsserver = {
								globalPlugins = {},
							},
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
