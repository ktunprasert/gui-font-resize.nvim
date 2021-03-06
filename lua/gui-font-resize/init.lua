local M = {}
local setup_commands = require("gui-font-resize.utils.commands")

------------------------------

M.options = {
    default_size = 11,
    change_by = 1,
    bounds = {
        maximum = 24,
        minimum = 8,
    },
}

------------------------------

M.setup = function(user_opts)
    local opts = M.options
    if user_opts ~= nil then
        opts = vim.tbl_deep_extend("force", opts, user_opts)
    end
    setup_commands(opts)
end

------------------------------

return M
