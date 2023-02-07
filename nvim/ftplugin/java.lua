require('coq')

local config = coq.lsp_ensure_capabilities({
    cmd = {'/opt/homebrew/bin/jdtls'},
    root_dir = vim.fs.dirname(vim.fs.find({'.gradlew', '.git', 'mvnw'}, { upward = true })[1]),
})
require('jdtls').start_or_attach(config)
