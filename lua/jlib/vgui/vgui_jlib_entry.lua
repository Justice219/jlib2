local PANEL = {}

function PANEL:Init()
    self.Inverse = false
end

function PANEL:Paint(bool)
    local w = self:GetWide()
    local h = self:GetTall()

    if self.Inverse == false then
        draw.RoundedBox( 6, 0, 0, w, h, jlib.Colors.Primary)
    else
        draw.RoundedBox( 6, 0, 0, w, h, jlib.Colors.Secondary)
    end
    self:DrawTextEntryText(Color(255, 255, 255), Color(255, 0, 0), Color(255, 255, 255))
    self:SetFont("jlib.font.button")
end

function PANEL:InversePaint(val)
    self.Inverse = val
end

vgui.Register("jlib_entry", PANEL, "DTextEntry")