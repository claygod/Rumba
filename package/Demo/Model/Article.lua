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
	if L.obj.db[id_page] then
		return L.obj.db[id_page]
	else
		return nil
	end
end

function M.getAll()
	return L.obj.db
end

return M	
end