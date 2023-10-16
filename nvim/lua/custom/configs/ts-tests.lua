vim.api.nvim_add_user_command(
    'Upper',
    function(opts)
        print(string.upper(opts.args))
    end,
    { nargs = 1 }
)
