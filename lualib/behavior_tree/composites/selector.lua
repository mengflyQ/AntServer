-- Selector
--

local lualib_path = "behavior_tree."
local bret = require(lualib_path .. "behavior_ret")

return function(node)
    for _, child in ipairs(node.children) do
        local r = child:run(node.env)
        if r == bret.RUNNING or r == bret.SUCCESS then
            return r
        end
    end
    return bret.FAIL
end
