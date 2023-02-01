-- Format haskell on save
vim.cmd([[ autocmd BufWritePre *.hs lua vim.lsp.buf.formatting_sync(nil, 100) ]])

-- for signs in gutter --
local signs = {
  { name = "DiagnosticSignError", text = "" },
  { name = "DiagnosticSignWarn", text = "" },
  { name = "DiagnosticSignHint", text = "" },
  { name = "DiagnosticSignInfo", text = "" },
}

for _, sign in ipairs(signs) do
  vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end
--
-- for tab completion --
local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local feedkey = function(key, mode)
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end
------------------------

-- prettier null-ls --
local null_ls = require("null-ls")
local sources = { null_ls.builtins.formatting.prettierd }
null_ls.setup({ sources = sources })
----------------------


local lsp_formatting = function(bufnr)
    vim.lsp.buf.format({
        filter = function(client)
            -- apply whatever logic you want (in this example, we'll only use null-ls)
            return client.name == "null-ls"
        end,
        bufnr = bufnr,
    })
end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local custom_lsp_attach = function(client, bufnr)
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
    vim.keymap.set("n", ",d", function () vim.diagnostic.open_float({scope = 'cursor'}) end, { silent = true, noremap = true })
    vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, options)
    vim.keymap.set('n', 'æd', vim.diagnostic.goto_next, options)
    vim.keymap.set('n', 'ød', vim.diagnostic.goto_prev, options)

    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    if client.supports_method("textDocument/formatting") then
        vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
        vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
                lsp_formatting(bufnr)
            end,
        })
    end
end

local cmp = require('cmp')

cmp.setup {
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
                elseif vim.fn["vsnip#available"](1) == 1 then
                    feedkey("<Plug>(vsnip-expand-or-jump)", "")
                elseif has_words_before() then
                    cmp.complete()
                else
                    fallback()
            end
        end, { "i", "s" }),

        ["<S-Tab>"] = cmp.mapping(function()
            if cmp.visible() then
                cmp.select_prev_item()
            elseif vim.fn["vsnip#jumpable"](-1) == 1 then
                feedkey("<Plug>(vsnip-jump-prev)", "")
            end
        end, { "i", "s" }),

        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
    }),
    sources = {
        { name = 'nvim_lsp' }
    }
}

local cmp_capabilities = require('cmp_nvim_lsp').default_capabilities()

require('mason-lspconfig').setup_handlers({
    function(server_name)
        require('lspconfig')[server_name].setup {
            on_attach = custom_lsp_attach,
            capabilities = cmp_capabilities
        }
    end,
    ["eslint"] = function()
        require('lspconfig')["eslint"].setup {
            on_attach = custom_lsp_attach,
            capabilities = cmp_capabilities,
            cmd = { "eslint_d", "--stdin" }
        }
    end,
    ["tsserver"] = function()
        require('typescript').setup {
            server = {
                on_attach = function(client, bufnr)
                    vim.keymap.set("n", ",to", require('typescript').actions.organizeImports, { silent = true })
                    vim.keymap.set("n", ",tu", require('typescript').actions.removeUnused, { silent = true })
                    vim.keymap.set("n", ",ta", require('typescript').actions.addMissingImports, { silent = true })
                    vim.api.nvim_buf_set_keymap(bufnr, "n", ",tr", ':TypescriptRenameFile<CR>', {})
                    vim.keymap.set("n", ",tf", require('typescript').actions.fixAll, { silent = true })
                    custom_lsp_attach(client, bufnr)
                end,
                capabilities = cmp_capabilities
            }
        }
    end,
    ["sumneko_lua"] = function()
        require('lspconfig')["sumneko_lua"].setup {
            on_attach = custom_lsp_attach,
            capabilities = cmp_capabilities,
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { 'vim' }
                    },
                }
            }
        }
    end,
})

require('lspconfig').hls.setup {
    on_attach = custom_lsp_attach,
    settings = {
        haskell = {
            formattingProvider = "stylish-haskell"
        }
    },
    capabilities = cmp_capabilities
}

