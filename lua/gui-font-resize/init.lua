local M = {}
local setup_commands = require("gui-font-resize.utils.commands")

------------------------------

M.options = {
    default_size = 11,
    change_by = 1,
}

------------------------------

M.setup = function(user_opts)
    if user_opts ~= nil then
        for k, v in pairs(user_opts) do
            if M.options[k] ~= nil then
                M.options[k] = v
            end
        end
    end
    setup_commands(M.options)
end

------------------------------

return M
