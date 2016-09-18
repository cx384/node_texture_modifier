
local function is_similar(gspon_ndt_table, tnot_similar, th)
	if gspon_ndt_table[""..th..""] then
		return gspon_ndt_table[""..th..""]
	elseif tnot_similar[""..th..""] then
		return tnot_similar[""..th..""]
	end
end

local function register_similar_nodes(gspon_ndt_table)
	local node_attributes = {"description", "tiles", "groups", "sounds", "drop", "paramtype", 
	"paramtype2", "place_param2", "on_place", "walkable", "drawtype", "node_box", "after_place_node", 
	"special_tiles", "visual_scale", "waving", "selection_box" , "on_use" , "visual_scale",
	"sunlight_propagates", "wield_image"}
	for _, tnot_similar in pairs(gspon_ndt_table.not_similar) do
		local node_definition = {}
		for _, attributes in pairs(node_attributes) do
			if gspon_ndt_table[attributes] or tnot_similar[attributes] then
				node_definition[attributes] = is_similar(gspon_ndt_table, tnot_similar, attributes)
			end
		end
		minetest.register_node(tnot_similar["name"], node_definition)
		node_texture_modifier.add_node_too_type(tnot_similar["name"],
			is_similar(gspon_ndt_table, tnot_similar, "node_type"))
	end
end

