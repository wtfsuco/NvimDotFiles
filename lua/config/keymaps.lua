local keymap = vim.keymap.set
local opts = {noremap = true, silent = true}

vim.g.mapleader = " "
vim.g.maplocalleader = " "

--Normal mode
keymap("n", "<leader>cF", function()
	require("config.conform").format({formatters = { "injected" }, timeout_ms = 3000})
end, {desc="Format injected langs", opts[0], opts[1]})
keymap("n", "<leader>cf", function()
	require("config.conform").format()
end, {desc="Format file", opts[0], opts[1]})
keymap("n", "<leader>D", ":DBUIToggle<CR>", {desc = "Toggle DBUI", opts[0], opts[1]})
map("n", "]h", function()
				if vim.wo.diff then
					vim.cmd.normal({ "]c", bang = true })
				else
					gs.nav_hunk("next")
				end
			end, "Next Hunk")
keymap("n", "[h", function()
	if vim.wo.diff then
		vim.cmd.normal({ "[c", bang = true })
	else
		gs.nav_hunk("prev")
	end
end, "Prev Hunk")
keymap("n", "]H", function()
	gs.nav_hunk("last")
			end, "Last Hunk")
			keymap("n", "[H", function()
				gs.nav_hunk("first")
			end, "First Hunk")
			keymap({ "n", "v" }, "<leader>ghs", ":Gitsigns stage_hunk<CR>", "Stage Hunk")
			keymap({ "n", "v" }, "<leader>ghr", ":Gitsigns reset_hunk<CR>", "Reset Hunk")
			keymap("n", "<leader>ghS", gs.stage_buffer, "Stage Buffer")
			keymap("n", "<leader>ghu", gs.undo_stage_hunk, "Undo Stage Hunk")
			keymap("n", "<leader>ghR", gs.reset_buffer, "Reset Buffer")
			keymap("n", "<leader>ghp", gs.preview_hunk_inline, "Preview Hunk Inline")
			keymap("n", "<leader>ghb", function()
				gs.blame_line({ full = true })
			end, "Blame Line")
			keymap("n", "<leader>ghB", function()
				gs.blame()
			end, "Blame Buffer")
			keymap("n", "<leader>ghd", gs.diffthis, "Diff This")
			keymap("n", "<leader>ghD", function()
				gs.diffthis("~")
			end, "Diff This ~")
			keymap({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "GitSigns Select Hunk")
		end

--Visual mode


--Terminal mode


--Insert mode
