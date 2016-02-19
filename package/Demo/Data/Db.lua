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
		title	= 'Название 1',
		description	= 'Описание 1',
		content		= 'Текст статьи 1. Бла-бла-бла, бла бла бла.',
	},
	probe2 = {
		title	= 'Название 2',
		description	= 'Описание 2',
		content		= 'Текст статьи 2. Бла-бла-бла, бла бла бла.',
	},
	probe3 = {
		title	= 'Название 3',
		description	= 'Описание 3',
		content		= 'Текст статьи 3. Бла-бла-бла, бла бла бла.',
	},
}

return M	
end