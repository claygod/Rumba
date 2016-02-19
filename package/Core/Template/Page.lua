--[[
	CoreTemplatePage
--]]

function genObj(class_name, conf, obj)

local M = [=[<html>
<head>
	<title>{title}</title>
	<meta http-equiv="content-type" content="text/html; charset=utf-8"/>
	<meta name="description" content="{description}" />
	<link rel="stylesheet" href="ui/twocolumn.css"/>
</head>
<body>
	<div id="header">
		<h1>Demo</h1>
	</div>
	<div id="sidebar">
		<ul>
			{sidebar}
		</ul>
	</div>
	<div id="content">
		{content}
	</div>
</body>
</html>]=]

return M	
end