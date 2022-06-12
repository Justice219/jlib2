jlib.Materials = {
    ["Cross"] = Material("jlib/white/cross.png"),
    ["Player"] = Material("jlib/white/player.png"),
    ["Server"] = Material("jlib/white/server.png"),
    ["World"] = Material("jlib/white/world.png"),
    ["Settings"] = Material("jlib/white/settings.png"),
    ["Stats"] = Material("jlib/white/stats.png"),
    ["Info"] = Material("jlib/white/info.png"),
    ["Buy"] = Material("jlib/white/buy.png"),
    ["Sell"] = Material("jlib/white/sell.png"),
}
jlib.Icons = {
    ["Cross"] = "jlib/white/cross.png",
    ["Player"] = "jlib/white/player.png",
    ["Server"] = "jlib/white/server.png",
    ["World"] = "jlib/white/world.png",
    ["Settings"] = "jlib/white/settings.png",
    ["Stats"] = "jlib/white/stats.png",
    ["Info"] = "jlib/white/info.png",
    ["Sell"] = "jlib/white/sell.png",
    ["Buy"] = "jlib/white/buy.png",
}
jlib.Colors = {
    ["Primary"] = Color(41,41,41),
    ["Secondary"] = Color(51,51,51),
    ["Topbar"] = Color(58,58,58),
    ["White"] = Color(255,255,255),   
    ["Green"] = Color(83,241,117),
    ["Selected"] = Color(194,194,194),
}
jlib.Scaling = {
    ScaleW = function(size)
        return size * ScrH() / 1920
    end,
    ScaleH = function(size)
        return size * ScrW() / 1080
    end,
}

-- FONT N SHIT
surface.CreateFont("jlib.font.primary", {
    font = "Roboto",
    size = jlib.Scaling.ScaleH(20),
    weight = 500,
    antialias = true,
    shadow = false,
    outline = false,
})
surface.CreateFont("jlib.font.secondary", {
    font = "Roboto",
    size = jlib.Scaling.ScaleH(15),
    weight = 500,
    antialias = true,
    shadow = false,
    outline = false,
})
surface.CreateFont("jlib.font.button", {
    font = "Roboto",
    size = jlib.Scaling.ScaleH(12.5),
    weight = 500,
    antialias = true,
    shadow = false,
    outline = false,
})
surface.CreateFont("jlib.font.title", {
    font = "Roboto",
    size = jlib.Scaling.ScaleH(15),
    weight = 500,
    antialias = true,
    shadow = false,
    outline = false,
})