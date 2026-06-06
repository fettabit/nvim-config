return {
    {
        'williamboman/mason.nvim',
        lazy   = false,
        config = function()
            require('mason').setup()
        end,
    },
    {
        'WhoIsSethDaniel/mason-tool-installer.nvim',
        dependencies = { 'williamboman/mason.nvim' },
        config       = function()
            require('mason-tool-installer').setup({
                ensure_installed = {
                    -- LSP servers (rust-analyzer and nil managed outside Mason)
                    'lua-language-server',
                    'typescript-language-server',
                    'css-lsp',
                    'html-lsp',
                    'emmet-language-server',
                    'clangd',
                    'pyright',
                    -- Formatters
                    'prettier',
                    'black',
                    'clang-format',
                    'stylua',
                },
                auto_update  = false,
                run_on_start = true,
            })
        end,
    },
}
