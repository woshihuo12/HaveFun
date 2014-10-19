
local scene = class("scene", function()
    return display.newScene("scene")
end)

function scene:ctor()
    -- cc.ui.UILabel.new({
    --         UILabelType = 2, text = "Hello, World", size = 64})
    --     :align(display.CENTER, display.cx, display.cy)
    --     :addTo(self)
    display.addSpriteFrames(IMAGE_SCENES_PATH .. "login/loginScene.plist", IMAGE_SCENES_PATH .. "login/loginScene.png")
    display.newSprite("#bg.jpg")
    		:align(display.CENTER, display.cx, display.cy)
    		:addTo(self)
end

function scene:onEnter()
	audio.playMusic(SOUND_PATH .. "login.mp3", true)
end

function scene:onExit()
end

return scene
