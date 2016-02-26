--[[
	Singleton
	Instances of these classes must be singular
--]]

function genObj()

local M = {
	CoreKernelRequest = true,
	CoreKernelRouter = true,
	CoreKernelRoutes = true,
	DemoModelArticle = true,
	DemoDataDb = true,
}

return M
end