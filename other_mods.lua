local function add_nodes_type_from_table(t)
	for _, row in pairs(t) do
		local node_type = row[1]
		local nodes = row[2]
		for _, node in pairs(nodes) do
			node_texture_modifier.add_node_too_type(node, node_type)
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
	}
	add_nodes_type_from_table(default_nodes)
end

if minetest.get_modpath("moreblocks") then
	local morblocks_nodes = {
		{"wood", 			{"moreblocks:wood_tile", "moreblocks:wood_tile_flipped",
		 "moreblocks:wood_tile_center", "moreblocks:wood_tile_full", "moreblocks:wood_tile_up",
		 "moreblocks:wood_tile_down", "moreblocks:wood_tile_left", "moreblocks:wood_tile_right",}},
		{"stone", 				{"moreblocks:circle_stone_bricks"}},
		{"stone_brick_bricks", 	{"moreblocks:grey_bricks"}},
		{"coal_stone", 			{"moreblocks:coal_stone", "moreblocks:coal_stone_bricks"}},
		{"iron_stone", 			{"moreblocks:iron_stone", "moreblocks:iron_stone_bricks"}},
		{"cobble", 				{"moreblocks:stone_tile","moreblocks:split_stone_tile", "moreblocks:split_stone_tile_alt" }},
		{"tar", 				{"moreblocks:tar"}},
		{"compressed_cobble", 	{"moreblocks:cobble_compressed"}},
		{"plankstone",		 	{"moreblocks:plankstone"}},
		{"iron_glass", 			{"moreblocks:iron_glass"}},
		{"coal_glass", 			{"moreblocks:coal_glass"}},
		{"clean_glass", 		{"moreblocks:clean_glass"}},
		{"cactus_brick", 		{"moreblocks:cactus_brick"}},
		{"cactus_checker", 		{"moreblocks:cactus_checker"}},
		{"empty_bookshelf", 	{"moreblocks:empty_bookshelf"}},
		{"coal_checker", 		{"moreblocks:coal_checker"}},
		{"iron_checker", 		{"moreblocks:iron_checker"}},
		{"trap_stone", 			{"moreblocks:trap_stone"}},
		{"trap_glass", 			{"moreblocks:trap_glass"}},
		{"fence_junglewood", 	{"moreblocks:fence_jungle_wood"}},
		{"tree", 				{"moreblocks:all_faces_tree"}},
		{"jungletree",		 	{"moreblocks:all_faces_jungle_tree"}},
		{"glow_glass", 			{"moreblocks:glow_glass"}},
		{"trap_glow_glass", 	{"moreblocks:trap_glow_glass"}},
		{"super_glow_glass", 	{"moreblocks:super_glow_glass"}},
		{"trap_super_glow_glass", 	{"moreblocks:trap_super_glow_glass"}},
		{"rope", 				{"moreblocks:rope"}},
		{"copperblock", 		{"moreblocks:copperpatina"}},

	}
	add_nodes_type_from_table(morblocks_nodes)
end

if minetest.get_modpath("darkage") then
	local darkage_nodes = {
		{"reinforced_chalk", 	{"darkage:reinforced_chalk"}},
		{"2_wood", 				{"darkage:reinforced_wood"}},
		{"reinforced_wood", 	{"darkage:reinforced_wood_right"}},
		{"reinforced_wood", 	{"darkage:reinforced_wood_left"}},
	--	{"chain", 				{"darkage:chain"}},
		{"4_wood", 				{"darkage:box"}},
		{"8_wood", 				{"darkage:wood_shelves"}},
	--	{"iron_bars", 			{"darkage:iron_bars"}},
	--	{"lamp", 				{"darkage:lamp"}},
	--	{"iron_grille", 		{"darkage:iron_grille"}},
	--	{"wood_bars", 			{"darkage:wood_bars"}},
	--	{"wood_grille", 		{"darkage:wood_grille"}},
	--	{"wood_frame", 			{"darkage:wood_frame"}},
		{"adobe", 				{"darkage:adobe"}},
		{"basalt", 				{"darkage:basalt"}},
		{"basalt_cobble", 		{"darkage:basalt_cobble"}},
		{"chalk", 				{"darkage:chalk"}},
		{"cobble_with_plaster", {"darkage:cobble_with_plaster"}},
		{"desert_cobble",	 	{"darkage:desert_stone_cobble"}},
		{"gravel_dirt", 		{"darkage:darkdirt"}},
		{"dry_leaves", 			{"darkage:dry_leaves"}},
		{"gneiss", 				{"darkage:gneiss"}},
		{"gneiss_cobble", 		{"darkage:gneiss_cobble"}},
		{"marble", 				{"darkage:marble"}},
		{"mud", 				{"darkage:mud"}},
		{"ors", 				{"darkage:ors"}},
		{"ors_cobble", 			{"darkage:ors_cobble"}},
		{"sandstone_cobble", 	{"darkage:sandstone_cobble"}},
		{"serpentine", 			{"darkage:serpentine"}},
		{"shale", 				{"darkage:shale"}},
		{"schist", 				{"darkage:schist"}},
		{"silt", 				{"darkage:silt"}},
		{"slate", 				{"darkage:slate"}},
		{"slate_cobble", 		{"darkage:slate_cobble"}},
		{"slate_tale", 			{"darkage:slate_tale"}},
	--	{"straw", 				{"darkage:straw"}},
	--	{"stone_brick", 		{"darkage:stone_brick"}}, -- bed recipe output
	--	{"straw_bale", 			{"darkage:straw_bale"}},
		{"marble_tile", 		{"darkage:marble_tile"}},
		{"slate", 				{"darkage:slate"}},
		
	}
	add_nodes_type_from_table(darkage_nodes)
