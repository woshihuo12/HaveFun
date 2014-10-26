--
-- Author: HSJ
-- Date: 2014-10-26 10:55:20
--
local GUIMaskLayer = class("GUIMaskLayer", function (args)
	local args = args or {}
    local r = args.r or 0
    local g = args.g or 0
    local b = args.b or 0
    local opacity = args.opacity or 100
    return cc.LayerColor:create(cc.c4b(r, g, b, opacity))
end)

function GUIMaskLayer:ctor(args)
    -- self:setNodeEventEnabled(true)    
    local priority = args.priority or -129
    local item = args.item or nil

    self.clickFunc = args.click or function() end
    self:setTouchEnabled(true)
    self:addNodeEventListener(cc.NODE_TOUCH_EVENT, function(event)
        -- event.name 是触摸事件的状态：began, moved, ended, cancelled
        -- event.x, event.y 是触摸点当前位置
        -- event.prevX, event.prevY 是触摸点之前的位置
        if event.name == "began" then
        	return true
        if event.name == "moved" then
        	print("mask moved")
        end
        if event.name == "ended" then
        	self.clickFunc(event.x, event.y)
        end
        -- 返回 true 表示要响应该触摸事件，并继续接收该触摸事件的状态变化
        return false
    end)

    if item ~= nil then
    	self.addChild(item)
    end
    self.createSceneName = display.getRunningScene().name
end

function GUIMaskLayer:Show()
	local curSceneName = display.getRunningScene().name
	if  curSceneName == self.createSceneName then
		self:setVisible(true)
	end
end

function GUIMaskLayer:Hide()
	local curSceneName = display.getRunningScene().name
	if  curSceneName == self.createSceneName then
		self:setVisible(false)
	end
end

function GUIMaskLayer:Destroy()
	xpcall(function ()
		local curSceneName = display.getRunningScene().name
		if curSceneName == self.createSceneName then
			self:removeFromParentAndCleanup(true)
		end
	end, __G__TRACKBACK__)
end

function GUIMaskLayer:SetClickFunc(func)
	self.clickFunc = func
end

return GUIMaskLayer