require "string"
require "io"

--[[
	Open-source software 
	Copyright © 2016, Eduard Sesigin
	All rights reserved.
--]]

-- The main function
function handle(r)

	r222 = r
	app = {}
	init()
	r.content_type = "text/html"
	
	di = dofileLua(app.local_path .. "system/injector")
	
	front, err = di.get("CoreKernelFront")
	if front == nil then
		prnt(err)
	end
	front.doJob(r)

end

-- Initialize global table 'app'
function init()
	sss = string.gsub (r222.filename, r222.context_document_root, '')
	sss = string.gsub (sss, 'index.lua', '')
	app.local_path_right = sss
	app.local_path_left = "htdocs"
	app.local_path = app.local_path_left .. app.local_path_right	
	app.lua_file_ext = 'lua'
	
--f2 = io.open("htdocs/moon/v000/autoloader222.lua",  "wb") 
--f2:write(string.dump(dic)) 
--f2: close()	
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
	r222:puts(text)
	r222:puts("\n")
end

-- Print table
function prnt_r(array)
	for key, value in pairs(array) do
		if type(value) == 'string' then
			prnt('● ' .. key .. " >>> " .. value)
		else
			prnt('● ' .. key)
			for key2, value2 in pairs(value) do
				if type(value2) == 'string' then
					prnt('  ○ ' .. key2 .. " >>> " .. value2)
				else
					prnt('  ○ ' .. key2 .. " >>> TABLE")
				end
			end
		end
	end
end

