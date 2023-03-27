-- [ Class Creation ]
local String = {}


-- [ String: Functions ]
function String.split(str, sep)
    sep = sep or "%s"
    local args = {}
    for _str in str:gmatch("([^" .. sep .. "]+)") do
        table.insert(args, _str)
    end
    return args
end


-- [ Utility Return ]
return String