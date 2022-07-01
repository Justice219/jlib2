-- LUA JSON DATABASE!
jlib = jlib or {}

-- Saves the table into json data.
function jlib:JSONSave(name, tbl)
    local file = file.Open(name, "wb", "DATA")
    if file then
        file:Write(util.TableToJSON(tbl))
        file:Close()
    end
end

-- Loads a JSON file and returns a table.
function jlib:JSONLoad(name)
    local file = file.Read(name, "DATA")
    if file then
        return util.JSONToTable(file)
    end
end

-- Probably a better way to do this, but I'm lazy.
function jlib:JSONLoadLine(name, line)
    local file = file.Read(name, "DATA")
    if file then
        return util.JSONToTable(string.Explode("\n", file)[line])
    end
end