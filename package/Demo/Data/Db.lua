--[[
	DemoDataDb
	The demo database is stored in a file '.lua'
--]]

function genObj(class_name, conf, obj)

--[=====================[
	Private attributes
--]=====================]

local M = {

	probe1 = {
		title	= 'Title 1',
		description	= 'Brief description of the article 1',
		content		= 'The text of article number 1. Bla-bla-bla, bla bla bla.',
	},
	probe2 = {
		title	= 'Title 2',
		description	= 'Brief description of the article 2',
		content		= 'The text of article number 2. Bla-bla-bla, bla bla bla.',
	},
	probe3 = {
		title	= 'Title 3',
		description	= 'Brief description of the article 3',
		content		= 'The text of article number 3. Bla-bla-bla, bla bla bla.',
	},
}

return M	
end