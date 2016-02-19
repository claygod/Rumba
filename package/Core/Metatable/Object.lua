--[[
	Metatable objects
	222
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

function M.doJob(inquiry)

	return 'ok'
end

function M.test_meta_table()
	return L.get_attribute('class_name')
end

--[===================[
	Private methods
--]===================]

-- Get the value of an attribute
function L.get_attribute(attribute)
	return L[attribute]
end

function L.listObjConf() -- 
	prnt(" Ó ıêçåìïëÿğà " .. L.class_name .. " åñòü ñëåäóşùèå îáúåêòû \n")
	for key, value in pairs(L.obj) do
		prnt('? ' .. key .. " ::::\n")
	end
	prnt(" Ó ıêçåìïëÿğà " .. L.class_name .. " åñòü ñëåäóşùèå àòğèáóòû \n")
	for key, value in pairs(L.conf) do
		prnt('? ' .. key .. ":\n")
		if #value then
			for key2, value2 in pairs(value) do -- ??0^>¡<•
				prnt('  0 ' .. key2 .. '-->' .. value2 .."\n")
			end
		end
	end
end

return M	
end