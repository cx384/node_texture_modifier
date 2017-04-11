minetest.register_tool("node_texture_modifier:hammer_and_chisel", {
	description = "Hammer and Chisel",
	inventory_image = "node_texture_modifier_hammer_and_chisel.png",
	wield_image = "node_texture_modifier_hammer.png",
	metadata = "",
	
	on_place = function(itemstack, placer, pointed_thing)
		if placer == nil or pointed_thing == nil or pointed_thing.type ~= "node" then
			return itemstack
		end
		local pos = minetest.get_pointed_thing_position(pointed_thing)
		local node = minetest.get_node(pos).name
		itemstack:set_metadata(node)
		minetest.chat_send_player(placer:get_player_name(), "Hammer and Chisel setting set to: "..node)
		return itemstack
	end,
		
	on_use = function(itemstack, user, pointed_thing)
		if user == nil or pointed_thing == nil or pointed_thing.type ~= "node" then
			return nil
		end
		local pos  = minetest.get_pointed_thing_position(pointed_thing)
		local nodetable = minetest.get_node(pos)
		local node = nodetable.name
		if user:get_player_control()["sneak"] then
			itemstack:set_metadata("")
			minetest.chat_send_player(user:get_player_name(), "Hammer and Chisel setting cleared")
			return itemstack
		end
		
		local node_type = node_texture_modifier.get_node_type(node)
		if replacer_homedecor_node_is_owned(pos, user) or node_type == "----" then
			return nil
		end
		
		local metadata = itemstack:get_metadata()
		local tnodes = node_texture_modifier.get_type_nodes(node_type)
		
		if metadata == "" then
			local ranindex = math.random(#tnodes)
			local newnode = tnodes[ranindex]
			if minetest.registered_nodes[newnode] then
				nodetable.name = newnode
				minetest.swap_node(pos, nodetable)
			end
		else
			if minetest.registered_nodes[metadata] 
				and node_texture_modifier.get_node_type(metadata) == node_type then
				nodetable.name = metadata
				minetest.swap_node(pos, nodetable)
			end
		end
		return nil
	end,
})

minetest.register_tool("node_texture_modifier:brush_and_dye", {
	description = "Brush and Dye",
	inventory_image = "node_texture_modifier_brush_and_dye.png",
	wield_image = "node_texture_modifier_brush.png",
	metadata = "",
	
	on_place = function(itemstack, placer, pointed_thing)
		if placer == nil or pointed_thing == nil or pointed_thing.type ~= "node" then
			return itemstack
		end
		local pos = minetest.get_pointed_thing_position(pointed_thing)
		local node = minetest.get_node(pos).name
		itemstack:set_metadata(node)
		minetest.chat_send_player(placer:get_player_name(), "Brush and Dye setting set to: "..node)
		return itemstack
	end,
		
	on_use = function(itemstack, user, pointed_thing)
		if user == nil or pointed_thing == nil or pointed_thing.type ~= "node" then
			return nil
		end
		local pos  = minetest.get_pointed_thing_position(pointed_thing)
		local nodetable = minetest.get_node(pos)
		local node = nodetable.name
		if user:get_player_control()["sneak"] then
			itemstack:set_metadata("")
			minetest.chat_send_player(user:get_player_name(), "Brush and Dye setting cleared")
			return itemstack
		end
		
		local node_type = node_texture_modifier.get_dyed_node_type(node)
		if replacer_homedecor_node_is_owned(pos, user) or node_type == "----" then
			return nil
		end
		
		local metadata = itemstack:get_metadata()
		local tnodes = node_texture_modifier.get_type_dyed_nodes(node_type)
		local inv = user:get_inventory()
		
		if not inv:contains_item("main", "node_texture_modifier:dye_mixture") then
			return nil
		end
		
		if metadata == "" then
			local ranindex = math.random(#tnodes)
			local newnode = tnodes[ranindex]
			if minetest.registered_nodes[newnode] then
				inv:remove_item("main", "node_texture_modifier:dye_mixture")
				nodetable.name = newnode
				minetest.swap_node(pos, nodetable)
			end
		else
			if minetest.registered_nodes[metadata] 
				and node_texture_modifier.get_dyed_node_type(metadata) == node_type then
				inv:remove_item("main", "node_texture_modifier:dye_mixture")
				nodetable.name = metadata
				minetest.swap_node(pos, nodetable)
			end
		end
		return nil
	end,
})
