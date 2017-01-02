local function add_nodes_type_from_table(t)
	for _, row in pairs(t) do
		local node_type = row[1]
		local nodes = row[2]
		for _, node in pairs(nodes) do
			node_texture_modifier.add_node_too_type(node, node_type)
		end
	end
end

local function add_dyed_nodes_type_from_table(t)
	for _, row in pairs(t) do
		local dyed_node_type = row[1]
		local nodes = row[2]
		for _, node in pairs(nodes) do
			node_texture_modifier.add_dyed_node_too_type(node, dyed_node_type)
		end
	end
end

if minetest.get_modpath("default") then
	local default_nodes = {
		{"stone", 				{"default:stone", "default:stone_block", "default:stonebrick"}},
		{"cobble", 				{"default:cobble"}},
		{"mossycobble", 		{"default:mossycobble"}},
		{"desert_stone",		{"default:desert_stone", "default:desert_stone_block", "default:desert_stonebrick"}},
		{"desert_cobble", 		{"default:desert_cobble"}},
		{"obsidian", 			{"default:obsidian", "default:obsidian_block",  "default:obsidianbrick"}},
		{"sandstone", 			{"default:sandstone", "default:sandstone_block", "default:sandstonebrick"}},
		{"dirt", 				{"default:dirt"}},
		{"dirt_with_grass", 	{"default:dirt_with_grass"}},
		{"dirt_with_dry_grass", {"default:dirt_with_dry_grass"}},
		{"dirt_with_snow", 		{"default:dirt_with_snow"}},
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
		{"torch", 				{"default:torch"}},
		{"chest", 				{"default:chest"}},
		{"chest_locked", 		{"default:chest_locked"}},
		{"bookshelf", 			{"default:bookshelf"}},
		{"fence_wood", 			{"default:fence_wood"}},
		{"fence_acacia_wood", 	{"default:fence_acacia_wood"}},
		{"fence_junglewood", 	{"default:fence_junglewood"}},
		{"fence_pine_wood", 	{"default:fence_pine_wood"}},
		{"fence_aspen_wood", 	{"default:fence_aspen_wood"}},
		{"glass", 				{"default:glass"}},
		{"obsidian_glass", 		{"default:obsidian_glass"}},
		{"brick", 				{"default:brick"}},
		{"meselamp", 			{"default:meselamp"}},
		{"cloud", 				{"default:cloud"}},
		{"apple", 				{"default:apple"}},
		{"leaves", 				{"default:leaves"}},
		{"furnace", 			{"default:furnace_active", "default:furnace"}},
		{"grass", 				{"default:grass_1"}},
		{"dry_grass", 			{"default:dry_grass_1"}},
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
		{"sapling", 			{"default:sapling"}},
		{"junglesapling", 		{"default:junglesapling"}},
		{"pine_sapling", 		{"default:pine_sapling"}},
		{"acacia_sapling", 		{"default:acacia_sapling"}},
		{"aspen_sapling", 		{"default:aspen_sapling"}},
		{"wood_ladder", 		{"default:ladder_wood"}},
		{"steel_ladder", 		{"default:ladder_steel"}},
		{"wood_sign", 			{"default:sign_wall_wood"}},
		{"steel_sign", 			{"default:sign_wall_steel"}},
		{"silver_sand", 		{"default:silver_sand"}},
	}
	add_nodes_type_from_table(default_nodes)
end

if minetest.get_modpath("wool") then
	for _, dye in ipairs(dye.dyes) do
		node_texture_modifier.add_dyed_node_too_type("wool:"..dye[1], "wool")
	end
end

if minetest.get_modpath("doors") then
	local doors = {
		{"wood_door", 				{"doors:door_wood"}},
		{"steel_door", 				{"doors:door_steel"}},
		{"glass_door", 				{"doors:door_glass"}},
		{"obsidian_glass_door",		{"doors:door_obsidian_glass"}},
		{"wood_trapdoor", 			{"doors:trapdoor"}},
		{"steel_trapdoor", 			{"doors:trapdoor_steel"}},
		{"gate_wood", 				{"doors:gate_wood_closed"}},
		{"fence_gate_acacia_wood", 	{"doors:gate_acacia_wood_closed"}},
		{"fence_gate_junglewood", 	{"doors:gate_junglewood_closed"}},
		{"fence_gate_pine_wood", 	{"doors:gate_pine_wood_closed"}},
		{"fence_gate_aspen_wood", 	{"doors:gate_aspen_wood_closed"}},
	}
	add_nodes_type_from_table(doors)
end

if minetest.get_modpath("farming") then
	local farming_nodes = {
		{"straw", 				{"farming:straw"}},
	}
	add_nodes_type_from_table(farming_nodes)
end

if minetest.get_modpath("bones") then
	local bones_nodes = {
		{"bones", 				{"bones:bones"}},
	}
	add_nodes_type_from_table(bones_nodes)
end

if minetest.get_modpath("boats") then
	local boats = {
		{"boat", 				{"boats:boat"}},
	}
	add_nodes_type_from_table(boats)
end

if minetest.get_modpath("beds") then
	local beds = {
		{"fancy_bed", 			{"beds:fancy_bed_bottom"}},
		{"bed", 				{"beds:bed_bottom"}},
	}
	add_nodes_type_from_table(beds)
end

if minetest.get_modpath("nyancat") then
	local nyancat_nodes = {
		{"nyancat_rainbow", 	{"nyancat:nyancat_rainbow"}},
		{"nyancat", 			{"nyancat:nyancat"}},
	}
	add_nodes_type_from_table(nyancat_nodes)
end

if minetest.get_modpath("tnt") then
	local tnt_nodes = {
		{"tnt", 				{"tnt:tnt"}},
	}
	add_nodes_type_from_table(tnt_nodes)
end

if minetest.get_modpath("vessels") then
	local vessels_nodes = {
		{"vessels_shelf", 				{"vessels:shelf"}},
		{"glass_bottle", 				{"vessels:glass_bottle"}},
		{"drinking_glass", 				{"vessels:drinking_glass"}},
		{"steel_bottle", 				{"vessels:steel_bottle"}},
	}
	add_nodes_type_from_table(vessels_nodes)
end

if minetest.get_modpath("walls") then
	local walls = {
		{"cobble_wall", 				{"walls:cobble"}},
		{"mossycobble_wall", 			{"walls:mossycobble"}},
		{"desertcobble_wall", 			{"walls:desertcobble"}},
	}
	add_nodes_type_from_table(walls)
end

if minetest.get_modpath("xpanes") then
	local xpanes = {
		{"glass_pane", 					{"xpanes:pane_flat"}},
		{"iron_bar", 					{"xpanes:bar_flat"}},
	}
	add_nodes_type_from_table(xpanes)
end




