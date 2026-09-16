-- leap.nvim -- managed by vim.pack. Loaded automatically by lua/config/pack.lua.

vim.pack.add({
	{
		src = "https://codeberg.org/andyg/leap.nvim",
		-- Pin to a branch/tag/commit for reproducible installs. Update deliberately.
		version = "main",
	},
})

-- vim.pack installs into pack/core/opt/ (optional), so the plugin's plugin/ scripts
-- are NOT auto-sourced -- and it's those scripts that define <Plug>(leap) et al.
-- Explicitly packadd to source them; without this, the <Plug> targets below don't
-- exist and every mapping silently falls through to the builtin key.
vim.cmd("packadd leap.nvim")

-- leap.nvim keymaps. See `:h leap-mappings`, `:h leap.visit-mappings`.
-- `s`/`S` are deliberately kept as builtin Vim (Substitute / change-line).
--
-- These MUST be set on VeryLazy, not at startup: LazyVim loads its core keymaps
-- (including L = <cmd>bnext<cr>, the "Next Buffer" mapping) on the VeryLazy event,
-- which fires AFTER this file runs during startup. Setting L here directly would be
-- clobbered by LazyVim a moment later. Deferring to VeryLazy makes leap win.
vim.api.nvim_create_autocmd("User", {
	pattern = "VeryLazy",
	group = vim.api.nvim_create_augroup("LeapMappings", {}),
	callback = function()
		-- Jump. `s`/`S`/`L` are intentionally left as builtins (s = Substitute,
		-- S = change line, L = bottom-of-screen / LazyVim Next-Buffer).
		-- `gl` ("go leap") is unmapped in this config, so it collides with nothing.
		vim.keymap.set({ "n", "x", "o" }, "gl", "<Plug>(leap)")
		vim.keymap.set({ "n", "x", "o" }, "gL", "<Plug>(leap-from-window)")

		-- Visit (jump - operate - jump back)
		vim.keymap.set({ "n", "x", "o" }, "gs", "<Plug>(leap-visit)")
		vim.keymap.set({ "x", "o" }, "ar", "<Plug>(leap-visit-text-object)")
		vim.keymap.set({ "x", "o" }, "ir", "<Plug>(leap-visit-inner-text-object)")

		vim.keymap.set("o", "rr", function() -- "visit line" shortcut
			return (vim.v.count == 0 and "1" or "") .. "<Plug>(leap-visit)"
		end, { expr = true })

		-- Treeselect
		vim.keymap.set({ "x", "o" }, "an", function()
			require("leap.treesitter").select({
				opts = require("leap.user").with_traversal_keys("n", "N"),
			})
		end)
	end,
})

-- Automatic paste on return.
vim.api.nvim_create_autocmd("User", {
	pattern = "VisitDone",
	group = vim.api.nvim_create_augroup("Visit", {}),
	callback = function(event)
		if (event.data.mode:match("^[vV\22]") or (vim.v.operator == "y")) and event.data.register == '"' then
			vim.cmd("normal! p")
		end
	end,
})
