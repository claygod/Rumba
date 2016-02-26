# Rumba

A Lua MVP web micro-framework.

# Features

- Runs over Apache2 (with mod_lua)
- MVP structure
- Basic routing
- Object oriented style
- Dependency Injection (DI)
- Ability to use precompiled files for acceleration

# Installation

- Copy and unpack for hosting distribution
- Edit app.local_path_left = "htdocs" in index.lua
- In the configuration file in "httpd.conf" in DirectoryIndex section add index.lua and uncomment the line "LoadModule lua_module modules/mod_lua.so"
