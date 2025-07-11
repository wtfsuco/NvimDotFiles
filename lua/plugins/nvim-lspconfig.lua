return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",

    -- dependência obrigatória para cmp-nvim-lsp funcionar
    { "hrsh7th/nvim-cmp" },

    -- conecta o cmp ao LSP
    { "hrsh7th/cmp-nvim-lsp" },
  },
  config = function()
    local lspconfig = require("lspconfig")
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    mason.setup()
    mason_lspconfig.setup({
      ensure_installed = { "lua_ls", "pyright" },
    })

    local capabilities = cmp_nvim_lsp.default_capabilities()

    local on_attach = function(client, bufnr)
      local keymap = vim.keymap.set
      local opts = { noremap = true, silent = true, buffer = bufnr }

      keymap("n", "gd", vim.lsp.buf.definition, opts)
      keymap("n", "K", vim.lsp.buf.hover, opts)
      keymap("n", "gr", vim.lsp.buf.references, opts)
      keymap("n", "<leader>rn", vim.lsp.buf.rename, opts)
      keymap("n", "<leader>ca", vim.lsp.buf.code_action, opts)

      if vim.lsp.inlay_hint then
        vim.lsp.inlay_hint.enable(bufnr, true)
      end
    end

    local servers = {
      lua_ls = {
        settings = {
          Lua = {
            workspace = { checkThirdParty = false },
            diagnostics = { globals = { "vim" } },
          },
        },
      },
      pyright = {},
      tsserver = {},
    }

    --mason_lspconfig.setup_handlers({
    --  function(server_name)
    --    lspconfig[server_name].setup({
    --      capabilities = capabilities,
    --      on_attach = on_attach,
    --      settings = servers[server_name] and servers[server_name].settings or {},
    --    })
    --  end,
    --})

    local signs = { Error = "", Warn = "", Hint = "󰠠", Info = "" }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
    end

    vim.diagnostic.config({
      virtual_text = { prefix = "●" },
      signs = true,
      underline = true,
      update_in_insert = false,
      severity_sort = true,
    })
  end,
}

