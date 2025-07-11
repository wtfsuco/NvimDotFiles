-- Auto format on save com none-ls

vim.api.nvim_create_autocmd("BufWritePre", {
  group = vim.api.nvim_create_augroup("FormatOnSave", { clear = true }),
  callback = function(args)
    local clients = vim.lsp.get_active_clients({ bufnr = args.buf })
    for _, client in ipairs(clients) do
      if client.name == "none-ls" and client.supports_method("textDocument/formatting") then
        vim.lsp.buf.format({
          bufnr = args.buf,
          timeout_ms = 2000,
          filter = function(c)
            return c.name == "none-ls"
          end,
        })
        return
      end
    end
  end,
})

