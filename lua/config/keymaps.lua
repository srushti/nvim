vim.keymap.set("n", "<leader>w", ":w<cr>", { noremap = true, silent = true, unique = true })
vim.api.nvim_create_user_command("Format", function(args)
  local range = nil
  if args.count ~= -1 then
    local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
    range = {
      start = { args.line1, 0 },
      ["end"] = { args.line2, end_line:len() },
    }
  end
  require("conform").format({ async = true, lsp_format = "fallback", range = range })
end, { range = true })

vim.keymap.set(
  "n",
  "<leader><c-s>",
  ":TSHighlightCapturesUnderCursor<CR>",
  { desc = "Check highlights", silent = true, unique = true }
)
vim.keymap.set("i", "uu", "_", { desc = "Insert mode underscore", silent = true, unique = true })
vim.keymap.set("i", "hh", "=>", { desc = "Insert mode hashrocket", silent = true, unique = true })
vim.keymap.set("i", "--", "->", { desc = "Insert mode arrow", silent = true, unique = true })
vim.keymap.set("i", "aa", "@", { desc = "Insert mode @", silent = true, unique = true })

vim.keymap.set("n", "<Enter>", "o<esc>", { desc = "Insert newline below", silent = true })
vim.keymap.set("n", "<C-j>", "ddp")
vim.keymap.set("n", "<C-k>", "kddpk")
