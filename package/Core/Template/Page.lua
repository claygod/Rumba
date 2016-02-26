--[[
	CoreTemplatePage
--]]

function genObj(class_name, conf, obj)

local M = {[=[<html>
<head>
	<title>{title}</title>
	<meta http-equiv="content-type" content="text/html; charset=utf-8"/>
	<meta name="description" content="{description}" />
	<link rel="stylesheet" href="ui/twocolumn.css"/>
</head>
<body>
	<div id="header">
		<h1>The site runs on Lua</h1>
	</div>
	<div id="sidebar">
		<ul>
			<li><a href="./">Main</a></li>
			{sidebar}
			<li><a href="hello.html">Hello</a></li>
			<li><a href="error.html">Error</a></li>
		</ul>
	</div>
	<div id="content">
		{content}
	</div>
</body>
</html>]=]}

return M	
end