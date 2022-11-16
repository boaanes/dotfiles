vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, options)
vim.keymap.set('n', 'æd', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', 'ød', vim.diagnostic.goto_prev, opts)

on_attach = function(client, bufnr)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end

require('lspconfig').hls.setup {
    on_attach = on_attach,
    settings = {
        haskell = {
            formattingProvider = "stylish-haskell"
        }
    }
}
require('lspconfig').tsserver.setup {
    on_attach = on_attach
}
require('lspconfig').eslint.setup {
    on_attach = on_attach
}
