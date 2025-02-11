vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function(args)
    require("conform").format({ bufnr = args.buf })
  end,
})

vim.api.nvim_create_autocmd(
  { "BufLeave" },
  { desc = "Write all files on changing buffers", nested = true, command = ":wa" }
)

vim.api.nvim_create_autocmd(
  { "FileType" },
  { pattern = "qf", desc = "QuickFix <leader><Enter>", nested = true, command = ":nnoremap <leader><Enter> :.cc<cr>" }
)

vim.api.nvim_create_autocmd("BufRead", {
  callback = function(ev)
    if vim.bo[ev.buf].buftype == "quickfix" then
      vim.schedule(function()
        vim.cmd([[cclose]])
        vim.cmd([[Trouble qflist open]])
      end)
    end
  end,
})
