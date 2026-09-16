-- Auto-loader for plugins managed by vim.pack (nvim 0.12+), independent of
-- lazy.nvim/LazyVim. Migration staging ground: move plugins off lazy one at a time.
--
-- To add a plugin: drop a new file in lua/pack/<name>.lua. That's it -- no edit to
-- init.lua or this file. Each pack file is self-contained: it calls vim.pack.add,
-- packadd's the plugin (see note below), and sets its own keymaps/autocmds.
--
-- vim.pack has no lockfile; the `version` field in each spec IS the pin.

-- lazy.nvim rewrites `packpath` to a minimal set during setup, which strips the
-- default site dir where vim.pack installs plugins (pack/core/opt/*). Without it,
-- vim.pack.add's :packadd step fails with E919. Restore it once, here, for all
-- pack files. (Done before requiring any pack file so they can packadd freely.)
local site = vim.fn.stdpath("data") .. "/site"
if not vim.tbl_contains(vim.opt.packpath:get(), site) then
	vim.opt.packpath:append(site)
end

-- Require every lua/pack/*.lua module, sorted for deterministic load order.
-- Uses the runtimepath so it works regardless of cwd, and only this config's
-- lua/pack (config dir is first on rtp) -- not some other rtp entry's pack/.
local config_pack = vim.fn.stdpath("config") .. "/lua/pack"
local files = vim.fn.globpath(config_pack, "*.lua", false, true)
table.sort(files)
for _, file in ipairs(files) do
	local name = vim.fn.fnamemodify(file, ":t:r") -- basename without .lua
	local ok, err = pcall(require, "pack." .. name)
	if not ok then
		vim.notify(("pack: failed to load pack.%s\n%s"):format(name, err), vim.log.levels.ERROR)
	end
end
