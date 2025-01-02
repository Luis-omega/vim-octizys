vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*.oct" },
  callback = function(ev)
    vim.api.nvim_set_option_value("filetype", "octizys", { buf = ev.buf })
  end
})
