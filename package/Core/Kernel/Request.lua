--[[
	Request
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
	
	--[[
		prnt(r.protocol .. " === protocol\n")
		prnt(r.allowoverrides .. " === allowoverrides\n")
		--prnt(r.args .. " === args\n")
		prnt(r.canonical_filename .. " === canonical_filename\n")
		prnt(r.context_prefix .. " === context_prefix\n")
		prnt(r.context_document_root .. " === context_document_root\n")
		prnt(r.document_root .. " === 	document_root\n")
		prnt(r.filename .. " === filename\n")
		prnt(r.handler .. " === handler\n")
		prnt(r.hostname .. " === hostname\n")
		prnt(r.method .. " === method\n")
		prnt(r.server_name .. " === server_name\n")
		--prnt(r.subprocess_env .. " === subprocess_env\n")
		prnt(r.the_request .. " === the_request\n")
		prnt(r.unparsed_uri .. " === unparsed_uri\n")
		prnt(r.uri .. " ===uri\n")
		prnt("88888888888888888888888888888\n");
		local GET, GETMULTI = r:parseargs()
		--r:puts("Your name is: " .. GET['name'] or "Unknown")
		for key, value in pairs(GET) do
			prnt('● ' .. key .. " <--> " .. value .. " ::::\n")
		end
		prnt("88888888888888888888888888888\n");
	--]]
	--prnt('     request -------------')
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
	--prnt('     request -------------')
	-- query arguments
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
		--prnt ("----- это SERVER\n");
		query['mode'] = 'SERVER'
	else
		--prnt ("----- это HHHHHHEEEEEEEE SERVER\n");
		if query['url_core'] == query['url_right'] then
			query['url_route'] = 'index'
			query['mode'] = 'SERVER'
		else
			query['mode'] = query['method']
		end
		
	end
	--prnt_r(query)
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