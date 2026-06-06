return {
    {
        'tpope/vim-fugitive',
    },
    {
        'brenoprata10/nvim-highlight-colors',
        config = function()
            require('nvim-highlight-colors').setup({})
        end,
    },
    {
        'windwp/nvim-autopairs',
        event  = 'InsertEnter',
        config = function()
            require('nvim-autopairs').setup({ check_ts = true })
        end,
    },
    {
        'kylechui/nvim-surround',
        version = '*',
        event   = 'VeryLazy',
        config  = function()
            require('nvim-surround').setup({})
        end,
    },
}
