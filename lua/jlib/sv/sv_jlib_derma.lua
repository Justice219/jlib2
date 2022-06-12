JLIB = JLIB or {}
JLIB.Server = JLIB.Server or {}

-- Locals
local plyMeta = FindMetaTable("Player")
util.AddNetworkString("Justice:Notification:Send")

-- Funcs
function plyMeta:JLIBSendNotification( title, text )
    local title = title or "NO TITLE"
    local text = text or "NO TEXT"
    net.Start("Justice:Notification:Send")
        net.WriteString( title )
        net.WriteString( text )
    net.Send( self  )
end