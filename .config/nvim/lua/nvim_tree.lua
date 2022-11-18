require('nvim-tree').setup({
    view = {
        adaptive_size = true
    },
    renderer = {
        group_empty = true,
    },
    filters = {
        dotfiles = false
    }
})
