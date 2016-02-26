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
	
	--prnt_r(L.obj)
	local inquiry = L.obj.request.doJob(r)
	--prnt('<hr>') prnt_r(inquiry)
	local route = L.obj.router.doJob(inquiry)
	--prnt_r(route)
	local controller, err = di.get(route['controller'])
	local html = controller.doJob(route)
	prnt(html.text)
	return html.status
end

--[===================[
	Private methods
--]===================]

return M	
end