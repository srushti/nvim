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

vim.cmd([[
  function! SynStack()
  	for id in synstack(line("."), col("."))
      echo synIDattr(id, "name")
    endfor
  endfunc
  ]])
-- nmap <silent><C-S> :call SynStack()<CR>
vim.keymap.set("n", "<C-S>", ":call SynStack()<CR>")
vim.keymap.set("n", "<Enter>", "o<esc>")

vim.keymap.set("n", "<leader>gw", ":Gwrite<cr>")
