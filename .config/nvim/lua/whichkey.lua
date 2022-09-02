local ok, wk = pcall(require, "which-key")
if not ok then
    print('which-key not found')
    return
end

wk.register({
    ["gb"] = { "<cmd>Telescope buffers<cr>", "buffers" },
    ["<leader>w"] = { "<cmd>w<cr>", "save" },
    ["<leader>8"] = { "<cmd>noh<cr>", "clear selection" },
    ["<leader>`"] = { "ysiw`", "surround w/ backticks" },
    ["<leader>f"] = { name = "+find" },
    ["<leader>fb"] = { "<cmd>Telescope buffers<cr>", "buffers" },
    ["<leader>ff"] = { "<cmd>Telescope find_files hidden=true<cr>", "files" },
    ["<leader>fr"] = { "<cmd>Telescope oldfiles<cr>", "recent files" },
    ["<leader>fs"] = { "<cmd>Telescope find_files cwd=~/dotfiles hidden=true<cr>", "setting files" },
    ["<leader>fn"] = { "<cmd>Telescope find_files cwd=~/notes hidden=true<cr>", "notes" },
    ["<leader>fc"] = { "<cmd>Telescope find_files cwd=~/dotfiles/cheatsheets<cr>", "cheats" },
    ["<leader>s"] = { name = "+strings" },
    ["<leader>ss"] = { "<cmd>SplitjoinSplit<CR>", "split lines" },
    ["<leader>sj"] = { "<cmd>SplitjoinJoin<CR>", "join lines" },
    ["<leader>o"] = { name = "+open" },
    ["<leader>of"] = { "<cmd>enew<cr>", "new file"},
    ["<leader>ou"] = { "<cmd>let @* = expand('<cfile>')<cr>", "url"},
    ["<leader>b"] = { name = "+buffers" },
    ["<leader>bd"] = { "<cmd>bd<CR>", "close buffer" },
    ["<leader>bv"] = { "<cmd>vsplit<CR>", "vertical split" },
    ["<leader>t"] = { name = "+telescope" },
    ["<leader>tg"] = { "<cmd>Telescope live_grep<cr>", "live grep" },
    ["<leader>tG"] = { "<cmd>Telescope grep_string<cr>", "grep string" },
    ["<leader>tf"] = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "fuzzy buffer" },
    ["<leader>tk"] = { "<cmd>Telescope keymaps<cr>", "keymaps" },
    ["<leader>tj"] = { "<cmd>Telescope jumplist<cr>", "jumplist" },
    ["<leader>tt"] = { "<cmd>Telescope<cr>", "Telescope" },
    ["<leader>tT"] = { "<cmd>lua require('telescope').extensions.file_browser.file_browser()<cr>", "file browser" },
    ["<leader>ty"] = { "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "dynamic workspace symbols" },
    ["<leader>tz"] = { "<cmd>lua require('telescope.builtin').lsp_document_symbols()<cr>", "document symbols" },
    ["<leader>th"] = { "<cmd>lua require('telescope.builtin').git_bcommits()<cr>", "file history" },
    ["<leader>tb"] = { "<cmd>Telescope git_branches<cr>", "git branches" },
    ["<leader>tB"] = { "<cmd>Telescope buffers sort_lastused=true<cr>", "buffers" },
    ["<leader>tp"] = { "<cmd>lua require('telescope.builtin').spell_suggest()<cr>", "spelling suggestions" },
    ["<leader>tr"] = { "<cmd>lua require('telescope.builtin').lsp_references()<cr>", "find references" },
    ["<leader>ti"] = { "<cmd>lua require('telescope.builtin').lsp_implementations()<cr>", "find implementations" },
    ["<leader>to"] = { "<cmd>Telescope oldfiles<cr>", "oldfiles" },
    ["<leader>td"] = { "<cmd>lua require('telescope.builtin').diagnostics()<cr>", "diagnostics" },
    ["<leader>tR"] = { "<cmd>lua require('telescope.builtin').registers()<cr>", "registers" },
    ["<leader>ts"] = { "<cmd>lua require('telescope.builtin').git_status()<cr>", "git status" },
    ["<leader>tS"] = { "<cmd>lua require('telescope.builtin').git_stash()<cr>", "git stash" },
    ["<leader>tm"] = { "<cmd>lua require('telescope.builtin').marks()<cr>", "marks" },
    ["<leader>tl"] = { "<cmd>lua require('telescope.builtin').loclist()<cr>", "local list" },
    ["<leader>tH"] = { "<cmd>lua require('telescope.builtin').help_tags()<cr>", "help tags" },
    ["<leader>j"] = { name = "+jumps" },
    ["<leader>jl"] = { "<cmd>Telescope jumplist<cr>", "show jumplist" },
    ["<leader>jc"] = { "<cmd>clearjumps<cr>", "clear jumplist" },
    ["<leader>r"] = { name = "+reload" },
    ["<leader>rr"] = { "<cmd>Reload<cr>", "reload configuration" },
    ["<leader>l"] = { name = "+language" },
    ["<leader>lb"] = { "<cmd>GoBuild<cr>", "go build" },
})
