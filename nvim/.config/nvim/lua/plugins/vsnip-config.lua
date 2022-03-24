local g = vim.g

-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities.textDocument.completion.completionItem.snippetSupport = true

vim.cmd([[
  let g:vsnip_filetypes = {}
  let g:vsnip_filetypes.javascript = ['javascript', 'react']
  let g:vsnip_filetypes.javascriptreact = ['javascript', 'react']
  let g:vsnip_filetypes.typescriptreact = ['typescript', 'react-ts']
]])
