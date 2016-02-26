--[[
	CoreControllerIndex
	Controller 'Index' - start page
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
		tpl = string.gsub (tpl, '{title}', 'Main page', 1)
		tpl = string.gsub (tpl, '{description}', 'A brief description of the site', 1)
		tpl = string.gsub (tpl, '{content}', '<h2>Welcome</h2>Block "Welcome" and the description of the site mission', 1)
		out.status = 'HTTP/1.0 200 OK'
	
	-- sidebar
	res = L.obj.article.doJob(route, 'List')
		tpl = string.gsub (tpl, '{sidebar}', res.content, 1)

	out.text = tpl
	return out
end

--[===================[
	Private methods
--]===================]



return M	
end