local M = {}

function M.setup()
    -- Mappings.
    -- See `:help vim.diagnostic.*` for documentation on any of the below functions
    local global_opts = { noremap = true, silent = true }
    vim.api.nvim_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', global_opts)
    vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', global_opts)
    vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', global_opts)
    vim.api.nvim_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', global_opts)
    local lsp_installer = require("nvim-lsp-installer")
    -- Include the servers you want to have installed by default below
    local servers = {
        "pyright",
        "rust_analyzer",
        "sumneko_lua",
    }
    for _, name in pairs(servers) do
        local server_is_found, server = lsp_installer.get_server(name)
        if server_is_found and not server:is_installed() then
            print("Installing " .. name)
            server:install()
        end
    end
    -- nvim-cmp supports additional completion capabilities
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
    -- Use an on_attach function to only map the following keys
    -- after the language server attaches to the current buffer
    local on_attach = function(client, bufnr)
        -- Enable completion triggered by <c-x><c-o>
        vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
        local opts = { noremap = true, silent = true }
        -- Mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'v', '<space>f', '<cmd>lua vim.lsp.buf.range_formatting()<CR>', opts)
    end
    lsp_installer.on_server_ready(function(server)
        local opts = { on_attach = on_attach, capabilities = capabilities }
        if server.name == "rust_analyzer" then
            require("rust-tools").setup {
                server = vim.tbl_deep_extend("force", server:get_default_options(), opts),
            }
            server:attach_buffers()
            -- Only if standalone support is needed
            require("rust-tools").start_standalone_if_required()
        elseif server.name == "pyright" then
            server:setup(vim.tbl_deep_extend("force", opts, {
                settings = {
                    python = {
                        analysis = {
                            typeCheckingMode = "off",
                            diagnosticMode = "openFilesOnly",
                        }
                    }
                }
            }))
        else
            server:setup(opts)
        end
    end)
    local null_ls = require("null-ls")
    null_ls.setup({
        on_attach = on_attach,
        sources = {
            null_ls.builtins.formatting.autopep8,
            null_ls.builtins.diagnostics.flake8,
            null_ls.builtins.diagnostics.mypy,
        },
    })
end

return M
