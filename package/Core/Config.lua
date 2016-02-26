--[[
	Config
	The configuration file for the package 'Core'
--]]

function genObj()

local M = {
	Core = {
		array_error_1 = {title	= "Error",
			description	= "Page not found",
			content = "<h2>Error 404</h2>Page not found",
			status = false,},
	},
}

return M
end