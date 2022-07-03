return function(amount, exact)
    vim.opt.guifont = string.gsub(vim.opt.guifont._value, ":h(%d+)", function(n)
        local size = n + amount
        if exact ~= nil then
            size = amount
        end
        return string.format(":h%d", size)
    end)
end
