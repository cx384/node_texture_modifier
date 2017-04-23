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

if minetest.get_modpath("moreblocks") then
	node_texture_modifier.registrations.morblocks= {
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
--		{"fence_junglewood", 	{"moreblocks:fence_jungle_wood"}, {"fence"}},
		{"tree", 				{"moreblocks:all_faces_tree"}},
		{"jungletree",		 	{"moreblocks:all_faces_jungle_tree"}},
		{"glow_glass", 			{"moreblocks:glow_glass"}},
		{"trap_glow_glass", 	{"moreblocks:trap_glow_glass"}},
		{"super_glow_glass", 	{"moreblocks:super_glow_glass"}},
		{"trap_super_glow_glass", 	{"moreblocks:trap_super_glow_glass"}},
		{"rope", 				{"moreblocks:rope"}},
		{"copperblock", 		{"moreblocks:copperpatina"}},

	}
	add_nodes_type_from_table(node_texture_modifier.registrations.morblocks)
end


if minetest.get_modpath("moreores") then
	node_texture_modifier.registrations.moreores= {
		{"silverblock", 		{"moreores:silver_block"}},
		{"tinblock", 			{"moreores:tin_block"}},
		{"mithrilblock", 		{"moreores:mithril_block"}},
		{"none", 				{"moreores:mineral_silver", "moreores:mineral_tin", "moreores:mineral_mithril"}, {"unavailable"}},
		{"none", 				{"moreores:copper_rail"}},
	}
	add_nodes_type_from_table(node_texture_modifier.registrations.moreores)
end


if minetest.get_modpath("darkage") then
	node_texture_modifier.registrations.darkage = {
		{"reinforced_chalk", 	{"darkage:reinforced_chalk"}},
		{"2_wood", 				{"darkage:reinforced_wood"}},
		{"reinforced_wood", 	{"darkage:reinforced_wood_right"}},
		{"reinforced_wood", 	{"darkage:reinforced_wood_left"}},
		{"none", 				{"darkage:chain"}},
		{"4_wood", 				{"darkage:box"}},
		{"8_wood", 				{"darkage:wood_shelves"}},
		{"none", 				{"darkage:iron_bars"}},
		{"none", 				{"darkage:lamp"}},
		{"none", 				{"darkage:iron_grille"}},
		{"none", 				{"darkage:wood_bars"}},
		{"none", 				{"darkage:wood_grille"}},
		{"none", 				{"darkage:wood_frame"}},
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
		{"none", 				{"darkage:straw"}},
		{"none", 				{"darkage:stone_brick"}}, -- bed recipe output
		{"none", 				{"darkage:straw_bale"}},
		{"marble_tile", 		{"darkage:marble_tile"}},
		{"slate", 				{"darkage:slate"}},
		
	}
	add_nodes_type_from_table(node_texture_modifier.registrations.darkage)
end

if minetest.get_modpath("mining_plus") then
	node_texture_modifier.registrations.mining_plus = {
		{"compressed_cobble", 	{"mining_plus:polished_cobble"}},
		{"breaknode", 			{"mining_plus:breaknode"}},
	}
	add_nodes_type_from_table(node_texture_modifier.registrations.mining_plus)
end

if minetest.get_modpath("itemframes") then
	node_texture_modifier.registrations.itemframes = {
		{"itemframe", 			{"itemframes:frame"}, {"complex"}},
		{"pedestal", 			{"itemframes:pedestal"}, {"complex"}},
	}
	add_nodes_type_from_table(node_texture_modifier.registrations.itemframes)
end

