# Rumba

A Lua MVP web micro-framework.

# Features

- Runs over Apache2 (with mod_lua)
- MVP structure
- Basic routing
- Object oriented style
- Autoloading 'classes'
- Dependency Injection (DI)
- Ability to use precompiled files for acceleration

# Installation

- Copy and unpack for hosting distribution
- Edit the line: app.local_path_left = "htdocs" in the file 'index.lua'
- In the configuration file in "httpd.conf" in DirectoryIndex section add index.lua and uncomment the line "LoadModule lua_module modules/mod_lua.so"
