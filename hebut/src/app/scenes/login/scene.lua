--[[
    背景Layer
--]]
local bgLayer = class("bgLayer", function ()
    return display.newLayer()
end)

function bgLayer:ctor()
    display.newSprite("#bg.jpg")
        :align(display.CENTER, display.cx, display.cy)
        :addTo(self)
end

--[[
    用户名密码Layer
--]]
local NameAndPasswdLayer = {}
function NameAndPasswdLayer:new()
    local this = {}
    setmetatable(this , self)
    self.__index = self

    this.layer = display.newLayer()

    local enterBtn = cc.ui.UIPushButton.new({normal = "#select_btn.png", pressed = "#select_btn_pre.png"})
        :align(display.CENTER, display.cx, display.cy - 350)
        :addTo(this.layer)
        :setButtonLabel(cc.ui.UILabel.new({text = "进入游戏", color = cc.c3b(255,255,255)}))
        :onButtonClicked(function ()
            print("hello world")
        end)

    local sequence = transition.sequence({
                cc.ScaleTo:create(0.5, 1.2,1.2),
                cc.ScaleTo:create(0.5, 1, 1),
            })
    enterBtn:runAction(cc.RepeatForever:create(sequence))

    return this.layer
end


local scene = class("scene", function()
    return display.newScene("scene")
end)

function scene:ctor()
    display.addSpriteFrames(IMAGE_SCENES_PATH .. "login/loginScene.plist", IMAGE_SCENES_PATH .. "login/loginScene.png")
    bgLayer.new():addTo(self)
    NameAndPasswdLayer:new():addTo(self)
end

function scene:onEnter()
	audio.playMusic(SOUND_PATH .. "login.mp3", true)
end

function scene:onExit()
    display.removeSpriteFramesWithFile(IMAGE_SCENES_PATH .. "login/loginScene.plist", IMAGE_SCENES_PATH .. "login/loginScene.png")
end

return scene
