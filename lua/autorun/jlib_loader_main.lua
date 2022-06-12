jlib = {}

function jlib:Log(str)
    MsgC(Color(255, 255, 255), "[JLIB] ", Color(255, 255, 0), str, "\n")
end

local function loadServerFile(str)
    if CLIENT then return end
    include(str)
    jlib:Log("Loaded server file: " .. str)
end

local function loadClientFile(str)
    if SERVER then AddCSLuaFile(str) return end
    include(str)
    jlib:Log("Loaded client file: " .. str)
end

local function loadSharedFile(str)
    if SERVER then AddCSLuaFile(str) end
    include(str)
    jlib:Log("Loaded shared file: " .. str)
end


local function load()
    local clientFiles = file.Find("jlib/cl/*.lua", "LUA")
    local sharedFiles = file.Find("jlib/sh/*.lua", "LUA")
    local serverFiles = file.Find("jlib/sv/*.lua", "LUA")
    local vguiFiles = file.Find("jlib/vgui/*.lua", "LUA")

    for _, fl in pairs(clientFiles) do
        loadClientFile("jlib/cl/" .. fl)
    end

    for _, fl in pairs(sharedFiles) do
        loadSharedFile("jlib/sh/" .. fl)
    end

    for _, fl in pairs(serverFiles) do
        loadServerFile("jlib/sv/" .. fl)
    end

    for _, fl in pairs(vguiFiles) do
        loadClientFile("jlib/vgui/" .. fl)
    end

    jlib:Log("Loaded " .. #clientFiles + #sharedFiles + #serverFiles .. " files.")
end

-- For all the cute niggas
load()