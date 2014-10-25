--[[
    背景Layer
--]]
local bgLayer = class("bgLayer", function ()
    return display.newLayer()
end)

function bgLayer:ctor()
    self:setNodeEventEnabled(true)
    display.newSprite("#bg.jpg")
        :align(display.CENTER, display.cx, display.cy)
        :addTo(self)
end

function bgLayer:onEnter()
    print("bgLayer:onEnter")
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
    this.layer:setNodeEventEnabled(true)

    local boxBg = cc.ui.UIImage.new("#box_bg.png")
        :align(display.CENTER, display.cx, display.bottom + 200)
        :addTo(this.layer)

    cc.ui.UIImage.new("#input_bg.png")
        :align(display.CENTER, display.cx + 40, display.bottom + 85)
        :addTo(boxBg)

    cc.ui.UIImage.new("#input_bg.png")
        :align(display.CENTER, display.cx + 40, display.bottom + 45)
        :addTo(boxBg)

    cc.ui.UIPushButton.new({normal = "#register.png", pressed = "#register_pre.png"})
        :align(display.CENTER_RIGHT, display.right - 5, display.bottom + 65)
        :addTo(boxBg)
        :onButtonClicked(function ()
            print("register")
        end)

    local enterBtn = cc.ui.UIPushButton.new({normal = "#select_btn.png", pressed = "#select_btn_pre.png"})
        :align(display.CENTER, display.cx, display.bottom + 100)
        :addTo(this.layer)
        :onButtonClicked(function ()
            print("hello world")
        end)

    cc.ui.UIImage.new("#fast_game.png")
        :align(display.CENTER)
        :addTo(enterBtn)

    local sequence = transition.sequence({
                cc.ScaleTo:create(0.5, 1.2,1.2),
                cc.ScaleTo:create(0.5, 1, 1),
            })
    enterBtn:runAction(cc.RepeatForever:create(sequence))

    function this.layer:onEnter()
        setAnchPos(self, 0, -display.cy)
        transition.moveTo(self, {time = 0.5, y = 0 , easing = "BACKOUT" })
    end

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
