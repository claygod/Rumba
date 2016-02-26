--[[
	CoreControllerHello
	Controller 'Hello'
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

function M.doJob(route)
	local tpl = L.obj.template[1]
	local out = {text = '', status = false}
	local res = {}

	-- content+description+title
		tpl = string.gsub (tpl, '{title}', 'Hello', 1)
		tpl = string.gsub (tpl, '{description}', 'A brief description (hello)', 1)
		tpl = string.gsub (tpl, '{content}', '<h2>Hello World</h2>This page is for testing speeds', 1)
		out.status = 'HTTP/1.0 200 OK'
	
	-- sidebar
		tpl = string.gsub (tpl, '{sidebar}', '', 1)

	out.text = tpl
	return out
end

--[===================[
	Private methods
--]===================]



return M	
end