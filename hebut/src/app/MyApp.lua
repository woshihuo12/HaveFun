
require("config")
require("framework.init")
require("SwitchScene")
require("GameTools")

local MyApp = class("MyApp", cc.mvc.AppBase)

function MyApp:ctor()
    MyApp.super.ctor(self)
end

function MyApp:run()
    cc.FileUtils:getInstance():addSearchPath("res/")
    -- self:enterScene("MainScene")
    SwitchScene("login")
end

return MyApp
