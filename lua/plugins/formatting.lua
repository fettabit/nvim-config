return {
    {
        'stevearc/conform.nvim',
        event  = 'BufWritePre',
        config = function()
            require('conform').setup({
                formatters_by_ft = {
                    lua        = { 'stylua' },
                    python     = { 'black' },
                    javascript = { 'prettier' },
                    javascriptreact  = { 'prettier' },
                    typescript = { 'prettier' },
                    typescriptreact  = { 'prettier' },
                    css        = { 'prettier' },
                    scss       = { 'prettier' },
                    less       = { 'prettier' },
                    c          = { 'clang_format' },
                    cpp        = { 'clang_format' },
                    rust       = { 'rustfmt' },
                },
                format_on_save = {
                    timeout_ms   = 3000,
                    lsp_fallback = true,
                },
            })
        end,
    },
}
