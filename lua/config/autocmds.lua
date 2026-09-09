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

		if os.getenv("TMUX") then
			-- DCS passthrough: double the ESC, use ST (\033\\) not BEL as inner terminator
			local osc_seq = string.format("\27Ptmux;\27\27]9;4;%d;%d\27\27\\\27\\", status, percent)
			vim.api.nvim_chan_send(2, osc_seq)
		else
			local osc_seq = string.format("\27]9;4;%d;%d\27\\", status, percent)
			vim.api.nvim_chan_send(2, osc_seq)
		end
	end,
})
