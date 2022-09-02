local ok, bufferline = pcall(require, 'bufferline')
if not ok then
  return
end

bufferline.setup{
    options = {
        mode = "buffers", -- set to "tabs" to only show tabpages instead
        numbers = "ordinal",
        always_show_bufferline = true,
        diagnostics = "nvim_lsp",
        sort_by = 'insert_at_end', -- 'insert_after_current' |'insert_at_end' | 'id' | 'extension' | 'relative_directory' | 'directory' | 'tabs'
    }
}
