--[[
	Dependencies
	The left side - the key attribute of an object 'obj'
--]]

function genObj()

local M = {

--[===================[
	Core
--]===================]
	CoreKernelFront = {
		router		= 'CoreKernelRouter',
		request		= 'CoreKernelRequest',
		
		--routes		= 'CoreKernelRoutes',
	},
	CoreKernelRouter = {
		routes		= 'CoreKernelRoutes',
	},
--[===================[
	Controller
--]===================]
	CoreControllerIndex = {
		article = 'DemoPresenterArticle',
		template = 'CoreTemplatePage',
	},
	CoreControllerPage = {
		article = 'DemoPresenterArticle',
		template = 'CoreTemplatePage',
	},
	CoreControllerError = {
		article = 'DemoPresenterArticle',
		template = 'CoreTemplatePage',
	},
	CoreControllerHello = {
		template = 'CoreTemplatePage',
	},
--[===================[
	Presenter
--]===================]
	DemoPresenterArticle = {
		model_article = 'DemoModelArticle',
	},
	DemoPresenterMenu = {
		model_article = 'DemoModelArticle',
	},
--[===================[
	Model
--]===================]
	DemoModelArticle = {
		db = 'DemoDataDb',
	},
}

return M
end