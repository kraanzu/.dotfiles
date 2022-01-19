lua << EOF
local nvim_lsp = require('lspconfig')
EOF

noremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
noremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
noremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
noremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
noremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
noremap <silent> <space>wa <cmd>lua vim.lsp.buf.add_workspace_folder()<CR>
noremap <silent> <space>wr <cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>
noremap <silent> <space>wl <cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>
noremap <silent> <space>D <cmd>lua vim.lsp.buf.type_definition()<CR>
noremap <silent> <space>rn <cmd>lua vim.lsp.buf.rename()<CR>
noremap <silent> <space>ca <cmd>lua vim.lsp.buf.code_action()<CR>
noremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
noremap <silent> <space>e <cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>
noremap <silent> [d <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
noremap <silent> ]d <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
noremap <silent> <space>q <cmd>lua vim.lsp.diagnostic.set_loclist()<CR>
noremap <silent> <space>f <cmd>lua vim.lsp.buf.formatting()<CR>

lua << EOF
local util = require 'lspconfig/util'

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
vim.lsp.diagnostic.on_publish_diagnostics, {
  virtual_text = true,
  signs = false,
  update_in_insert = true,
  }
)

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    'documentation',
    'detail',
    'additionalTextEdits',
    'update_in_insert'
    }
  }

require'lspconfig'.rust_analyzer.setup {
  capabilities = capabilities,
  }

require'lspconfig'.pyright.setup {
  capabilities = capabilities,
  }

require'lspconfig'.clangd.setup {
  capabilities = capabilities,
  }

require'lspconfig'.tsserver.setup {
  capabilities = capabilities,
  }
EOF

