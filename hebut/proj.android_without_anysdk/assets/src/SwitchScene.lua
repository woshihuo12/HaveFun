function SwitchScene(name, temp_data, callback, transitionType, time, more)
	cc.Director:getInstance():getActionManager():removeAllActions()
	local sceneFile = "app/scenes/" .. name .. "/scene"
	local sceneModule = require(sceneFile)
	local scene = sceneModule.new(unpack(checktable(temp_data)))
	display.replaceScene(scene, transitionType, time, more)
	if (type(callback) == "function") then
		local handle
		handle = scheduler.performWithDelayGlobal(callback, 0.1)
		handle = nil
	end
end

function PushScene(name, params)
	local sceneFile = "app/scenes/" .. name .. "/scene"
	local sceneModule = require(sceneFile)

	cc.Director:getInstance():pushScene(sceneModule.new(params))
end

function PopScene()
	cc.Director:getInstance():popScene()
end