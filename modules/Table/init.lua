-- [ Private Functions ]
local function _print_bracket(tbl, data)
    local depth = data and data.depth or 0
    local str = data and data.name and data.name .. " = {" or "{"
    depth = depth + 4

    for k, v in pairs(tbl) do            
        if typeof(k) == "string" then
            str = str .. "\n" .. string.rep(" ", depth) .. "[\"" .. k .. "\"] = "
        else
            str = str .. "\n" .. string.rep(" ", depth) .. "[" .. tostring(k) .. "] = "
        end

        if typeof(v) == "table" then
            str = str .. _print_bracket(v, {depth = depth}) .. ",\r\n"
        elseif typeof(v) == "string" then
            str = str .. "\"" .. v .. "\",\r\n"
        else
            str = str .. tostring(v) .. ",\r\n"
        end
    end

    str = str .. string.rep(" ", depth - 4) .. "}"
    return str
end

local function _print_colon(tbl, data)
    local depth = data and data.depth or 0

    for k, v in pairs(tbl) do
        if typeof(v) == "table" then
            if depth > 0 then
                print(string.rep(" ", depth) .. k .. ":")
            else
                print(k .. ": ")
            end
            _print_colon(v, {depth = depth + 4})
        else
            if depth > 0 then
                print(string.rep(" ", depth) .. k .. ": " .. v .. ",")
            else
                print(k .. ": " .. v .. ",")
            end
        end
    end
end

-- [ Class Creation ]
local Table = {}


-- [ Table: Properties ]
Table.PrintTypes = {
    "Colon",
    "Bracket",

    Colon = "Colon",
    Bracket = "Bracket"
}


-- [ Table: Functions ]
function Table.print(tbl, printType, data)
    printType = Table.PrintTypes[printType] or "Colon"

    if printType == "Colon" then
        _print_colon(tbl, data)
    elseif printType == "Bracket" then
        print(_print_bracket(tbl, data))
    end
end

function Table.getKeyFromValue(tbl, value)
    for i, v in pairs(tbl) do
        if v == val then
            return i
        end
    end
end

function Table.shift(tbl)
    local res = tbl[1]
    table.remove(tbl, Table.getKeyFromValue(tbl, res))
    return res
end

function Table.cloneInto(tblCloningDataFrom, tblToCloneInto)
    for k, v in pairs(tblCloningDataFrom) do
        tblToCloneInto[k] = v
        if typeof(v) == table then
            clone_into(tblToCloneInto[k], v)
        end
    end
end

-- [ Utility Return ]
return Table