end

if minetest.get_modpath("mining_plus") then
	local mining_plus_nodes = {
		{"compressed_cobble", 	{"mining_plus:polished_cobble"}},
		{"breaknode", 			{"mining_plus:breaknode"}},
	}
	add_nodes_type_from_table(mining_plus_nodes)
end

if minetest.get_modpath("itemframes") then
	local itemframes_nodes = {
		{"itemframe", 			{"itemframes:frame"}},
		{"pedestal", 			{"itemframes:pedestal"}},
	}
	add_nodes_type_from_table(itemframes_nodes)
end

if minetest.get_modpath("xdecor") then
	local xdecor_nodes = {
		{"itemframe", 			{"xdecor:itemframe"}},
	--	{"bamboo_frame", 		{"xdecor:bamboo_frame"}}, 
	--	{"chainlink", 			{"xdecor:chainlink"}},
	--	{"rusty_bar", 			{"xdecor:rusty_bar"}},
	--	{"baricade", 			{"xdecor:baricade"}},
	--	{"barrel", 				{"xdecor:barrel"}},
	--	{"cabinet", 			{"xdecor:cabinet"}},
	--	{"cabinet_half", 		{"xdecor:cabinet_half"}},
		{"empty_shelf", 		{"xdecor:empty_shelf"}}, --not morblocks empty_bookshelf because recipe
		{"multishelf", 			{"xdecor:multishelf"}},
		{"torch", 				{"xdecor:candle"}},
		{"chair", 				{"xdecor:chair"}},
		{"cobweb", 				{"xdecor:cobweb"}},
		{"enderchest", 			{"xdecor:enderchest"}},
	--	{"ivy", 				{"xdecor:ivy"}},
	--	{"lantern", 			{"xdecor:lantern"}},
	--	{"stonepath", 			{"xdecor:stonepath"}},
		{"cactus_brick", 		{"xdecor:cactusbrick"}},
		{"coal_checker", 		{"xdecor:coalstone_tile"}},
	--	{"desert_cobble", 		{"xdecor:desertstone_tile"}}, -- bed recipe output
		{"4_desert_cobble", 	{"xdecor:desertstone_tile"}},
		{"4_clay", 				{"xdecor:hard_clay"}},
	--	{"stone_brick_bricks", 	{"xdecor:moonbrick"}}, -- bed recipe output
		{"2_stone_brick_bricks", {"xdecor:moonbrick"}},
	--	{"cobble", 				{"xdecor:stone_tile"}}, -- bed recipe output
		{"2_cobble", 			{"xdecor:stone_tile"}},
	--	{"stone", 				{"xdecor:stone_rune"}},	-- bed recipe output
		{"2_stone", 			{"xdecor:stone_rune"}},
		{"4_ice", 				{"xdecor:packed_ice"}},
	--	{"wood", 				{"xdecor:wood_tile"}}, 	-- bed recipe output
		{"2_wood", 				{"xdecor:wood_tile"}},
		{"tv", 					{"xdecor:tv"}},
	--	{"trampoline", 			{"xdecor:trampoline"}},
	--	{"tatami", 				{"xdecor:tatami"}},
		{"table", 				{"xdecor:table"}},
		{"woodframed_glass", 	{"xdecor:woodframed_glass"}},
	}
	add_nodes_type_from_table(xdecor_nodes)
end
