local function start_lua_ls()
    local root_files = { '.luarc.json' }
    local paths = vim.fs.find(root_files, { stop = vim.env.HOME })
    local root_dir = vim.fs.dirname(paths[1])

    if root_dir == nil then
        -- root directory was not found
        return
    end

    vim.lsp.start({
        name = 'lua-language-server',
        cmd = { 'lua-language-server' },
        root_dir = root_dir,
        init_options = { hostInfo = 'neovim' },
    })
end

vim.api.nvim_create_autocmd('FileType', {
    pattern = { 'lua' },
    desc = 'Start lua LSP',
    callback = start_lua_ls,
})
