local PANEL = {}

function PANEL:Init()
    self:ShowCloseButton(false)
    self:SetTitle("")
    self:SetDraggable(true)

    self:TDLib()
    self:ClearPaint()
        :Background(jlib.Colors["Primary"], 6)

    self.Navbar = self:Add("jlib_navbar")

    function self:ScaleW(size)
        return ScrW() * size/1920
    end

    function self:ScaleH(size)
        return ScrH() * size/1080
    end

end

function PANEL:CreateTopBar()
    local top = vgui.Create("DPanel", self)
    top:SetSize(self:GetWide(), self:ScaleH(40))
    top:SetPos(self:ScaleW(0), self:ScaleH(0))
    top:SetBackgroundColor(jlib.Colors["Topbar"])

    local title = vgui.Create("DLabel", top)
    title:SetFont("jlib.font.title")
    title:SetText(self:GetTitle())
    title:SetTextColor(jlib.Colors["White"])
    title:SetPos(self:ScaleW(10), self:ScaleH(5))
    title:SizeToContents()

    local whiteDivider = top:Add("DPanel")
    whiteDivider:Dock(BOTTOM)
    whiteDivider:SetTall(self:ScaleH(1))
    whiteDivider:TDLib()
    whiteDivider:ClearPaint()
        :Background(jlib.Colors.White, 6)

    local close = vgui.Create("DImageButton", top)
    close:SetSize(self:ScaleW(40), self:ScaleH(40))
    close:SetPos(self:GetWide() - self:ScaleW(40), self:ScaleH(0))
    close:SetText("")
    close.DoClick = function()
        self:Remove()
    end
    close.Paint = function(self, w, h)
        surface.SetMaterial(jlib.Materials["Cross"])
        surface.SetDrawColor(Color(255, 255, 255))
        surface.DrawTexturedRect(0, 0, w, h)
    end

end

function PANEL:ShowNavbar(bool)
    self.ShowNavbar = bool
end

function PANEL:Setup()
    -- Just setting up the panel itself.
    self:MakePopup()
    self:SetSize(ScrW() * 0.5, ScrH() * 0.5)
    self:Center()

    -- Lets create the frames elements.
    self:CreateTopBar()

    if self.ShowNavbar then
        self.Navbar:Setup()
    end
end


vgui.Register("jlib_frame", PANEL, "DFrame")

concommand.Add("jlib_frame", function()
    local frame = vgui.Create("jlib_frame")
    frame:ShowNavbar(true)
    frame:SetTitle("Justice's Library")

    -- Lets setup our navbar.
    frame.Navbar:AddButton("Player", jlib.Colors.Primary, jlib.Icons.Player, function(pnl)
        pnl:Clear()
        
        local label = pnl:Add("DLabel")
        label:SetText("Player Options")
        label:SetFont("jlib.font.title")
        label:SetTextColor(jlib.Colors.White)
        label:SetPos(jlib.Scaling.ScaleW(10), jlib.Scaling.ScaleH(5))
        label:SizeToContents()


        local playerOptions = vgui.Create("jlib_list", pnl)
        playerOptions:SetSize(pnl:GetWide() - jlib.Scaling.ScaleW(30), jlib.Scaling.ScaleH(240))
        playerOptions:SetPos(jlib.Scaling.ScaleW(15), jlib.Scaling.ScaleH(25))

        playerOptions:AddCheckbox("Toggle", {
            value = true,
            callback = function(box, value)
                chat.AddText("Toggled " .. tostring(value))
            end
        })
        playerOptions:AddSlider("Slider", {
            value = 2,
            min = 1,
            max = 3,
            callback = function(box, value)
                print("yo")
            end
        })
        playerOptions:AddButton("Button", {
            buttonText = "Send",
            callback = function(box, value)
                chat.AddText("Hello World!")
            end
        })
        playerOptions:AddEntry("Entry", {
            value = "Hello World!",
            callback = function(box, value)
                chat.AddText(value)
            end,
        })

        playerOptions:Setup()
    end)
    frame.Navbar:AddButton("Server", jlib.Colors.Primary, jlib.Icons.Server, function(pnl)
        pnl:Clear()

        local label = pnl:Add("DLabel")
        label:SetText("Server Options")
        label:SetFont("jlib.font.title")
        label:SetTextColor(jlib.Colors.White)
        label:SetPos(jlib.Scaling.ScaleW(10), jlib.Scaling.ScaleH(5))
        label:SizeToContents()


        local serverOptions = vgui.Create("jlib_list", pnl)
        serverOptions:SetSize(pnl:GetWide() - jlib.Scaling.ScaleW(30), jlib.Scaling.ScaleH(240))
        serverOptions:SetPos(jlib.Scaling.ScaleW(15), jlib.Scaling.ScaleH(25))

        serverOptions:AddButton("Chat Message", {
            buttonText = "Send",
            callback = function(box, value)
                chat.AddText("Hello World!")
            end
        })
        serverOptions:Setup()
    end)
    frame.Navbar:AddButton("World", jlib.Colors.Primary, jlib.Icons.World, function(pnl)
        pnl:Clear()
    end)

    frame:Setup()
    frame.Navbar:SetTab(1)
end)

concommand.Add("jlib_popup", function()
    local frame = vgui.Create("jlib_popup")
    frame:SetTitle("Justice's Library")
    frame:Setup()
    frame:CreatePop()

    frame:CreateOptions({
        ["button1"] = {
            text = "Button 1",
            func = function()
                print("Button 1")
            end
        },
        ["button2"] = {
            text = "Button 2",
            func = function()
                print("Button 2")
            end
        }
    })
end)