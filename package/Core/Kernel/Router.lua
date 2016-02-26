--[[
	Router
	Route selection
--]]

function genObj(class_name, conf, obj)
local M = {}

--[=====================[
	Private attributes
--]=====================]

local L = {
	class_name = class_name,
	conf = conf,
	obj = obj,
	routes = {},
}

--[===================[
	Public methods
--]===================]

function M.doJob(inquiry)
	local met = 'mode' .. inquiry.mode
	if L[met] then
		return L[met](inquiry)
	else
		return {controller = 'CoreControllerError'}
	end
end

--[===================[
	Private methods
--]===================]

-- Get route for the mode GET
function L.modeGET(inquiry)
	--prnt ("------------------------ это methodGET");
	return {controller = 'CoreControllerError'}
end

-- Get route for the mode SERVER
function L.modeSERVER(inquiry)
	--prnt ("------------------------ это methodSERVER");
	local routes = L.obj.routes --dofileLua(app.local_path .. "system/route")
	--prnt('<hr>')
	local result
	--prnt('=' .. inquiry['url_route'] .. '=')
	for key, func in pairs(routes) do
		result = func(inquiry['url_route'])
		if result then
			result['controller'] = key
			return result
		end
	end
	return {controller = 'CoreControllerError'}
end

-- Get route for the mode POST
function L.modePOST(inquiry)
	--prnt ("------------------------ это methodPOST");
	return {controller = 'CoreControllerError'}
end

--[[
-- Init
function L.init222()
	L.main_conf = dofileLua(app.local_path .. "system/config")
	L.dependency = dofileLua(app.local_path .. "system/dependency")
	L.singleton = dofileLua(app.local_path .. "system/single")
	L.routes = dofileLua(app.local_path .. "system/route")
end
--]]
return M	
end