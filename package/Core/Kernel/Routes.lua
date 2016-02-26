--[[
	CoreKernelRoutes
	route patterns
--]]

function genObj()

local M = {}

-- hello page (for testing speeds)
M.CoreControllerHello = function(url_str)
	if url_str == 'hello.html' then
		return {}
	else
		return nil
	end
end

-- index (start page)
M.CoreControllerIndex = function(url_str)
	if url_str == 'index' then
		return {}
	else
		return nil
	end
end

-- page
M.CoreControllerPage = function(url_str)
	id_page = string.match(url_str, "^([%a%d-]*).html$")
	if id_page then
		local result = {
			['id_page'] = id_page,
		}
		return result
	else
		return nil
	end
end


return M
end