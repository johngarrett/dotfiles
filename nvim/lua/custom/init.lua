vim.wo.relativenumber = true

vim.opt.clipboard = ""
-- default string is: "block,hor,mark,percent,quickfix,search,tag,undo"
-- this prevents folds from being opened on search
vim.o.foldopen = "block,hor,mark,percent,quickfix,tag,undo"

-- TODO: open test in vsp by doing stuff to current buff name :shrug:
vim.api.nvim_buf_create_user_command(
    0,
    'Test',
    function()
      local name = vim.api.nvim_buf_get_name(0)
      print('name' .. name)
    print(vim.fn.expand("%")
    )
      --print("sdad")
    end,
    { }
)