if minetest.setting_get("node_texture_modifier_old_nodes")=="true" or
	not minetest.setting_get("node_texture_modifier_old_nodes") then
	register_similar_nodes({
		node_type = "cobble", 
		groups = minetest.registered_nodes["default:cobble"].groups,
		sounds = minetest.registered_nodes["default:cobble"].sounds,
		not_similar = {
			{
			name = "node_texture_modifier:cobble_old1", 
			description = "Cobblestone Old1", 
			tiles = {"node_texture_modifier_cobble_old1.png"},
			},
			{
			name = "node_texture_modifier:cobble_old2", 
			description = "Cobblestone Old2", 
			tiles = {"node_texture_modifier_cobble_old2.png"},
			},
			{
			name = "node_texture_modifier:cobble_old3", 
			description = "Cobblestone Old3", 
			tiles = {"node_texture_modifier_cobble_old3.png"},
			},
			{
			name = "node_texture_modifier:cobble_old4", 
			description = "Cobblestone Old4", 
			tiles = {"node_texture_modifier_cobble_old4.png"},
			},
			{
			name = "node_texture_modifier:cobble_old5", 
			description = "Cobblestone Old5", 
			tiles = {"node_texture_modifier_cobble_old5.png"},
			},
		},	
	})
	register_similar_nodes({
		node_type = "stone", 
		groups = minetest.registered_nodes["default:stone"].groups,
		sounds = minetest.registered_nodes["default:stone"].sounds,
		not_similar = {
			{
			name = "node_texture_modifier:stone_old1", 
			description = "Stone Old1", 
			tiles = {"node_texture_modifier_stone_old1.png"},
			drop = "node_texture_modifier:cobble_old1",
			},
		},	
	})
	register_similar_nodes({
		node_type = "stone", 
		groups = minetest.registered_nodes["default:stonebrick"].groups,
		sounds = minetest.registered_nodes["default:stonebrick"].sounds,
		paramtype2 = minetest.registered_nodes["default:stonebrick"].paramtype2,
		place_param2 = minetest.registered_nodes["default:stonebrick"].place_param2,
		not_similar = {
			{
			name = "node_texture_modifier:stonebrick_old1", 
			description = "Stone Brick Old1", 
			tiles = {"node_texture_modifier_stone_brick_old1.png"},
			},
			{
			name = "node_texture_modifier:stonebrick_old2", 
			description = "Stone Brick Old2", 
			tiles = {"node_texture_modifier_stone_brick_old2.png"},
			},
			{
			name = "node_texture_modifier:stonebrick_old3", 
			description = "Stone Brick Old3", 
			tiles = {"node_texture_modifier_stone_brick_old3.png"},
			},
		},	
	})
	register_similar_nodes({
		node_type = "mossycobble", 
		groups = minetest.registered_nodes["default:mossycobble"].groups,
		sounds = minetest.registered_nodes["default:mossycobble"].sounds,
		not_similar = {
			{
			name = "node_texture_modifier:mossycobble_old1", 
			description = "Mossycobble Old1", 
			tiles = {"node_texture_modifier_mossycobble_old1.png"},
			},
			{
			name = "node_texture_modifier:mossycobble_old2", 
			description = "Mossycobble Old2", 
			tiles = {"node_texture_modifier_mossycobble_old2.png"},
			},
			{
			name = "node_texture_modifier:mossycobble_old3", 
			description = "Mossycobble Old3", 
			tiles = {"node_texture_modifier_mossycobble_old3.png"},
			},
			{
			name = "node_texture_modifier:mossycobble_old4", 
			description = "Mossycobble Old4", 
			tiles = {"node_texture_modifier_mossycobble_old4.png"},
			},
			{
			name = "node_texture_modifier:mossycobble_old5", 
			description = "Mossycobble Old5", 
			tiles = {"node_texture_modifier_mossycobble_old5.png"},
			},
			{
			name = "node_texture_modifier:mossycobble_old6", 
			description = "Mossycobble Old6", 
			tiles = {"node_texture_modifier_mossycobble_old6.png"},
			},
		},	
	})
	register_similar_nodes({
		node_type = "desert_stone", 
		groups = minetest.registered_nodes["default:desert_stone"].groups,
		sounds = minetest.registered_nodes["default:desert_stone"].sounds,
		not_similar = {
			{
			name = "node_texture_modifier:desert_stone_old1", 
			description = "Desert Stone Old1", 
			tiles = {"node_texture_modifier_desert_stone_old1.png"},
			drop = 'default:desert_cobble',
			},
		},	
	})
	register_similar_nodes({
		node_type = "desert_stone", 
		groups = minetest.registered_nodes["default:desert_stonebrick"].groups,
		sounds = minetest.registered_nodes["default:desert_stonebrick"].sounds,
		paramtype2 = minetest.registered_nodes["default:desert_stonebrick"].paramtype2,
		place_param2 = minetest.registered_nodes["default:desert_stonebrick"].place_param2,
		not_similar = {
			{
			name = "node_texture_modifier:desert_stonebrick_old1", 
			description = "Desert Stone Brick Old1", 
			tiles = {"node_texture_modifier_desert_stone_brick_old1.png"},
			},
			{
			name = "node_texture_modifier:desert_stonebrick_old2", 
			description = "Desert Stone Brick Old2", 
			tiles = {"node_texture_modifier_desert_stone_brick_old2.png"},
			},
		},	
	})
	register_similar_nodes({
		node_type = "sandstone", 
		groups = minetest.registered_nodes["default:sandstone"].groups,
		sounds = minetest.registered_nodes["default:sandstone"].sounds,
		not_similar = {
			{
			name = "node_texture_modifier:sandstone_old1", 
			description = "Sandstone Old1", 
			tiles = {"node_texture_modifier_sandstone_old1.png"},
			},
		},	
	})
	register_similar_nodes({
		node_type = "sandstone", 
		groups = minetest.registered_nodes["default:sandstonebrick"].groups,
		sounds = minetest.registered_nodes["default:sandstonebrick"].sounds,
		paramtype2 = minetest.registered_nodes["default:sandstonebrick"].paramtype2,
		place_param2 = minetest.registered_nodes["default:sandstonebrick"].place_param2,
		not_similar = {
			{
			name = "node_texture_modifier:sandstonebrick_old1", 
			description = "Desert Sandstone Brick Old1", 
			tiles = {"node_texture_modifier_sandstone_brick_old1.png"},
			},
			{
			name = "node_texture_modifier:sandstonebrick_old2", 
			description = "Desert Sandstone Brick Old2", 
			tiles = {"node_texture_modifier_sandstone_brick_old2.png"},
			},
		},	
	})
	register_similar_nodes({
		node_type = "obsidian", 
		groups = minetest.registered_nodes["default:obsidianbrick"].groups,
		sounds = minetest.registered_nodes["default:obsidianbrick"].sounds,
		paramtype2 = minetest.registered_nodes["default:obsidianbrick"].paramtype2,
		place_param2 = minetest.registered_nodes["default:obsidianbrick"].place_param2,
		not_similar = {
			{
			name = "node_texture_modifier:obsidianbrick_old1", 
			description = "Obsidian Brick Old1", 
			tiles = {"node_texture_modifier_obsidian_brick_old1.png"},
			},
		},	
	})
	register_similar_nodes({
		node_type = "dirt", 
		groups = minetest.registered_nodes["default:dirt"].groups,
		sounds = minetest.registered_nodes["default:dirt"].sounds,
		not_similar = {
			{
			name = "node_texture_modifier:dirt_old1", 
			description = "Dirt Old1", 
			tiles = {"node_texture_modifier_dirt_old1.png"},
			},
			{
			name = "node_texture_modifier:dirt_old2", 
			description = "Dirt Old2", 
			tiles = {"node_texture_modifier_dirt_old2.png"},
			},
			{
			name = "node_texture_modifier:dirt_old3", 
			description = "Dirt Old3", 
			tiles = {"node_texture_modifier_dirt_old3.png"},
			},
			{
			name = "node_texture_modifier:dirt_old4", 
			description = "Dirt Old4", 
			tiles = {"node_texture_modifier_dirt_old4.png"},
			},
			{
			name = "node_texture_modifier:dirt_old5", 
			description = "Dirt Old5", 
			tiles = {"node_texture_modifier_dirt_old5.png"},
			},
		},	
	})
	register_similar_nodes({
		node_type = "dirt_with_grass", 
		groups = minetest.registered_nodes["default:dirt_with_grass"].groups,
		sounds = minetest.registered_nodes["default:dirt_with_grass"].sounds,
		not_similar = {
			{
			name = "node_texture_modifier:dirt_with_grass_old1", 
			description = "Dirt with Grass Old1", 
			drop = "node_texture_modifier:dirt_old1",
			tiles = {"node_texture_modifier_grass_old1.png", "node_texture_modifier_dirt_old1.png",
				{name = "node_texture_modifier_dirt_old1.png^node_texture_modifier_grass_side_old1.png",
				tileable_vertical = false}},
			},
			{
			name = "node_texture_modifier:dirt_with_grass_old2", 
			description = "Dirt with Grass Old2", 
			drop = "node_texture_modifier:dirt_old2",
			tiles = {"node_texture_modifier_grass_old2.png", "node_texture_modifier_dirt_old2.png",
				{name = "node_texture_modifier_dirt_old2.png^node_texture_modifier_grass_side_old2.png",
				tileable_vertical = false}},
			},
			{
			name = "node_texture_modifier:dirt_with_grass_old3", 
			description = "Dirt with Grass Old3", 
			drop = "node_texture_modifier:dirt_old3",
			tiles = {"node_texture_modifier_grass_old3.png", "node_texture_modifier_dirt_old3.png",
				{name = "node_texture_modifier_dirt_old3.png^node_texture_modifier_grass_side_old3.png",
				tileable_vertical = false}},
			},
			{
			name = "node_texture_modifier:dirt_with_grass_old4", 
			description = "Dirt with Grass Old4", 
			drop = "node_texture_modifier:dirt_old4",
			tiles = {"node_texture_modifier_grass_old4.png", "node_texture_modifier_dirt_old4.png",
				{name = "node_texture_modifier_dirt_old4.png^node_texture_modifier_grass_side_old4.png",
				tileable_vertical = false}},
			},
			{
			name = "node_texture_modifier:dirt_with_grass_old5", 
			description = "Dirt with Grass Old5", 
			drop = "node_texture_modifier:dirt_old5",
			tiles = {"node_texture_modifier_grass_old5.png", "node_texture_modifier_dirt_old5.png",
				{name = "node_texture_modifier_dirt_old5.png^node_texture_modifier_grass_side_old5.png",
				tileable_vertical = false}},
			},
			{
			name = "node_texture_modifier:dirt_with_grass_old6", 
			description = "Dirt with Grass Old6", 
			drop = "default:dirt",
			tiles = {"node_texture_modifier_grass_old6.png", "default_dirt.png",
				{name = "default_dirt.png^node_texture_modifier_grass_side_old6.png",
				tileable_vertical = false}},
			},
		},	
	})
	
	for gdnode=1, 6 do
		minetest.register_abm({
			label = "Node Texture Modifier Grass covered",
			nodenames = {
				"node_texture_modifier:dirt_with_grass_old"..gdnode,
			},
			interval = 8,
			chance = 50,
			catch_up = false,
			action = function(pos, node)
				local above = {x = pos.x, y = pos.y + 1, z = pos.z}
				local name = minetest.get_node(above).name
				local nodedef = minetest.registered_nodes[name]
				if name ~= "ignore" and nodedef and not ((nodedef.sunlight_propagates or
						nodedef.paramtype == "light") and
						nodedef.liquidtype == "none") then
					if gdnode == 6 then
						minetest.set_node(pos, {name = "default:dirt"})
					else
						minetest.set_node(pos, {name = "node_texture_modifier:dirt_old"..gdnode})
					end
				end
			end
		})
		if gdnode==6 then break end
		minetest.register_abm({
			label = "Node Texture Modifier Grass spread",
			nodenames = {"node_texture_modifier:dirt_old"..gdnode},
			neighbors = {
				"node_texture_modifier:dirt_with_grass_old1",
				"node_texture_modifier:dirt_with_grass_old2",
				"node_texture_modifier:dirt_with_grass_old3",
				"node_texture_modifier:dirt_with_grass_old4",
				"node_texture_modifier:dirt_with_grass_old5",
				"node_texture_modifier:dirt_with_grass_old6",
				"default:dirt_with_grass",
				"default:dirt_with_dry_grass",
				"default:dirt_with_snow",
				"group:grass",
				"group:dry_grass",
				"default:snow",
			},
			interval = 6,
			chance = 67,
			catch_up = false,
			action = function(pos, node)
				local above = {x = pos.x, y = pos.y + 1, z = pos.z}
				if (minetest.get_node_light(above) or 0) < 13 then
					return
				end
				local p2 = minetest.find_node_near(pos, 1, {"node_texture_modifier:dirt_with_grass_old1",
				"node_texture_modifier:dirt_with_grass_old2",
				"node_texture_modifier:dirt_with_grass_old3",
				"node_texture_modifier:dirt_with_grass_old4",
				"node_texture_modifier:dirt_with_grass_old5",
				"node_texture_modifier:dirt_with_grass_old6",
				"default:dirt_with_grass",
				"default:dirt_with_dry_grass",
				"default:dirt_with_snow"})
				if p2 then
					local n2 = minetest.get_node(above)
					if n2 and n2.name == "air" then
						minetest.set_node(pos, {name = "node_texture_modifier:dirt_with_grass_old"..gdnode})
						return
					end
				end
				local n2 = minetest.get_node(above)
				if not n2 then
					return
				end
				local name = n2.name
				if minetest.get_item_group(name, "grass") ~= 0 then
					minetest.set_node(pos, {name = "node_texture_modifier:dirt_old"..gdnode})
				end
			end
		})
	end
	
	register_similar_nodes({
		node_type = "sand", 
		groups = minetest.registered_nodes["default:sand"].groups,
		sounds = minetest.registered_nodes["default:sand"].sounds,
		not_similar = {
			{
			name = "node_texture_modifier:sand_old1", 
			description = "Sand Old1", 
			tiles = {"node_texture_modifier_sand_old1.png"},
			},
			{
			name = "node_texture_modifier:sand_old2", 
			description = "Sand Old2", 
			tiles = {"node_texture_modifier_sand_old2.png"},
			},
			{
			name = "node_texture_modifier:sand_old3", 
			description = "Sand Old3", 
			tiles = {"node_texture_modifier_sand_old3.png"},
			},
		},	
	})
	register_similar_nodes({
		node_type = "desert_sand", 
		groups = minetest.registered_nodes["default:desert_sand"].groups,
		sounds = minetest.registered_nodes["default:desert_sand"].sounds,
		not_similar = {
			{
			name = "node_texture_modifier:sand_old1", 
			description = "Desert Sand Old1", 
			tiles = {"node_texture_modifier_desert_sand_old1.png"},
			},
		},	
	})
	register_similar_nodes({
		node_type = "gravel", 
		groups = minetest.registered_nodes["default:gravel"].groups,
		sounds = minetest.registered_nodes["default:gravel"].sounds,
		drop = minetest.registered_nodes["default:gravel"].drop,
		not_similar = {
			{
			name = "node_texture_modifier:gravel_old1", 
			description = "Gravel Old1", 
			tiles = {"node_texture_modifier_gravel_old1.png"},
			},
			{
			name = "node_texture_modifier:gravel_old2", 
			description = "Gravel Old2", 
			tiles = {"node_texture_modifier_gravel_old2.png"},
			},
		},	
	})
	register_similar_nodes({
		node_type = "ice", 
		groups = minetest.registered_nodes["default:ice"].groups,
		sounds = minetest.registered_nodes["default:ice"].sounds,
		paramtype = minetest.registered_nodes["default:ice"].paramtype,
		not_similar = {
			{
			name = "node_texture_modifier:ice_old1", 
			description = "Ice Old1", 
			tiles = {"node_texture_modifier_ice_old1.png"},
			},
		},	
	})
	register_similar_nodes({
		node_type = "tree", 
		groups = minetest.registered_nodes["default:tree"].groups,
		sounds = minetest.registered_nodes["default:tree"].sounds,
		paramtype2 = minetest.registered_nodes["default:tree"].paramtype2,
		on_place = minetest.registered_nodes["default:tree"].on_place,
		not_similar = {
			{
			name = "node_texture_modifier:tree_old1", 
			description = "Tree Old1", 
			tiles = {"node_texture_modifier_tree_top_old1.png",
				"node_texture_modifier_tree_top_old1.png", 
				"node_texture_modifier_tree_old1.png"},
			},
		},	
	})
	register_similar_nodes({
		node_type = "wood", 
		groups = minetest.registered_nodes["default:wood"].groups,
		sounds = minetest.registered_nodes["default:wood"].sounds,
		paramtype2 = minetest.registered_nodes["default:wood"].paramtype2,
		place_param2 = minetest.registered_nodes["default:wood"].place_param2,
		not_similar = {
			{
			name = "node_texture_modifier:wood_old1", 
			description = "Wooden Planks Old1", 
			tiles = {"node_texture_modifier_wood_old1.png"},
			},
			{
			name = "node_texture_modifier:wood_old2", 
			description = "Wooden Planks Old2", 
			tiles = {"node_texture_modifier_wood_old2.png"},
			},
		},	
	})
	register_similar_nodes({
		node_type = "leaves", 
		drawtype = minetest.registered_nodes["default:leaves"].drawtype,
		groups = minetest.registered_nodes["default:leaves"].groups,
		sounds = minetest.registered_nodes["default:leaves"].sounds,
		waving = minetest.registered_nodes["default:leaves"].waving,
		visual_scale = minetest.registered_nodes["default:leaves"].visual_scale,
		paramtype = minetest.registered_nodes["default:leaves"].paramtype,
		drop = minetest.registered_nodes["default:leaves"].drop,
		after_place_node = minetest.registered_nodes["default:leaves"].after_place_node,
		not_similar = {
			{
			name = "node_texture_modifier:leaves_old1", 
			description = "Leaves Old1", 
			tiles = {"node_texture_modifier_leaves_old1.png"},
			},
		},	
	})
	register_similar_nodes({
		node_type = "apple", 
		groups = minetest.registered_nodes["default:apple"].groups,
		sounds = minetest.registered_nodes["default:apple"].sounds,
		drawtype = minetest.registered_nodes["default:apple"].drawtype,
		visual_scale = minetest.registered_nodes["default:apple"].visual_scale,
		paramtype = minetest.registered_nodes["default:apple"].paramtype,
		sunlight_propagates = minetest.registered_nodes["default:apple"].sunlight_propagates,
		walkable = minetest.registered_nodes["default:apple"].walkable,
		selection_box = minetest.registered_nodes["default:apple"].selection_box,
		on_use = minetest.registered_nodes["default:apple"].on_use,
		not_similar = {
			{
			name = "node_texture_modifier:apple_old1", 
			description = "Apple Old1", 
			tiles = {"node_texture_modifier_apple_old1.png"},
			inventory_image = "node_texture_modifier_apple_old1.png",
			},
		},	
	})
	register_similar_nodes({
		node_type = "jungletree", 
		groups = minetest.registered_nodes["default:jungletree"].groups,
		sounds = minetest.registered_nodes["default:jungletree"].sounds,
		paramtype2 = minetest.registered_nodes["default:jungletree"].paramtype2,
		on_place = minetest.registered_nodes["default:jungletree"].on_place,
		not_similar = {
			{
			name = "node_texture_modifier:jungletree_old1", 
			description = "Jungle Tree Old1", 
			tiles = {"node_texture_modifier_jungletree_top_old1.png",
				"node_texture_modifier_jungletree_top_old1.png", 
				"node_texture_modifier_jungletree_old1.png"},
			},{
			name = "node_texture_modifier:jungletree_old2", 
			description = "Jungle Tree Old2", 
			tiles = {"node_texture_modifier_jungletree_top_old2.png",
				"node_texture_modifier_jungletree_top_old2.png", 
				"node_texture_modifier_jungletree_old2.png"},
			},{
			name = "node_texture_modifier:jungletree_old3", 
			description = "Jungle Tree Old3", 
			tiles = {"node_texture_modifier_jungletree_top_old3.png",
				"node_texture_modifier_jungletree_top_old3.png", 
				"default_jungletree.png"},
			},{
			name = "node_texture_modifier:jungletree_old4", 
			description = "Jungle Tree Old4", 
			tiles = {"node_texture_modifier_jungletree_top_old4.png",
				"node_texture_modifier_jungletree_top_old4.png", 
				"default_jungletree.png"},
			},
		},	
	})
	register_similar_nodes({
		node_type = "junglewood", 
		groups = minetest.registered_nodes["default:junglewood"].groups,
		sounds = minetest.registered_nodes["default:junglewood"].sounds,
		paramtype2 = minetest.registered_nodes["default:junglewood"].paramtype2,
		place_param2 = minetest.registered_nodes["default:junglewood"].place_param2,
		not_similar = {
			{
			name = "node_texture_modifier:junglewood_old1", 
			description = "Junglewood Planks Old1", 
			tiles = {"node_texture_modifier_junglewood_old1.png"},
			},
			{
			name = "node_texture_modifier:junglewood_old2", 
			description = "Junglewood Planks Old2", 
			tiles = {"node_texture_modifier_junglewood_old2.png"},
			},
		},	
	})
	register_similar_nodes({
		node_type = "steelblock", 
		groups = minetest.registered_nodes["default:steelblock"].groups,
		sounds = minetest.registered_nodes["default:steelblock"].sounds,
		not_similar = {
			{
			name = "node_texture_modifier:steelblock_old1", 
			description = "Steel Block Old1", 
			tiles = {"node_texture_modifier_steel_block_old1.png"},
			},
			{
			name = "node_texture_modifier:steelblock_old2", 
			description = "Steel Block Old2", 
			tiles = {"node_texture_modifier_steel_block_old2.png"},
			},
			{
			name = "node_texture_modifier:steelblock_old3", 
			description = "Steel Block Old3", 
			tiles = {"node_texture_modifier_steel_block_old3.png"},
			},
		},	
	})
	register_similar_nodes({
		node_type = "copperblock", 
		groups = minetest.registered_nodes["default:copperblock"].groups,
		sounds = minetest.registered_nodes["default:copperblock"].sounds,
		not_similar = {
			{
			name = "node_texture_modifier:copperblock_old1", 
			description = "Copper Block Old1", 
			tiles = {"node_texture_modifier_copper_block_old1.png"},
			},
			{
			name = "node_texture_modifier:copperblock_old2", 
			description = "Copper Block Old2", 
			tiles = {"node_texture_modifier_copper_block_old2.png"},
			},
		},	
	})
	register_similar_nodes({
		node_type = "bronzeblock", 
		groups = minetest.registered_nodes["default:bronzeblock"].groups,
		sounds = minetest.registered_nodes["default:bronzeblock"].sounds,
		not_similar = {
			{
			name = "node_texture_modifier:bronzeblock_old1", 
			description = "Bronze Block Old1", 
			tiles = {"node_texture_modifier_bronze_block_old1.png"},
			},
			{
			name = "node_texture_modifier:bronzeblock_old2", 
			description = "Bronze Block Old2", 
			tiles = {"node_texture_modifier_bronze_block_old2.png"},
			},
		},	
	})
	register_similar_nodes({
		node_type = "mese", 
		groups = minetest.registered_nodes["default:mese"].groups,
		sounds = minetest.registered_nodes["default:mese"].sounds,
		not_similar = {
			{
			name = "node_texture_modifier:mese_old1", 
			description = "Mese Old1", 
			tiles = {"node_texture_modifier_mese_old1.png"},
			},
			{
			name = "node_texture_modifier:mese_old2", 
			description = "Mese Old2", 
			tiles = {"node_texture_modifier_mese_old2.png"},
			},
		},	
	})
	register_similar_nodes({
		node_type = "mese", 
		groups = minetest.registered_nodes["default:mese"].groups,
		sounds = minetest.registered_nodes["default:mese"].sounds,
		not_similar = {
			{
			name = "node_texture_modifier:mese_old3", 
			description = "Mese Block Old1", 
			tiles = {"node_texture_modifier_mese_block_old1.png"},
			},
		},
	})
	register_similar_nodes({
		node_type = "goldblock", 
		groups = minetest.registered_nodes["default:goldblock"].groups,
		sounds = minetest.registered_nodes["default:goldblock"].sounds,
		not_similar = {
			{
			name = "node_texture_modifier:goldblock_old1", 
			description = "Gold Block Old1", 
			tiles = {"node_texture_modifier_gold_block_old1.png"},
			},
			{
			name = "node_texture_modifier:goldblock_old2", 
			description = "Gold Block Old2", 
			tiles = {"node_texture_modifier_gold_block_old2.png"},
			},
			{
			name = "node_texture_modifier:goldblock_old3", 
			description = "Gold Block Old3", 
			tiles = {"node_texture_modifier_gold_block_old3.png"},
			},
		},	
	})	
	register_similar_nodes({
		node_type = "diamondblock", 
		groups = minetest.registered_nodes["default:diamondblock"].groups,
		sounds = minetest.registered_nodes["default:diamondblock"].sounds,
		not_similar = {
			{
			name = "node_texture_modifier:diamondblock_old1", 
			description = "Diamond Block Old1", 
			tiles = {"node_texture_modifier_diamond_block_old1.png"},
			},
			{
			name = "node_texture_modifier:diamondblock_old2", 
			description = "Diamond Block Old2", 
			tiles = {"node_texture_modifier_diamond_block_old2.png"},
			},
			{
			name = "node_texture_modifier:diamondblock_old3", 
			description = "Diamond Block Old3", 
			tiles = {"node_texture_modifier_diamond_block_old3.png"},
			},
		},	
	})
	register_similar_nodes({
		node_type = "cactus", 
		groups = minetest.registered_nodes["default:cactus"].groups,
		sounds = minetest.registered_nodes["default:cactus"].sounds,
		paramtype2 = minetest.registered_nodes["default:cactus"].paramtype2,
		on_place = minetest.registered_nodes["default:cactus"].on_place,
		not_similar = {
			{
			name = "node_texture_modifier:cactus_old1", 
			description = "Cactus Old1", 
			tiles = {"node_texture_modifier_cactus_top_old1.png",
				"node_texture_modifier_cactus_top_old1.png", 
				"node_texture_modifier_cactus_side_old1.png"},
			},
		},	
	})
	register_similar_nodes({
		node_type = "papyrus", 
		groups = minetest.registered_nodes["default:papyrus"].groups,
		sounds = minetest.registered_nodes["default:papyrus"].sounds,
		drawtype = minetest.registered_nodes["default:papyrus"].drawtype,
		paramtype = minetest.registered_nodes["default:papyrus"].paramtype,
		sunlight_propagates = minetest.registered_nodes["default:papyrus"].sunlight_propagates,
		walkable = minetest.registered_nodes["default:papyrus"].walkable,
		selection_box = minetest.registered_nodes["default:papyrus"].selection_box,
		not_similar = {
			{
			name = "node_texture_modifier:papyrus_old1", 
			description = "Papyrus Old1", 
			tiles = {"node_texture_modifier_papyrus_old1.png"},
			inventory_image = "node_texture_modifier_papyrus_old1.png",
			wield_image = "node_texture_modifier_papyrus_old1.png",
			},
		},	
	})
	register_similar_nodes({
		node_type = "brick", 
		groups = minetest.registered_nodes["default:brick"].groups,
		sounds = minetest.registered_nodes["default:brick"].sounds,
		paramtype2 = minetest.registered_nodes["default:brick"].paramtype2,
		place_param2 = minetest.registered_nodes["default:brick"].place_param2,
		not_similar = {
			{
			name = "node_texture_modifier:brick_old1", 
			description = "Brick Old1", 
			tiles = {"node_texture_modifier_brick_old1.png"},
			},
		},	
	})
	register_similar_nodes({
		node_type = "bookshelf", 
		groups = minetest.registered_nodes["default:bookshelf"].groups,
		sounds = minetest.registered_nodes["default:bookshelf"].sounds,
		paramtype2 = minetest.registered_nodes["default:bookshelf"].paramtype2,
		place_param2 = 0,
		not_similar = {
			{
			name = "node_texture_modifier:bookshelf_old1", 
			description = "Bookshelf Old1", 
			tiles = {"node_texture_modifier_wood_old2.png", "node_texture_modifier_wood_old2.png",
				"node_texture_modifier_bookshelf_old1.png"},
			},
		},	
	})
	--only deco
	register_similar_nodes({
		node_type = "chest", 
		paramtype2 = minetest.registered_nodes["default:chest"].paramtype2,
		groups = minetest.registered_nodes["default:chest"].groups,
		legacy_facedir_simple = minetest.registered_nodes["default:chest"].legacy_facedir_simple,
		sounds = minetest.registered_nodes["default:chest"].sounds,
		not_similar = {
			{
			name = "node_texture_modifier:chest_old1", 
			description = "Chest Old1", 
			tiles = {"node_texture_modifier_chest_top_old1.png", "node_texture_modifier_chest_top_old1.png",
			 "node_texture_modifier_chest_side_old1.png", "node_texture_modifier_chest_side_old1.png", 
			 "node_texture_modifier_chest_side_old1.png", "node_texture_modifier_chest_front_old1.png"},
			},
			{
			name = "node_texture_modifier:chest_old2", 
			description = "Chest Old2", 
			tiles = {"node_texture_modifier_chest_top_old2.png", "node_texture_modifier_chest_top_old2.png",
			 "node_texture_modifier_chest_side_old2.png", "node_texture_modifier_chest_side_old2.png", 
			 "node_texture_modifier_chest_side_old2.png", "node_texture_modifier_chest_front_old2.png"},
			},
		},	
	})
	register_similar_nodes({
		node_type = "chest_locked", 
		paramtype2 = minetest.registered_nodes["default:chest_locked"].paramtype2,
		groups = minetest.registered_nodes["default:chest_locked"].groups,
		legacy_facedir_simple = minetest.registered_nodes["default:chest_locked"].legacy_facedir_simple,
		sounds = minetest.registered_nodes["default:chest_locked"].sounds,
		not_similar = {
			{
			name = "node_texture_modifier:chest_locked_old1", 
			description = "Locked Chest Old1", 
			tiles = {"node_texture_modifier_chest_top_old1.png", "node_texture_modifier_chest_top_old1.png",
			 "node_texture_modifier_chest_side_old1.png", "node_texture_modifier_chest_side_old1.png", 
			 "node_texture_modifier_chest_side_old1.png", "node_texture_modifier_chest_lock_old1.png"},
			},
			{
			name = "node_texture_modifier:chest_locked_old2", 
			description = "Locked Chest Old2", 
			tiles = {"node_texture_modifier_chest_top_old2.png", "node_texture_modifier_chest_top_old2.png",
			 "node_texture_modifier_chest_side_old2.png", "node_texture_modifier_chest_side_old2.png", 
			 "node_texture_modifier_chest_side_old2.png", "node_texture_modifier_chest_lock_old2.png"},
			},
		},	
	})
	register_similar_nodes({
		node_type = "furnace", 
		paramtype2 = minetest.registered_nodes["default:furnace"].paramtype2,
		groups = minetest.registered_nodes["default:furnace"].groups,
		legacy_facedir_simple = minetest.registered_nodes["default:furnace"].legacy_facedir_simple,
		sounds = minetest.registered_nodes["default:furnace"].sounds,
		not_similar = {
			{
			name = "node_texture_modifier:furnace_old1", 
			description = "Furnace Old1", 
			tiles = {"node_texture_modifier_furnace_side_old1.png", "node_texture_modifier_furnace_side_old1.png",
			 "node_texture_modifier_furnace_side_old1.png", "node_texture_modifier_furnace_side_old1.png", 
			 "node_texture_modifier_furnace_side_old1.png", "node_texture_modifier_furnace_front_old1.png"},
			},
			{
			name = "node_texture_modifier:furnace_old2", 
			description = "Furnace Old2", 
			tiles = {"node_texture_modifier_furnace_top_old1.png", "node_texture_modifier_furnace_bottom_old1.png",
			 "node_texture_modifier_furnace_side_old2.png", "node_texture_modifier_furnace_side_old2.png", 
			 "node_texture_modifier_furnace_side_old2.png", "node_texture_modifier_furnace_front_old2.png"},
			},
			{
			name = "node_texture_modifier:furnace_active_old1", 
			description = "Furnace Active Old1", 
			tiles = {"node_texture_modifier_furnace_side_old1.png", "node_texture_modifier_furnace_side_old1.png",
			 "node_texture_modifier_furnace_side_old1.png", "node_texture_modifier_furnace_side_old1.png", 
			 "node_texture_modifier_furnace_side_old1.png", "node_texture_modifier_furnace_front_active_old1.png"},
			},
			{
			name = "node_texture_modifier:furnace_active_old2_1", 
			description = "Furnace Active Old2 1", 
			tiles = {"node_texture_modifier_furnace_top_old1.png", "node_texture_modifier_furnace_bottom_old1.png",
			 "node_texture_modifier_furnace_side_old2.png", "node_texture_modifier_furnace_side_old2.png", 
			 "node_texture_modifier_furnace_side_old2.png", "node_texture_modifier_furnace_front_active_old2.png"},
			},
			{
			name = "node_texture_modifier:furnace_active_old2_2", 
			description = "Furnace Active Old2 2", 
			tiles = {"node_texture_modifier_furnace_top_old1.png", "node_texture_modifier_furnace_bottom_old1.png",
			 "node_texture_modifier_furnace_side_old2.png", "node_texture_modifier_furnace_side_old2.png", 
			 "node_texture_modifier_furnace_side_old2.png", 
				 {
					image = "node_texture_modifier_furnace_front_active_old3.png",
					backface_culling = false,
					animation = {
						type = "vertical_frames",
						aspect_w = 16,
						aspect_h = 16,
						length = 1.5
					},
				}},
			},
		},	
	})
end
