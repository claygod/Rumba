--[[
	Routes
	route patterns
--]]

function genObj()

local M = {}

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