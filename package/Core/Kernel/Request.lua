--[[
	CoreKernelRequest
	It creates 'inquiry' to the Router
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

function M.doJob(r)

	local query = {}
	query['method'] = r.method
	query['protocol'] = L.getProtocol(r)
	query['full_file_path'] = r.canonical_filename
	query['hostname'] = r.hostname
	query['url_right'] = L.getUrlRight(r)
	query['url_full'] = query['protocol'] .. "://" .. query['hostname'] .. query['url_right']
	query['url_core'] = string.gsub (r.uri, 'index.lua', '')
	query['url_route'] = string.gsub (query['url_right'], query['url_core'], '')
	query['url_left'] = query['protocol'] .. "://" .. query['hostname'] .. query['url_core']

	if r.method == 'GET' then
		local GET, GETMULTI = r:parseargs()
		query['parseargs_one'] = GET
		query['parseargs_multi'] = GETMULTI
	elseif r.method == 'POST' then
		local POST, POSTMULTI = r:parsebody(4096*8192)
		query['parseargs_one'] = POST
		query['parseargs_multi'] = POSTMULTI
	end	

	-- select mode
	if countTable(query['parseargs_one']) == 0
		and string.match(query['url_full'], "^http:\/\/([%a%d.-_\/]*).html$")
		and r.uri == r.unparsed_uri
		then
		query['mode'] = 'SERVER'
	else
		if query['url_core'] == query['url_right'] then
			query['url_route'] = 'index'
			query['mode'] = 'SERVER'
		else
			query['mode'] = query['method']
		end
		
	end
	return query
end


--[===================[
	Private methods
--]===================]

function L.getUrlRight(r)
	local str = string.gsub (r.the_request, r.method .. ' ', '')
	str = string.gsub (str, ' ' .. r.protocol, '')
	return str
end

function L.getProtocol(r)
	return string.lower(string.match(r.protocol, "(%a*)"))
end

return M	
end