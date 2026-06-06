return {
    'nvim-treesitter/nvim-treesitter',
    build = ":TSUpdate",
    config = function()
	require("nvim-treesitter").setup({
	    ensure_installed = {
		"lua",
		"python",
		"cpp",
		"c",
		"typescript",
		"tsx",
		"css",
		"nix",
		"rust",
	    },
	    sync_install = false,
	    highlight = { enable = true },
	    indent = { enable = true },
	})
    end
}
