--[[
	CoreControllerError
	Controller 'Error'
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
	res = L.conf.Core.array_error_1
		tpl = string.gsub (tpl, '{title}', res.title, 1)
		tpl = string.gsub (tpl, '{description}', res.description, 1)
		tpl = string.gsub (tpl, '{content}', res.content, 1)
		out.status = res.status

	-- sidebar	
	res = L.obj.article.doJob(route, 'List')
		tpl = string.gsub (tpl, '{sidebar}', res.content, 1)

	out.text = tpl
	return out
end

return M	
end