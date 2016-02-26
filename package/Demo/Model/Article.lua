--[[
	DemoModelArticle
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

function M.getArticle(id_page)
	for key, value in pairs(L.obj.db) do
		if value.id == id_page then
			return value
		end
	end
end

function M.getAll()
	return L.obj.db
end

return M	
end