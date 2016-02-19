--[[
	CorePresenterTestaa
--]]

function genObj(class_name, conf, obj)

local M = {}

--[[
	Приватные атрибуты
--]]

local L = {
	class_name = class_name .. "---rrrr",
	conf = conf,
	obj = obj
}

--[[
	Публичные методы
--]]

function M.test()
	return L.class_name--5+d+M.co
end

function M.test2()
	return L.get_attribute('class_name')
end

function M.test3(attribute)
	return L.get_attribute(attribute)
end

--[[
	Приватные методы
--]]

--- Получить значение атрибута
-- @param attribute string Имя атрибута
function L.get_attribute(attribute)
	return L[attribute]
end

return M	
end