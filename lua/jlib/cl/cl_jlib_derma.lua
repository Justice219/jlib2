JLIB = JLIB or {}
JLIB.Client = JLIB.Client or {}
JLIB.Client.Derma = JLIB.Client.Derma or {}

for i = 1, 40 do
    surface.CreateFont("F" .. tostring(i), {
        font = "Arial",
        size = ScreenScale( i ),
    })
end

function inQuad(fraction, beginning, change)
    return change * (fraction ^ 2) + beginning
end

function JLIB.Client.Derma.CreateNotification( parent, title, notification )
    local parent = parent or nil
    local scrw, scrh = ScrW(), ScrH()
    local frame = vgui.Create("DFrame", parent)
    frame:SetSize( scrw * 0.15, scrh * 0.13 )
    frame:SetPos( 0 - (scrw * 0.16), scrh * 0.125 )
    frame:SetDraggable( false )
    frame:ShowCloseButton( false )
    frame:SetTitle( "" )
    frame.Paint = function( self, w, h )
        local rainbow = HSVToColor(  ( CurTime() * 200 ) % 360, 1, 1 )
        surface.SetDrawColor( 0, 0, 0, 215 )
        surface.DrawRect( 0, 0, w, h )
        surface.SetDrawColor( rainbow )
        surface.DrawOutlinedRect( 0, 0, w, h )
        draw.DrawText( title, "F7", w * 0.5, h * 0.1, rainbow, TEXT_ALIGN_CENTER )
    end

    local Description = vgui.Create("DLabel", frame)
    Description:SetSize( frame:GetWide() * 0.8, frame:GetTall() * 0.7 )
    Description:SetPos( frame:GetWide() * 0.1, frame:GetTall() * 0.2 )
    Description:SetWrap( true )
    Description:SetText( notification )
    Description:SetContentAlignment( 5 )
    Description:SetFont("F6")

    local goforward = Derma_Anim("EaseInQuad", frame, function(pnl, anim, delta, data)
        pnl:SetPos(inQuad(delta, 0 - (scrw * 0.17), scrw * 0.18), scrh * 0.125) -- Change the X coordinate from 200 to 200+600
    end)
    local goback = Derma_Anim("EaseInQuad", frame, function(pnl, anim, delta, data)
        pnl:SetPos(inQuad(delta, scrw * 0.01, 0 - (scrw * 0.18) ), scrh * 0.125) -- Change the X coordinate from 200 to 200+600
    end)

    goforward:Start( 1 )
    timer.Simple( 7, function()
        goback:Start( 1 )
        timer.Simple( 1.1, function()
            frame:Remove()
        end)
    end)
    frame.Think = function( self )
        if goforward:Active() then
            goforward:Run()
        elseif goback:Active() then
            goback:Run()
        end
    end
end

function JLIB.Client.Derma.CreateCustomNotification( parent, title, notification, color, rainbow )
    local parent = parent or nil
    local scrw, scrh = ScrW(), ScrH()
    local frame = vgui.Create("DFrame", parent)
    frame:SetSize( scrw * 0.15, scrh * 0.13 )
    frame:SetPos( 0 - (scrw * 0.16), scrh * 0.125 )
    frame:SetDraggable( false )
    frame:ShowCloseButton( false )
    frame:SetTitle( "" )
    frame.Paint = function( self, w, h )
        local rainbow = HSVToColor(  ( CurTime() * 200 ) % 360, 1, 1 )
        surface.SetDrawColor( 0, 0, 0, 215 )
        surface.DrawRect( 0, 0, w, h )
        if rainbow == "false" then
            surface.SetDrawColor( rainbow )
            surface.DrawOutlinedRect( 0, 0, w, h )
            draw.DrawText( title, "F7", w * 0.5, h * 0.1, rainbow, TEXT_ALIGN_CENTER )
        else
            surface.SetDrawColor( color )
            surface.DrawOutlinedRect( 0, 0, w, h )
            draw.DrawText( title, "F7", w * 0.5, h * 0.1, color, TEXT_ALIGN_CENTER )
        end
    end

    local Description = vgui.Create("DLabel", frame)
    Description:SetSize( frame:GetWide() * 0.8, frame:GetTall() * 0.7 )
    Description:SetPos( frame:GetWide() * 0.1, frame:GetTall() * 0.2 )
    Description:SetWrap( true )
    Description:SetText( notification )
    Description:SetContentAlignment( 5 )
    Description:SetFont("F6")

    local goforward = Derma_Anim("EaseInQuad", frame, function(pnl, anim, delta, data)
        pnl:SetPos(inQuad(delta, 0 - (scrw * 0.17), scrw * 0.18), scrh * 0.125) -- Change the X coordinate from 200 to 200+600
    end)
    local goback = Derma_Anim("EaseInQuad", frame, function(pnl, anim, delta, data)
        pnl:SetPos(inQuad(delta, scrw * 0.01, 0 - (scrw * 0.18) ), scrh * 0.125) -- Change the X coordinate from 200 to 200+600
    end)

    goforward:Start( 1 )
    timer.Simple( 7, function()
        goback:Start( 1 )
        timer.Simple( 1.1, function()
            frame:Remove()
        end)
    end)
    frame.Think = function( self )
        if goforward:Active() then
            goforward:Run()
        elseif goback:Active() then
            goback:Run()
        end
    end
end

function JLIB.Client.Derma.CreatePlayerNotification( parent, title, notification, ply )
    local parent = parent or nil
    local scrw, scrh = ScrW(), ScrH()
    local frame = vgui.Create("DFrame", parent)
    frame:SetSize( scrw * 0.98, scrh * 0.13 )
    frame:SetPos( 0 - (scrw * 0.16), scrh * 0.125 )
    frame:SetDraggable( false )
    frame:ShowCloseButton( false )
    frame:SetTitle( "" )
    frame.Paint = function( self, w, h )
        surface.SetDrawColor( 0, 0, 0, 215 )
        draw.RoundedBox( 10, 0, 0, w, h, Color( 41,41,41,215 ) )
        surface.SetDrawColor( Color(255,255,255) )
        draw.DrawText( "Welcome to the server" --[[.. ply:Nick()--]], "F7", w * 0.5, h * -.9, Color(255,255,255), TEXT_ALIGN_CENTER )
    end

    local goforward = Derma_Anim("EaseInQuad", frame, function(pnl, anim, delta, data)
        pnl:SetPos(inQuad(delta, 0 - (scrw * 1.5), scrw * 1.50), scrh * 0.125) -- Change the X coordinate from 200 to 200+600
    end)
    local goback = Derma_Anim("EaseInQuad", frame, function(pnl, anim, delta, data)
        pnl:SetPos(inQuad(delta, scrw * 0.01, 0 - (scrw * 1.50) ), scrh * 0.125) -- Change the X coordinate from 200 to 200+600
    end)

    goforward:Start( 4 )
    timer.Simple( 5, function()
        goback:Start( 4 )
        timer.Simple( 5, function()
            frame:Remove()
        end)
    end)
    frame.Think = function( self )
        if goforward:Active() then
            goforward:Run()
        elseif goback:Active() then
            goback:Run()
        end
    end
end

net.Receive("Justice:Notification:Send", function()
    local title = net.ReadString()
    local text = net.ReadString()
    JLIB.Client.Derma.CreateNotification( nil, title, text )
end)

concommand.Add("Testcustom", function(ply, cmd, args)
    if !args[1] then return end
    -- Command, title, text, color, rainbow
    JLIB.Client.Derma.CreateCustomNotification( nil, args[1], args[2], Color(args[3], args[4], args[5]), args[6] )
end)