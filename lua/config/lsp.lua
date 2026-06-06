vim.diagnostic.config({
    virtual_text  = true,
    severity_sort = true,
    float         = {
        style  = 'minimal',
        border = 'rounded',
        source = 'if_many',
        header = '',
        prefix = '',
    },
    signs         = {
        text = {
            [vim.diagnostic.severity.ERROR] = '✘',
            [vim.diagnostic.severity.WARN]  = '▲',
            [vim.diagnostic.severity.HINT]  = '⚑',
            [vim.diagnostic.severity.INFO]  = '»',
        },
    },
})

local orig = vim.lsp.util.open_floating_preview
---@diagnostic disable-next-line: duplicate-set-field
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
    opts            = opts or {}
    opts.border     = opts.border or 'rounded'
    opts.max_width  = opts.max_width or 80
    opts.max_height = opts.max_height or 24
    opts.wrap       = opts.wrap ~= false
    return orig(contents, syntax, opts, ...)
end

vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('my.lsp', {}),
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        local buf    = args.buf
        local map    = function(mode, lhs, rhs) vim.keymap.set(mode, lhs, rhs, { buffer = buf }) end

        map('n', 'K',             vim.lsp.buf.hover)
        map('n', 'gd',            vim.lsp.buf.definition)
        map('n', 'gD',            vim.lsp.buf.declaration)
        map('n', 'gi',            vim.lsp.buf.implementation)
        map('n', 'go',            vim.lsp.buf.type_definition)
        map('n', 'gr',            vim.lsp.buf.references)
        map('n', 'gs',            vim.lsp.buf.signature_help)
        map('n', 'gl',            vim.diagnostic.open_float)
        map('n', '<F2>',          vim.lsp.buf.rename)
        map({ 'n', 'x' }, '<F3>', function() vim.lsp.buf.format({ async = true }) end)
        map('n', '<F4>',          vim.lsp.buf.code_action)

        if client and client:supports_method('textDocument/inlayHint') then
            vim.lsp.inlay_hint.enable(true, { bufnr = buf })
        end
    end,
})

vim.lsp.config['luals'] = {
    cmd          = { 'lua-language-server' },
    filetypes    = { 'lua' },
    root_markers = { '.luarc.json', '.luarc.jsonc', '.git' },
    settings     = {
        Lua = {
            runtime     = { version = 'LuaJIT' },
            diagnostics = { globals = { 'vim' } },
            workspace   = {
                checkThirdParty = false,
                library         = vim.api.nvim_get_runtime_file('', true),
            },
            telemetry   = { enable = false },
        },
    },
}

vim.lsp.config['ts_ls'] = {
    cmd          = { 'typescript-language-server', '--stdio' },
    filetypes    = {
        'javascript', 'javascriptreact', 'javascript.jsx',
        'typescript', 'typescriptreact', 'typescript.tsx',
    },
    root_markers = { 'package.json', 'tsconfig.json', 'jsconfig.json', '.git' },
}

vim.lsp.config['cssls'] = {
    cmd          = { 'vscode-css-language-server', '--stdio' },
    filetypes    = { 'css', 'scss', 'less' },
    root_markers = { 'package.json', '.git' },
    settings     = {
        css  = { validate = true },
        scss = { validate = true },
        less = { validate = true },
    },
}

vim.lsp.config['html'] = {
    cmd          = { 'vscode-html-language-server', '--stdio' },
    filetypes    = { 'html' },
    root_markers = { 'package.json', '.git' },
    settings     = {},
}

vim.lsp.config['emmet_language_server'] = {
    cmd          = { 'emmet-language-server', '--stdio' },
    filetypes    = { 'html', 'css', 'scss', 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
    root_markers = { 'package.json', '.git' },
}

vim.lsp.config['rust_analyzer'] = {
    cmd          = { 'rust-analyzer' },
    filetypes    = { 'rust' },
    root_markers = { 'Cargo.toml', 'rust-project.json', '.git' },
    settings     = {
        ['rust-analyzer'] = {
            cargo       = { allFeatures = true },
            checkOnSave = { command = 'clippy' },
        },
    },
}

vim.lsp.config['clangd'] = {
    cmd          = { 'clangd' },
    filetypes    = { 'c', 'cpp', 'objc', 'objcpp' },
    root_dir     = function(bufnr, on_dir)
        local fname = vim.api.nvim_buf_get_name(bufnr)
        on_dir(vim.fs.root(fname, { 'compile_commands.json', '.clangd', 'Makefile', '.git' })
            or vim.fn.fnamemodify(fname, ':h'))
    end,
    init_options = {
        fallbackFlags = { '-std=c11' },
    },
}

vim.lsp.config['nil_ls'] = {
    cmd          = { 'nil' },
    filetypes    = { 'nix' },
    root_markers = { 'flake.nix', 'default.nix', '.git' },
}

vim.lsp.config['pyright'] = {
    cmd          = { 'pyright-langserver', '--stdio' },
    filetypes    = { 'python' },
    root_markers = { 'pyproject.toml', 'setup.py', 'setup.cfg', '.git' },
}

vim.filetype.add({
    extension = { h = 'c' },
})

-- VimEnter fires after init.lua and all lazy startup plugin loading.
-- By this point cmp-nvim-lsp (lazy=false) is available.
vim.api.nvim_create_autocmd('VimEnter', {
    once     = true,
    callback = function()
        local caps = vim.lsp.protocol.make_client_capabilities()
        local ok, cmp_lsp = pcall(require, 'cmp_nvim_lsp')
        if ok then
            caps = vim.tbl_deep_extend('force', caps, cmp_lsp.default_capabilities())
        end
        vim.lsp.config('*', {
            root_markers = { '.git' },
            capabilities = caps,
        })
        ---@diagnostic disable-next-line: invisible
        for name, _ in pairs(vim.lsp.config._configs) do
            if name ~= '*' then
                vim.lsp.enable(name)
            end
        end
        -- Re-fire FileType for any buffer already open (startup file) so the
        -- server attaches — FileType ran before vim.lsp.enable() was called.
        for _, buf in ipairs(vim.api.nvim_list_bufs()) do
            if vim.api.nvim_buf_is_loaded(buf) and vim.bo[buf].filetype ~= '' then
                vim.api.nvim_exec_autocmds('FileType', { buffer = buf })
            end
        end
    end,
})
