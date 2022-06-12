local PANEL = {}

function PANEL:Init()

end

function PANEL:Paint()
    self:SetTextColor(Color(255,255,255))
    self:TDLib()
    self:ClearPaint()
        :Background(jlib.Colors.Primary, 6)
        :BarHover(jlib.Colors.White, 3)
        :CircleClick(jlib.Colors.White, 3, 200)
end

function PANEL:Inverse()
    self:SetTextColor(Color(255,255,255))
    self:TDLib()
    self:ClearPaint()
        :Background(jlib.Colors.Secondary, 6)
        :BarHover(jlib.Colors.White, 3)
        :CircleClick(jlib.Colors.White, 3, 200)
end

vgui.Register("jlib_button", PANEL, "DButton")