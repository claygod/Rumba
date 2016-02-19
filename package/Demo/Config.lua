--[[
	Config
	The configuration file for the package 'Demo'
--]]

function genObj()

local M = {
	Demo = {
		dummy = 'Dummy',
		template = {article = "<h2>{title}</h2>{content}\n",
			sidebar = "<li><a href='{id}.html'>{title}</a></li>\n"},
		array_error_1 = {title	= "Error",
			description	= "Page not found",
			content = "<h2>Error 404</h2>Page not found",
			status = false},
		array_error_2 = {title	= "Error",
			description	= "Page not found",
			content = "<h2>Error</h2>Not supported self event",
			status = false},
	},
}

return M
end