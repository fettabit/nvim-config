return {
    {
        'lewis6991/gitsigns.nvim',
        event = 'BufReadPre',
        opts  = {
            signs = {
                add          = { text = '│' },
                change       = { text = '│' },
                delete       = { text = '_' },
                topdelete    = { text = '‾' },
                changedelete = { text = '~' },
                untracked    = { text = '┆' },
            },
            on_attach = function(bufnr)
                local gs  = require('gitsigns')
                local map = function(mode, lhs, rhs, desc)
                    vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
                end

                map('n', ']h',          gs.next_hunk,                                    'Next hunk')
                map('n', '[h',          gs.prev_hunk,                                    'Prev hunk')
                map('n', '<leader>hs',  gs.stage_hunk,                                   'Stage hunk')
                map('n', '<leader>hr',  gs.reset_hunk,                                   'Reset hunk')
                map('n', '<leader>hS',  gs.stage_buffer,                                 'Stage buffer')
                map('n', '<leader>hu',  gs.undo_stage_hunk,                              'Undo stage hunk')
                map('n', '<leader>hR',  gs.reset_buffer,                                 'Reset buffer')
                map('n', '<leader>hp',  gs.preview_hunk_inline,                          'Preview hunk inline')
                map('n', '<leader>hb',  function() gs.blame_line({ full = true }) end,   'Blame line')
                map('n', '<leader>tb',  gs.toggle_current_line_blame,                    'Toggle line blame')
            end,
        },
    },
}
