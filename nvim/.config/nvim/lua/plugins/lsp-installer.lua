require("nvim-lsp-installer").setup{}

local lspconfig = require("lspconfig")
lspconfig.sumneko_lua.setup{
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim', 'use' }
      },
      --workspace = {
      -- Make the server aware of Neovim runtime files
      --library = {[vim.fn.expand('$VIMRUNTIME/lua')] = true, [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true}
      --}
    }
  }
}

-- lsp_installer.on_server_ready(function(server)
--   local opts = {}
--   if server.name == "sumneko_lua" then
--     opts = {
--
--     }
--   end
--   server:setup(opts)
-- end)
