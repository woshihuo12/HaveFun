
local scene = class("scene", function()
    return display.newScene("scene")
end)

function scene:ctor()
    -- cc.ui.UILabel.new({
    --         UILabelType = 2, text = "Hello, World", size = 64})
    --     :align(display.CENTER, display.cx, display.cy)
    --     :addTo(self)
    	-- 去掉所有未完成的动作
	cc.Director:getInstance():getActionManager():removeAllActions()
    display.addSpriteFrames(IMAGE_SCENES_PATH .. "login/loginScene.plist", IMAGE_SCENES_PATH .. "login/loginScene.png")
    display.newSprite("#bg.jpg")
    		:align(display.CENTER, display.cx, display.cy)
    		:addTo(self)

    local enterBtn = cc.ui.UIPushButton.new({normal = "#select_btn.png", pressed = "#select_btn_pre.png"})
    	:align(display.CENTER, display.cx, display.cy - 350)
    	:addTo(self)
    	:setButtonLabel(cc.ui.UILabel.new({text = "进入游戏", color = cc.c3b(255,255,255)}))
    	:onButtonClicked(function ()
    		print("hello world")
    	end)

    local sequence = transition.sequence({
			    cc.ScaleTo:create(0.5, 1.2,1.2),
			    cc.ScaleTo:create(0.5, 1, 1),
			})
	enterBtn:runAction(cc.RepeatForever:create(sequence))
end

function scene:onEnter()
	audio.playMusic(SOUND_PATH .. "login.mp3", true)
end

function scene:onExit()
end

return scene
