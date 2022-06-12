JLIB = JLIB or {}

local plyMeta = FindMetaTable("Player")

-- Funcs
function plyMeta:JLIBChatNotify( title, text )
    local title = title or "NO TITLE"
    local text = text or "NO TEXT"
    net.Start("Justice:Notification:Chat")
        net.WriteString( title )
        net.WriteString( text )
    net.Send( self  )
end