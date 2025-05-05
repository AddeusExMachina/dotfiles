local function start_gopls()
    local root_files = { 'go.mod' }
    local paths = vim.fs.find(root_files, { stop = vim.env.HOME })
    local root_dir = vim.fs.dirname(paths[1])

    if root_dir == nil then
        -- root directory was not found
        return
    end

    vim.lsp.start({
        name = 'gopls',
        cmd = { os.getenv('HOME') .. '/.local/share/nvim/language-servers/gopls/bin/gopls' },
        root_dir = root_dir,
    })
end

vim.api.nvim_create_autocmd('FileType', {
    pattern = { 'go', 'gomod', 'gowork', 'gotmpl' },
    desc = 'Start go LSP',
    callback = start_gopls,
})
