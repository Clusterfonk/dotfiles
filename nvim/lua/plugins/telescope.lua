return {
    "nvim-telescope/telescope.nvim",
    event = "BufReadPre",
    dependencies = {
        { "nvim-lua/plenary.nvim", build="make" },
    },
    opts = function()
        local actions = require("telescope.builtin")
        local theme = require("telescope.themes")

        local minimal = function()
            return require('telescope.themes').get_dropdown({
                borderchars = {
                    { '─', '│', '─', '│', '┌', '┐', '┘', '└'},
                    prompt = {"─", "│", " ", "│", '┌', '┐', "│", "│"},
                    results = {"─", "│", "─", "│", "├", "┤", "┘", "└"},
                    preview = { '─', '│', '─', '│', '┌', '┐', '┘', '└'},
                },
                width = 0.8,
                previewer = false,
                prompt_title = false,
            })
        end

        return {
            pickers = {
                find_files = { 
                    hidden = true,
            },
            defaults = {
                mappings = { i = { ["<esc>"] = actions.close}},
            },
        }}
    end,
    config = function(_, opts)
        require("telescope").setup(opts)
        local builtin = require("telescope.builtin")

        vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
        vim.keymap.set('n', '<leader>gf', builtin.git_files, {})
        vim.keymap.set('n', '<leader>gs', function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") })
        end)
        vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})
    end,
}
