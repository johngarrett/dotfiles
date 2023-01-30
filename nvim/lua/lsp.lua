local lspconfig = require 'lspconfig'
local coq = require 'coq'

lspconfig.ccls.setup {
  init_options = {
    compilationDatabaseDirectory = "build";
    index = {
      threads = 0;
    };
    clang = {
      excludeArgs = { "-frounding-math"} ;
    };
  }
}

lspconfig.ccls.setup(coq.lsp_ensure_capabilities())

require'lspconfig'.tsserver.setup {}
