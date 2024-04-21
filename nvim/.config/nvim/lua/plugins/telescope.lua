return {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    version = false,
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    keys = {
        { "<leader>pf", mode = "n", "<cmd>Telescope find_files<CR>", desc = "Search files" },
        { "<C-p>",      mode = "n", "<cmd>Telescope git_files<CR>",  desc = "Search git files" },
        {
            "<leader>ps",
            mode = "n",
            function()
                require("telescope.builtin").grep_string({ cwd = vim.fn.input("Grep > ") })
            end,
            desc = "Search string",
        },
    }
}
