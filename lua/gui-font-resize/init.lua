local M = {}

M.options = {
    default_size = 11,
    change_by = 1,
}

local GUIFontResize = function(amount, exact)
    vim.opt.guifont = string.gsub(vim.opt.guifont._value, ":h(%d+)", function(n)
        local size = n + amount
        if exact ~= nil then
            size = amount
        end
        return string.format(":h%d", size)
    end)
end

M.setup = function(user_opts)
    if user_opts ~= nil then
        for k, v in pairs(user_opts) do
            if M.options[k] ~= nil then
                M.options[k] = v
            end
        end
    end

    vim.api.nvim_create_user_command("GUIFontSizeUp", function(cmd)
        local increase_by = tonumber(cmd.args)
        if increase_by ~= nil then
            return GUIFontResize(increase_by)
        end
        return GUIFontResize(M.options.change_by)
    end, { nargs = "?" })

    vim.api.nvim_create_user_command("GUIFontSizeDown", function(cmd)
        local decrease_by = tonumber(cmd.args)
        if decrease_by ~= nil then
            return GUIFontResize(-decrease_by)
        end
        return GUIFontResize(-M.options.change_by)
    end, { nargs = "?" })

    vim.api.nvim_create_user_command("GUIFontSizeSet", function(cmd)
        local font_size = tonumber(cmd.args)
        if font_size ~= nil then
            return GUIFontResize(font_size, true)
        end
        return GUIFontResize(M.options.default_size, true)
    end, { nargs = "?" })

    vim.api.nvim_create_user_command("GUIFontSizeChange", function(cmd)
        local change_by = tonumber(cmd.args)
        if change_by ~= nil then
            return GUIFontResize(change_by)
        end
        return GUIFontResize(M.options.change_by)
    end, { nargs = "?" })

end

return M
