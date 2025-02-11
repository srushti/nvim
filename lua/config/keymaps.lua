vim.keymap.set("n", "<leader>w", ":wa<cr>", { noremap = true, silent = true })
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

vim.keymap.set("n", "<c-S>", ":TSHighlightCapturesUnderCursor<CR>", { desc = "Check highlights", silent = true })
vim.keymap.set("i", "uu", "_")
vim.keymap.set("i", "hh", "=>")
vim.keymap.set("i", "--", "->")
vim.keymap.set("i", "aa", "@")

vim.keymap.set("n", "<Enter>", "o<esc>")

vim.keymap.set("n", "<leader>gw", ":Gwrite<cr>")
