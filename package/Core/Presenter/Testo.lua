--[[
	CorePresenterTesto
--]]

function genObj(class_name, class_path)
local  self = {
	class_name = class_name,
	class_path = class_path
	--get_name = function ()	return "erer"	end
} 

local test = function ()
	return "tyutyu 333 \n"
end

local test2 = function ()
	return self.class_name
end

local test3 = function ()
	return self.get_name
end

local get_name2 = function ()
	return self.class_name
end

return {
	test = test, 
	test2 = test2,
	test3 = test3
}

end