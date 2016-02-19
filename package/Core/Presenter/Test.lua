-- Тестовая функция, возвращающая объект
function genObj()--CorePresenterTest
	--request:puts("call 1111  !!!\n")
local M = {}

	local objects
	local dependency
	
function M:test()
	request:puts("method test in 1111   !!!\n")
end

return M	
end