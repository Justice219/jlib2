-- LUA JSON DATABASE!
jlib = jlib or {}

function jlib:SQLQuery(query)
    jlib:Log("Query: " .. query)
    sql.Query(query)
end

function jlib:SQLCreate(name, values)
    local str = ""
    local i = 0
    local max = table.maxn(values)
    for k,v in pairs(values) do
        -- the string needs to look something like id NUMBER, name TEXT
        i = i + 1
        if i == max then 
            str = str .. v.name .. " " .. v.type
        else
            str = str .. v.name .. " " .. v.type .. ", "
        end
    end

    sql.Query("CREATE TABLE IF NOT EXISTS " .. name .. " ( " .. str .. " )")
    jlib:Log("Created new DB table: " .. name)
    if !sql.LastError() then return end
    jlib:Log("Printing last SQL Error for debugging purposes, ")
    print(sql.LastError())
end

function jlib:SQLRemove(name)
    sql.Query("DROP TABLE " .. name)

    jlib:Log("Removed DB table: " .. name)
    if !sql.LastError() then return end
    jlib:Log("Printing last SQL Error for debugging purposes, ")
end

function jlib:SQLUpdateSpecific(name, row, method, value, key)
    local data = sql.Query("SELECT " .. row .. " FROM " .. name .. " WHERE " .. method .. " = " ..sql.SQLStr(key).. ";")
    if (data) then
        sql.Query("UPDATE " .. name .. " SET " .. row .. " = " .. sql.SQLStr(value) .. " WHERE " .. method .. " = " ..sql.SQLStr(key).. ";")
    else
        sql.Query("INSERT INTO " .. name .. " ( "..method..", "..row.." ) VALUES( "..sql.SQLStr(key)..", "..sql.SQLStr(value).." );")
    end
end

function jlib:SQLUpdateAll(name, row, value)
    jlib:Log("Updating all entries in DB table: " .. name)
    value = sql.SQLStr(value)
    local data = sql.Query("SELECT * FROM " .. name .. ";")
    if (data) then
        sql.Query("UPDATE " .. name .. " SET " .. row .. " = " .. value .. ";")
    else
        sql.Query("INSERT INTO " .. name .. " ( "..row.." ) VALUES( "..value.." )") 
    end
end

function jlib:SQLLoad(name, method)
    local val = sql.QueryValue("SELECT * FROM " .. name .. " WHERE " .. method .. " = " .. sql.SQLStr(method) .. ";")
    if !val then
        jlib:Log("Could not load data from DB table: " .. name .. " with method: " .. method)    
        return false
    else
        return val
    end
end

function jlib:SQLLoadSpecific(name, row, method, key)
    local val = sql.QueryValue("SELECT " .. row .. " FROM " .. name .. " WHERE " .. method .. " = " .. sql.SQLStr(key) .. ";")
    if !val then
        jlib:Log("Could not load data from DB table: " .. name .. " with method: " .. method)    
        return false
    else
        return val
    end
end

function jlib:SQLLoadAll(name, row)
    local val = sql.QueryValue("SELECT "..row.." FROM " .. name .. ";")
    if !val then
        jlib:Log("Could not load data from DB table: " .. name)    
        return false
    else
        return val
    end
end