-- vim.api.nvim_create_autocmd({ "BufWritePre" }, { command = ":Prettier" })
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function(args)
    require("conform").format({ bufnr = args.buf })
  end,
})

vim.api.nvim_create_autocmd(
  { "FileType" },
  { pattern = "qf", desc = "QuickFix <leader><Enter>", nested = true, command = ":nnoremap <leader><Enter> :.cc<cr>" }
)
