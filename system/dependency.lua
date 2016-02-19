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
		request		= 'CoreKernelRequest',
		router		= 'CoreKernelRouter',
	},
	
--[===================[
	Controller
--]===================]
	CoreControllerPage = {
		article = 'DemoPresenterArticle',
		template = 'CoreTemplatePage',
	},
	CoreControllerError = {
		article = 'DemoPresenterArticle',
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