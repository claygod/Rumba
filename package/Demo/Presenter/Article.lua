--[[
	DemoPresenterArticle
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
	cache = {},
}

--[===================[
	Public methods
--]===================]

function M.doJob(route, event)
	local exe_event = 'exe' .. event
	if L[exe_event] then
		local id_page = tostring(route.id_page)
		return L[exe_event](id_page)
	else
		return L.conf.Core.array_error_1
	end	
end

--[===================[
	Private methods
--]===================]

-- Getting articles
function L.exeArticle(id_page)
	result = L.obj.model_article.getArticle(id_page)
	if result then
		blank = L.conf.Demo.template.article
		blank = string.gsub (blank, '{content}', result.content, 1)
		blank = string.gsub (blank, '{title}', result.title, 1)
		result.content = blank
		return result
	else
		return L.conf.Core.array_error_1
	end
end

-- Getting a list of articles
function L.exeList()
	result = L.obj.model_article.getAll()
	if result then
		local blank
		local out = {title = 'List of articles', description = '', content = '11', status = true}
		local mediate = {t = {}, d = {}, c = {}}
		for key, value in pairs(result) do
			blank = L.conf.Demo.template.sidebar
			blank = string.gsub (blank, '{id}', key, 1)
			blank = string.gsub (blank, '{title}', value.title, 1)
			mediate.c[#mediate.c + 1] = blank
			mediate.d[#mediate.d + 1] = value.title
		end
		out.description = table.concat(mediate.d, ', ')
		out.content = table.concat(mediate.c, ' ')
		return out
	else
		return L.conf.Core.array_error_1
	end
end

return M	
end