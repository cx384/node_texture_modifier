local function add_nodes_type_from_table(t)
	for _, row in pairs(t) do
		local node_type = row[1]
		local nodes = row[2]
		for _, node in pairs(nodes) do
			if node_type == "none" then
				node_texture_modifier.add_node_too_type(node, node)
			else
				node_texture_modifier.add_node_too_type(node, node_type)
			end
		end
	end
end

local function add_dyed_nodes_type_from_table(t)
	for _, row in pairs(t) do
		local dyed_node_type = row[1]
		local nodes = row[2]
		for _, node in pairs(nodes) do
			if dyed_node_type == "none" then
				node_texture_modifier.add_dyed_node_too_type(node, node)
			else
				node_texture_modifier.add_dyed_node_too_type(node, dyed_node_type)
			end
		end
	end
end

if minetest.get_modpath("default") then
	node_texture_modifier.registrations.default = {
		{"stone", 				{"default:stone", "default:stone_block", "default:stonebrick"}},
		{"cobble", 				{"default:cobble"}},
		{"mossycobble", 		{"default:mossycobble"}},
		{"desert_stone",		{"default:desert_stone", "default:desert_stone_block", "default:desert_stonebrick"}},
		{"desert_cobble", 		{"default:desert_cobble"}},
		{"obsidian", 			{"default:obsidian", "default:obsidian_block",  "default:obsidianbrick"}},
		{"sandstone", 			{"default:sandstone", "default:sandstone_block", "default:sandstonebrick"}},
		{"desert_sandstone", 			{"default:desert_sandstone", 
			"default:desert_sandstone_block", "default:desert_sandstone_brick"}},
		{"silver_sandstone", 			{"default:silver_sandstone", 
			"default:silver_sandstone_block", "default:silver_sandstone_brick"}},
		{"dirt", 				{"default:dirt"}},
		{"dirt_with_grass", 	{"default:dirt_with_grass"}, {"unavailable"}},
		{"dirt_with_dry_grass", {"default:dirt_with_dry_grass"}, {"unavailable"}},
		{"dirt_with_snow", 		{"default:dirt_with_snow"}, {"unavailable"}},
		{"sand", 				{"default:sand"}},
		{"desert_sand", 		{"default:desert_sand"}},
		{"gravel", 				{"default:gravel"}},
		{"clay", 				{"default:clay"}},
		{"snowblock", 			{"default:snowblock"}},
		{"ice", 				{"default:ice"}},
		{"tree", 				{"default:tree"}},
		{"wood", 				{"default:wood"}},
		{"jungletree", 			{"default:jungletree"}},
		{"junglewood", 			{"default:junglewood"}},
		{"pine_tree", 			{"default:pine_tree"}},
		{"pine_wood", 			{"default:pine_wood"}},
		{"acacia_tree", 		{"default:acacia_tree"}},
		{"acacia_wood", 		{"default:acacia_wood"}},
		{"aspen_tree", 			{"default:aspen_tree"}},
		{"aspen_wood", 			{"default:aspen_wood"}},
		{"coalblock", 			{"default:coalblock"}},
		{"steelblock", 			{"default:steelblock"}},
		{"copperblock", 		{"default:copperblock"}},
		{"bronzeblock", 		{"default:bronzeblock"}},
		{"goldblock", 			{"default:goldblock"}},
		{"mese", 				{"default:mese"}},
		{"diamondblock", 		{"default:diamondblock"}},
		{"cactus", 				{"default:cactus"}},
		{"papyrus", 			{"default:papyrus"}},
		{"dry_shrub", 			{"default:dry_shrub"}},
		{"junglegrass", 		{"default:junglegrass"}},
		{"torch", 				{"default:torch"}, {"2dtorch"}},
		{"chest", 				{"default:chest"}},
		{"chest_locked", 		{"default:chest_locked"}},
		{"bookshelf", 			{"default:bookshelf"}},
		{"fence_wood", 			{"default:fence_wood"}, {"fence"}},
		{"fence_acacia_wood", 	{"default:fence_acacia_wood"}, {"fence"}},
		{"fence_junglewood", 	{"default:fence_junglewood"}, {"fence"}},
		{"fence_pine_wood", 	{"default:fence_pine_wood"}, {"fence"}},
		{"fence_aspen_wood", 	{"default:fence_aspen_wood"}, {"fence"}},
		{"glass", 				{"default:glass"}},
		{"obsidian_glass", 		{"default:obsidian_glass"}},
		{"brick", 				{"default:brick"}},
		{"meselamp", 			{"default:meselamp"}},
		{"cloud", 				{"default:cloud"}},
		{"apple", 				{"default:apple"}, {deleteentrys={"after_place_node"}}},
		{"leaves", 				{"default:leaves"}},
		{"furnace", 			{"default:furnace_active", "default:furnace"}, {deleteentrys={"can_dig", "on_timer", "on_construct", "on_blast"}}},
		{"grass", 				{"default:grass_1"}, {deleteentrys={"on_place"}}},
		{"dry_grass", 			{"default:dry_grass_1"}, {deleteentrys={"on_place"}}},
		{"coral_brown", 		{"default:coral_brown"}},
		{"coral_orange", 		{"default:coral_orange"}},
		{"coral_skeleton", 		{"default:coral_skeleton"}},
		{"jungleleaves", 		{"default:jungleleaves"}},
		{"pine_needles", 		{"default:pine_needles"}},
		{"acacia_leaves", 		{"default:acacia_leaves"}},
		{"aspen_leaves", 		{"default:aspen_leaves"}},
		{"bush_leaves", 		{"default:bush_leaves"}},
		{"acacia_bush_leaves", 	{"default:acacia_bush_leaves"}},
		{"acacia_bush_stem", 	{"default:acacia_bush_stem"}},
		{"bush_stem", 			{"default:bush_stem"}},
		{"sapling", 			{"default:sapling"}, {deleteentrys={"on_timer", "on_construct", "on_place"}}},
		{"junglesapling", 		{"default:junglesapling"}, {deleteentrys={"on_timer", "on_construct", "on_place"}}},
		{"pine_sapling", 		{"default:pine_sapling"}, {deleteentrys={"on_timer", "on_construct", "on_place"}}},
		{"acacia_sapling", 		{"default:acacia_sapling"}, {deleteentrys={"on_timer", "on_construct", "on_place"}}},
		{"aspen_sapling", 		{"default:aspen_sapling"}, {deleteentrys={"on_timer", "on_construct", "on_place"}}},
		{"wood_ladder", 		{"default:ladder_wood"}},
		{"steel_ladder", 		{"default:ladder_steel"}},
		{"wood_sign", 			{"default:sign_wall_wood"}},
		{"steel_sign", 			{"default:sign_wall_steel"}},
		{"silver_sand", 		{"default:silver_sand"}},
		{"none", 		{"default:stone_with_coal", "default:stone_with_iron", 
			"default:stone_with_copper", "default:stone_with_mese", "default:stone_with_gold", 
			"default:stone_with_diamond"}, {"unavailable"}},

	}
	add_nodes_type_from_table(node_texture_modifier.registrations.default)
