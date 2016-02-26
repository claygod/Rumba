--[[
	Dependency Injection (DI)
	Creating objects with the implementation of their dependencies
--]]

function genObj()

local M = {}

--[=====================[
	Private attributes
--]=====================]

local L = {
	confs = {},
	objects = {},
}

--[===================[
	Public methods
--]===================]

-- Getting an instance
function M.get(class_name, conf)
	if string.match (class_name, "^%u[%a]*$") then -- If the class name correctly
		L.init()
		return L.make(class_name, L.getConf(class_name, L.main_conf))
	else
		return nil, "Invalid class name"
	end
end

--[===================[
	Private methods
--]===================]

-- Creating an instance
function L.make(class_name, conf)
	local f
	if L.singleton[class_name] and  L.objects[class_name] then
		return L.objects[class_name] 
	end
	conf = L.getConf(class_name, conf)
	local obj = {}
	local class_path = L.getClassPath(class_name)
	if L.dependency[class_name] then
		for key, value in pairs(L.dependency[class_name]) do
			obj[key] = L.make(value, conf) -- recursion
			if L.singleton[value] and L.objects[value] == nil then
				L.objects[value] = obj[key]
			end
		end
	end
	return dofileLua(class_path, class_name, conf, obj)
end

-- Init
function L.init()
	L.main_conf = dofileLua(app.local_path .. "system/config")
	L.dependency = dofileLua(app.local_path .. "system/dependency")
	L.singleton = dofileLua(app.local_path .. "system/single")
	L.routes = dofileLua(app.local_path .. "system/route")
end

-- Generate the path of the class name
function L.getClassPath(class_name)
	local t = {}
	for w in string.gmatch(class_name, "(%u+%l*)") do
		t[#t+1] = w
	end
	local class_path = table.concat(t, '/') -- request.document_root 
	class_path = app.local_path .. 'package/' .. class_path
	return class_path
end

-- Getting the configuration file for the package
function L.getConf(class_name, conf)
	local conf_path = app.local_path .. 'package/' .. string.match(class_name, "(%u+%l*)") .. '/Config'
	
	if L.confs[conf_path] then
		return L.confs[conf_path]
	else
		local new_conf = dofileLua(conf_path)
		for k,v in pairs(conf) do -- add main config
			new_conf[k] = v
		end
		L.confs[conf_path] = new_conf
		return new_conf
	end
end

return M
end