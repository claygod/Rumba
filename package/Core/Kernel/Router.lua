--[[
	CoreKernelRouter
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
	return {controller = 'CoreControllerError'} -- dummy
end

-- Get route for the mode SERVER
function L.modeSERVER(inquiry)
	local routes = L.obj.routes
	local result
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
	return {controller = 'CoreControllerError'} -- dummy
end

return M	
end