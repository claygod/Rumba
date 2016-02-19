require "string"
require "io"

--[[
	Rumba
	Open-source software 
	Copyright © 2016, Eduard Sesigin
	All rights reserved.
--]]

--[===================[
	MAIN
--]===================]

-- The main function
function handle(r)

	rqv = r
	init(r)
	di = dofileLua(app.local_path .. "system/injector") -- create DI
	front, err = di.get("CoreKernelFront")
	if front == nil then
		prnt(err)
	end
	front.doJob(r) -- run

end

--[===================[
	Initialization
--]===================]

-- Initialize global table 'app'
function init(r)
	r.content_type = "text/html"
	app = {}
	str = string.gsub (rqv.filename, rqv.context_document_root, '')
	str = string.gsub (str, 'index.lua', '')
	app.local_path_right = str
	app.local_path_left = "htdocs"
	app.local_path = app.local_path_left .. app.local_path_right	
	app.lua_file_ext = 'lua'
end

--[===================[
	Helpers
--]===================]

-- The number of fields in the table
function countTable(tab)
	local counter = 0
	for key, value in pairs(tab) do
		counter = counter + 1
	end
	return counter
end

-- Get the code from the file, wrapped in a function
function dofileLua(file, ext)
	if ext == nil then
		ext = app.lua_file_ext
	end
	dofile (file .. '.' .. ext)
	return genObj()
end

-- Print string
function prnt(text)
	rqv:puts(text)
	rqv:puts("\n")
end

-- Print table
function prnt_r(array)
	for key, value in pairs(array) do
		if type(value) == 'string' then
			prnt('● ' .. key .. " >>>> " .. value)
		else
			prnt('● ' .. key)
			for key2, value2 in pairs(value) do
				if type(value2) == 'string' then
					prnt('  ○ ' .. key2 .. " >>>> " .. value2)
				else
					prnt('  ○ ' .. key2 .. " >>>> TABLE")
				end
			end
		end
	end
end