--[[
	CorePresenterTest
--]]

function genObj(class_name, conf, obj)

local M = {}

--[=====================[
	Private attributes
--]=====================]

local L = {
	class_name = class_name,
	conf = conf,
	obj = obj
}

--[===================[
	Public methods
--]===================]

function M.test()
	return '8888888888888888888888888888888' .. L.class_name--5+d+M.co
end

function M.test2()
	return L.get_attribute('class_name')
end

function M.test3(attribute)
	return L.get_attribute(attribute)
end

function M.test4()
	prnt("▼ У экземпляра " .. L.class_name .. " есть следующие объекты ▼\n")
	for key, value in pairs(L.obj) do
		prnt('● ' .. key .. " ::::\n")
	end
	prnt("▼ У экземпляра " .. L.class_name .. " есть следующие атрибуты ▼\n")
	for key, value in pairs(L.conf) do
		prnt('● ' .. key .. ":\n")
		if #value then
			for key2, value2 in pairs(value) do -- ―●○▲►▼◄•
				prnt('  ○ ' .. key2 .. '-->' .. value2 .."\n")
			end
		end
	end
end

--[===================[
	Private methods
--]===================]

-- Get the value of an attribute
function L.get_attribute(attribute)
	return L[attribute]
end

return M	
end