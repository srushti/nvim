vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})

vim.api.nvim_create_autocmd({ "BufLeave" }, {
	callback = function()
		local buf = vim.api.nvim_get_current_buf()
		-- Only save if the buffer has a name and has been modified
		if vim.api.nvim_buf_get_name(buf) ~= "" and vim.bo.modified then
			vim.cmd("silent! write")
		end
	end,
})

local lsp_hacks = vim.api.nvim_create_augroup("LspHacks", { clear = true })

vim.api.nvim_create_autocmd({ "BufNewFile", "BufReadPost" }, {
	group = lsp_hacks,
	pattern = ".env*",
	callback = function(e)
		vim.diagnostic.enable(false, { bufnr = e.buf })
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "typescript", "typescriptreact" },
	callback = function()
		vim.opt_local.makeprg = "./node_modules/.bin/tsc | sed 's/(\\(.*\\),\\(.*\\)):/:\\1:\\2:/'"
	end,
})

vim.api.nvim_create_autocmd("LspProgress", {
	callback = function(ev)
		local value = ev.data.params.value or {}
		if not value.kind then
			return
		end

		local status = value.kind == "end" and 0 or 1
		local percent = value.percentage or 0

		local osc_seq = string.format("\27]9;4;%d;%d\a", status, percent)

		if os.getenv("TMUX") then
			osc_seq = string.format("\27Ptmux;\27%s\27\\", osc_seq)
		end

		io.stdout:write(osc_seq)
		io.stdout:flush()
	end,
})
