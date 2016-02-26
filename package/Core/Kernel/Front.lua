--[[
	Front
	The controller main framework
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
}

--[===================[
	Public methods
--]===================]

function M.doJob(r)
	local inquiry = L.obj.request.doJob(r)
	local route = L.obj.router.doJob(inquiry)
	local controller, err = di.get(route['controller'])
	local html = controller.doJob(route)
	prnt(html.text)
	return html.status
end

return M	
end