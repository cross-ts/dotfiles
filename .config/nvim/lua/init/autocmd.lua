-- Terminal Autocmds
do
    local group = 'terminal'
    vim.api.nvim_create_augroup(group, {clear = true})
    vim.api.nvim_create_autocmd({'TermOpen'}, {
        group = group,
        callback = function(ev)
            vim.cmd('startinsert')
            vim.opt.number = false
            vim.opt.relativenumber = false
        end,
    })
end
