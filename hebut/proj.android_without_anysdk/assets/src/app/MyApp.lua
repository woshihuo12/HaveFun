
require("config")
require("framework.init")
require("SwitchScene")

local MyApp = class("MyApp", cc.mvc.AppBase)

function MyApp:ctor()
    MyApp.super.ctor(self)
end

function MyApp:run()
    cc.FileUtils:getInstance():addSearchPath("res/")
    -- self:enterScene("login.scene")
    SwitchScene("login")
end

return MyApp