end

if minetest.get_modpath("wool") then
	node_texture_modifier.dyed_registrations.wool = {}
	for k, dye in ipairs(dye.dyes) do
		node_texture_modifier.dyed_registrations.wool[k] = {"wool", {"wool:"..dye[1]}}
	end
	add_dyed_nodes_type_from_table(node_texture_modifier.dyed_registrations.wool)
	node_texture_modifier.registrations.wool = {}
	for k, dye in ipairs(dye.dyes) do
		node_texture_modifier.registrations.wool[k] = {dye[1].."_".."wool", {"wool:"..dye[1]}}
	end
	add_nodes_type_from_table(node_texture_modifier.registrations.wool)
end

if minetest.get_modpath("doors") then
	node_texture_modifier.registrations.doors = {
		{"wood_door", 				{"doors:door_wood"}, {"door"}},
		{"steel_door", 				{"doors:door_steel"}, {"door"}},
		{"glass_door", 				{"doors:door_glass"}, {"door"}},
		{"obsidian_glass_door",		{"doors:door_obsidian_glass"}, {"door"}},
		{"wood_trapdoor", 			{"doors:trapdoor"}, {"trapdoor"}},
		{"steel_trapdoor", 			{"doors:trapdoor_steel"}, {"trapdoor"}},
		{"gate_wood", 				{"doors:gate_wood_closed"}, {"fencegate"}},
		{"fence_gate_acacia_wood", 	{"doors:gate_acacia_wood_closed"}, {"fencegate"}},
		{"fence_gate_junglewood", 	{"doors:gate_junglewood_closed"}, {"fencegate"}},
		{"fence_gate_pine_wood", 	{"doors:gate_pine_wood_closed"}, {"fencegate"}},
		{"fence_gate_aspen_wood", 	{"doors:gate_aspen_wood_closed"}, {"fencegate"}},
	}
	add_nodes_type_from_table(node_texture_modifier.registrations.doors)