if minetest.get_modpath("xdecor") then
	node_texture_modifier.registrations.xdecor = {
		{"itemframe", 			{"xdecor:itemframe"}, {"complex"}},
		{"none", 				{"xdecor:baricade"}},
		{"none", 				{"xdecor:barrel"}},
		{"none", 				{"xdecor:cabinet"}},
		{"none", 				{"xdecor:cabinet_half"}},
		{"empty_shelf", 		{"xdecor:empty_shelf"}}, --not morblocks empty_bookshelf because recipe
		{"multishelf", 			{"xdecor:multishelf"}},
		{"torch", 				{"xdecor:candle"}},
		{"chair", 				{"xdecor:chair"}},
		{"cobweb", 				{"xdecor:cobweb"}},
		{"enderchest", 			{"xdecor:enderchest"}},
		{"none", 				{"xdecor:ivy"}},
		{"none", 				{"xdecor:lantern"}},
		{"none", 				{"xdecor:stonepath"}},
		{"cactus_brick", 		{"xdecor:cactusbrick"}},
		{"none", 				{"xdecor:coalstone_tile"}},
		{"4_desert_cobble", 	{"xdecor:desertstone_tile"}},
		{"4_clay", 				{"xdecor:hard_clay"}},
		{"2_stone_brick_bricks", {"xdecor:moonbrick"}},
		{"2_cobble", 			{"xdecor:stone_tile"}},
		{"2_stone", 			{"xdecor:stone_rune"}},
		{"4_ice", 				{"xdecor:packed_ice"}},
		{"2_wood", 				{"xdecor:wood_tile"}},
		{"tv", 					{"xdecor:tv"}},
		{"none", 				{"xdecor:trampoline"}},
		{"none", 				{"xdecor:tatami"}},
		{"table", 				{"xdecor:table"}},
		{"woodframed_glass", 	{"xdecor:woodframed_glass"}},
		{"none", 				{"xdecor:cauldron_empty"}},
		{"none", 				{"xdecor:cushion_block"}},
		{"none", 				{"xdecor:cushion"}},
		{"none", 				{"xdecor:hive"}},
		{"none", 				{"xdecor:iron_lightbox"}},
		{"none", 				{"xdecor:lever_off"}, {"complex"}},
		{"none", 				{"xdecor:mailbox"}},
		{"none", 				{"xdecor:pressure_stone_off"}, {"complex"}},
		{"none", 				{"xdecor:pressure_wood_off"}, {"complex"}},
		{"none", 				{"xdecor:rope"}},
		{"none", 				{"xdecor:workbench"}, {"complex"}},
		{"none", 				{"xdecor:wooden_lightbox"}},
		{"none", 				{"xdecor:painting_1"}},
		{"none", 				{"xdecor:enchantment_table"}},
		{"none", 				{"realchess:chessboard"}},
		{"none", 				{"xdecor:potted_dandelion_white"}},
		{"none", 				{"xdecor:potted_dandelion_yellow"}},
		{"none", 				{"xdecor:potted_geranium"}},
		{"none", 				{"xdecor:potted_rose"}},
		{"none", 				{"xdecor:potted_tulip"}},
		{"none", 				{"xdecor:potted_viola"}},
		{"none", 				{"xpanes:wood_frame_flat"}, {"pane"}},
		{"none", 				{"xpanes:chainlink_flat"}, {"pane"}},
		{"none", 				{"xpanes:rusty_bar_flat"}, {"pane"}},
		{"none", 				{"xpanes:bamboo_frame_flat"}, {"pane"}},
		{"none", 				{"doors:japanese_door"}, {"door"}},
		{"none", 				{"doors:prison_door"}, {"door"}},
		{"none", 				{"doors:rusty_prison_door"}, {"door"}},
		{"none", 				{"doors:screen_door"}, {"door"}},
		{"none", 				{"doors:slide_door"}, {"door"}},
		{"none", 				{"doors:woodglass_door"}, {"door"}},
		
	}
	add_nodes_type_from_table(node_texture_modifier.registrations.xdecor)
end

if minetest.get_modpath("technic") then
	node_texture_modifier.registrations.technic = {
		{"none", 			{"technic:mineral_uranium", "technic:mineral_chromium", 
			"technic:mineral_zinc", "technic:mineral_lead", "technic:mineral_sulfur"}},
		{"none", 			{"technic:uranium_block", "technic:chromium_block", 
			"technic:zinc_block", "technic:lead_block", "technic:cast_iron_block",
			"technic:carbon_steel_block", "technic:stainless_steel_block", "technic:brass_block"}},
		{"granite", 			{"technic:granite"}},
		{"marble", 				{"technic:marble", "technic:marble_bricks"}},
	}
	add_nodes_type_from_table(node_texture_modifier.registrations.technic)
end
