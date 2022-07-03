local ResizeFN = require("gui-font-resize.function")

------------------------------

return function(opts)
    local ResizeWithBound = function(amount, exact)
        ResizeFN(amount, exact, opts.bounds)
    end

    vim.api.nvim_create_user_command("GUIFontSizeUp", function(cmd)
        local increase_by = tonumber(cmd.args)
        if increase_by ~= nil then
            return ResizeWithBound(math.abs(increase_by))
        end
        return ResizeWithBound(opts.change_by)
    end, { nargs = "?" })

    vim.api.nvim_create_user_command("GUIFontSizeDown", function(cmd)
        local decrease_by = tonumber(cmd.args)
        if decrease_by ~= nil then
            return ResizeWithBound(-math.abs(decrease_by))
        end
        return ResizeWithBound(-opts.change_by)
    end, { nargs = "?" })

    vim.api.nvim_create_user_command("GUIFontSizeSet", function(cmd)
        local font_size = tonumber(cmd.args)
        if font_size ~= nil then
            return ResizeWithBound(font_size, true)
        end
        return ResizeWithBound(opts.default_size, true)
    end, { nargs = "?" })

    vim.api.nvim_create_user_command("GUIFontSizeChange", function(cmd)
        local change_by = tonumber(cmd.args)
        if change_by ~= nil then
            return ResizeWithBound(change_by)
        end
        return ResizeWithBound(opts.change_by)
    end, { nargs = "?" })
end
