return {
    {
        "simrat39/rust-tools.nvim",
        config = function()
            local rt = require("rust-tools")
            local mason_reg = require("mason-registry")

            local codelldb = mason_reg.get_package("codelldb")
            local ext_path = codelldb:get_install_path() .. "/extension/"
            local codelldb_path = ext_path .. "adapter/codelldb"
            local liblldb_path = ext_path .. "lldb/lib/liblldb.dylib"

            local capabilities = require('cmp_nvim_lsp').default_capabilities()
            rt.setup({
                server = {
                    on_attach = function(_, bufnr)
                        vim.keymap.set("n", "K", rt.hover_actions.hover_actions, { buffer = bufnr })
                        vim.keymap.set("n", "<leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
                    end,
                    capabilities = capabilities
                },
                inlay_hints = {
                    auto = true,
                },
                tools = {
                    hover_actions = {
                        auto_focus = true,
                    }
                },
                dap = {
                    adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path),
                }
            })
        end
    },
    {
        "rust-lang/rust.vim",
        ft = "rust",
        init = function ()
            vim.g.rustfmt_autosave = 1
        end
    }
}
