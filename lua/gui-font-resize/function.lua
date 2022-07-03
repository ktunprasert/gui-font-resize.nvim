return function(amount, exact, bounds)
    vim.opt.guifont = string.gsub(vim.opt.guifont._value, ":h(%d+)", function(n)
        local size = n + amount
        if exact ~= nil then
            size = amount
        end

        if size < bounds.minimum then
            size = bounds.minimum
        elseif size > bounds.maximum then
            size = bounds.maximum
        end

        return string.format(":h%d", size)
    end)
end
