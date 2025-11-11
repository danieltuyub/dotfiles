return {
    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
    { "nvim-lua/plenary.nvim" },
    { "nvim-telescope/telescope.nvim" },
    { "nvim-tree/nvim-web-devicons" },
    { "nvim-lualine/lualine.nvim", config = function()
        require("lualine").setup({ options = { theme = "auto" } })
    end },
    { "folke/tokyonight.nvim", priority = 1000, config = function()
        vim.cmd.colorscheme("tokyonight-night")
    end },
}
