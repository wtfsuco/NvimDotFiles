return {
	"stevearc/conform.nvim",
	dependencies = { "mason.nvim" },
	lazy = true,
	event = { "BufReadPre", "BufNewFile" },
	cmd = "ConformInfo",
	opts = {
		default_format_opts = {
			timeout_ms = 3000,
			async = false,
			quiet = false,
			lsp_format = "fallback",
		},
		formatters_by_ft = {
			lua = { "ast-grep" },
			javascript = { "prettier" },
			typescript = { "prettier" },
			json = { "prettier" },
			css = { "prettier" },
			html = { "prettier" },
			python = { "black" },
			posgresql = { "pgformatter" } -- ou "ruff_format" se preferir
		},
		formatters = {
			injected = { options = { ignore_errors = true } },
		},
	},
}