end

if minetest.get_modpath("farming") then
	node_texture_modifier.registrations.farming = {
		{"straw", 				{"farming:straw"}},
	}
	add_nodes_type_from_table(node_texture_modifier.registrations.farming)
end

if minetest.get_modpath("bones") then
	node_texture_modifier.registrations.bones = {
		{"bones", 				{"bones:bones"}},
	}
	add_nodes_type_from_table(node_texture_modifier.registrations.bones)
end

if minetest.get_modpath("boats") then
	node_texture_modifier.registrations.boats = {
		{"boat", 				{"boats:boat"}, {"complex"}},
	}
	add_nodes_type_from_table(node_texture_modifier.registrations.boats)
end

if minetest.get_modpath("beds") then
	node_texture_modifier.registrations.beds = {
		{"fancy_bed", 			{"beds:fancy_bed_bottom"}, {"complex"}},
		{"bed", 				{"beds:bed_bottom"}, {"complex"}},
	}
	add_nodes_type_from_table(node_texture_modifier.registrations.beds)
end

if minetest.get_modpath("nyancat") then
	node_texture_modifier.registrations.nyancat = {
		{"nyancat_rainbow", 	{"nyancat:nyancat_rainbow"}},
		{"nyancat", 			{"nyancat:nyancat"}},
	}
	add_nodes_type_from_table(node_texture_modifier.registrations.nyancat)
end

if minetest.get_modpath("tnt") then
	node_texture_modifier.registrations.tnt = {
		{"tnt", 				{"tnt:tnt"}},
	}
	add_nodes_type_from_table(node_texture_modifier.registrations.tnt)
end

if minetest.get_modpath("vessels") then
	node_texture_modifier.registrations.vessels = {
		{"vessels_shelf", 				{"vessels:shelf"}},
		{"glass_bottle", 				{"vessels:glass_bottle"}},
		{"drinking_glass", 				{"vessels:drinking_glass"}},
		{"steel_bottle", 				{"vessels:steel_bottle"}},
	}
	add_nodes_type_from_table(node_texture_modifier.registrations.vessels)
end

if minetest.get_modpath("walls") then
	node_texture_modifier.registrations.walls = {
		{"cobble_wall", 				{"walls:cobble"}},
		{"mossycobble_wall", 			{"walls:mossycobble"}},
		{"desertcobble_wall", 			{"walls:desertcobble"}},
	}
	add_nodes_type_from_table(node_texture_modifier.registrations.walls)
end

if minetest.get_modpath("xpanes") then
	node_texture_modifier.registrations.xpanes = {
		{"glass_pane", 					{"xpanes:pane_flat"}, {"pane"}},
		{"iron_bar", 					{"xpanes:bar_flat"}, {"pane"}},
	}
	add_nodes_type_from_table(node_texture_modifier.registrations.xpanes)
end

if minetest.get_modpath("flowers") then
	node_texture_modifier.registrations.flowers = {
		{"none", 					{"flowers:rose", "flowers:tulip", "flowers:dandelion_yellow",
			"flowers:geranium", "flowers:viola", "flowers:dandelion_white",  
			"flowers:mushroom_red", "flowers:mushroom_brown"}},
		{"none", 					{"flowers:waterlily"}, {deleteentrys={"on_place"}}},
	}
	add_nodes_type_from_table(node_texture_modifier.registrations.flowers)
end

if minetest.get_modpath("stairs") then
	local allstairs = {}
	for nodename, nodetable in pairs(minetest.registered_nodes) do
		if string.sub(nodename,1,7) == "stairs:" then
			table.insert(allstairs, nodename)
		end
	end
	node_texture_modifier.registrations.stairs = {
		{"none",	allstairs},
	}
	add_nodes_type_from_table(node_texture_modifier.registrations.stairs)
end
