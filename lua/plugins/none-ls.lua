return {
  "jose-elias-alvarez/null-ls.nvim",
  dependencies = {
    "williamboman/mason.nvim",
    "jay-babu/mason-null-ls.nvim",
  },
  config = function()
    require("mason-null-ls").setup({
      ensure_installed = {
        "prettier",
        "black",
        "flake8",
        "eslint",
      },
      automatic_setup = true,
    })

    local null = require("null-ls")

    null.setup({
      sources = {
        -- Formatters
        null.builtins.formatting.prettier,
        null.builtins.formatting.black,

        -- Linters
        null.builtins.diagnostics.flake8,
        null.builtins.diagnostics.eslint,
      },
    })
  end
}

