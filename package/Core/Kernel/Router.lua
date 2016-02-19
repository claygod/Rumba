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
	routes = dofileLua(app.local_path .. "system/route"),
}

--[===================[
	Public methods
--]===================]

function M.doJob(inquiry)
	local met = 'mode' .. inquiry.mode
	if L[met] then
		return L[met](inquiry)
	end
	return 'ok'
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
	local result
	for key, func in pairs(L.routes) do
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

return M	
end