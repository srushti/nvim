-- vim.api.nvim_create_autocmd({ "BufWritePre" }, { command = ":Prettier" })
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function(args)
    require("conform").format({ bufnr = args.buf })
  end,
})
