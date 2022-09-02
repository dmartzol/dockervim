local ok, treesitter_configs = pcall(require, 'nvim-treesitter.configs')
if ok then
    treesitter_configs.setup {
        --ensure_installed = "maintained",
        highlight = { enable = true }
    }
else
    print('nvim-treesitter.configs not found')
end

local ok, telescope = pcall(require, 'telescope')
if not ok then
    print('telescope not found')
  return
end

local ok, utils = pcall(require, 'telescope.utils')
if not ok then
    print('telescope.utils not found')
    return
end

local ok, action_state = pcall(require, 'telescope.actions.state')
if not ok then
    print('telescope.actions.state not found')
    return
end

local ok, builtin = pcall(require, 'telescope.builtin')
if not ok then
    print('telescope.builtin not found')
    return
end

--local ok, my_make_entry = pcall(require, 'user.telescope.my_make_entry')
--if ok then
    --builtin.buffers({
      --entry_maker = my_make_entry.gen_from_buffer_like_leaderf(),
    --})
--else
    --print('my_make_entry not found')
--end


telescope.setup{
    defaults = {
        file_ignore_patterns = {
            ".git/",
            ".cache",
        },
    },
    pickers = {
        lsp_references = { theme = 'cursor' },
        lsp_references = {
            theme = 'ivy',
            --mappings = {
                --i = { ["<CR>"] = "select_tab" },
            --},
        },
        lsp_implementations = {
            theme = 'dropdown',
            layout_config = {
                center = { width = 0.9, height = 0.5 },
            },
            --mappings = {
                --i = { ["<CR>"] = "select_tab" },
            --},
        },
        git_branches = { theme = 'dropdown' },
        find_files = {
            --mappings = {
                --i = { ["<CR>"] = "select_tab" },
            --},
        },
        oldfiles = {
            --mappings = {
                --i = { ["<CR>"] = "select_tab" },
            --},
        },
        marks = {
            --mappings = {
                --i = { ["<CR>"] = "select_tab" }
            --},
        },
        grep_string = {
            word_match = '-w',
            theme = 'dropdown',
            disable_coordinates = true,
        },
        live_grep = {
            disable_coordinates = true,
        },
    },
}

telescope.load_extension('file_browser')
