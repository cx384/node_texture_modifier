node_texture_modifier = {}
node_texture_modifier.registrations = {}
node_texture_modifier.dyed_registrations = {}
dofile(minetest.get_modpath("node_texture_modifier").."/modifier.lua")
dofile(minetest.get_modpath("node_texture_modifier").."/crafting.lua")
dofile(minetest.get_modpath("node_texture_modifier").."/craftitems.lua")
dofile(minetest.get_modpath("node_texture_modifier").."/tools.lua")
dofile(minetest.get_modpath("node_texture_modifier").."/check_owner.lua")
