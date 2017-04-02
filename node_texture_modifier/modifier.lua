
node_texture_modifier.node_types = {}
node_texture_modifier.dyed_node_types = {}

minetest.register_chatcommand("show_node_types", {
    params = "",
    description = "List all node types that you can convert in the Node Texture Modifier.",
    func = function(name)
		table.sort(node_texture_modifier.node_types)
		for node_type, ttypes in pairs(node_texture_modifier.node_types) do
			local sendnodes = ""
			for _, tnodes in pairs(ttypes) do
				sendnodes = sendnodes..tnodes..", "
			end
			minetest.chat_send_player(name, "[ "..node_type.." ] -> "..sendnodes)
		end
        return true
    end
})

minetest.register_chatcommand("show_dyed_node_types", {
    params = "",
    description = "List all dyed node types that you can convert in the Node Texture Modifier with dye.",
    func = function(name)
		table.sort(node_texture_modifier.dyed_node_types)
		for dyed_node_type, ttypes in pairs(node_texture_modifier.dyed_node_types) do
			local sendnodes = ""
			for _, tnodes in pairs(ttypes) do
				sendnodes = sendnodes..tnodes..", "
			end
			minetest.chat_send_player(name, "[ "..dyed_node_type.." ] -> "..sendnodes)
		end
        return true
    end
})

function node_texture_modifier.add_node_too_type(node, node_type)
	if not minetest.registered_items[node] then
		return
	end

	if not node_texture_modifier.node_types[node_type] then
		node_texture_modifier.node_types[node_type] = {node}
	else
		local ltable = node_texture_modifier.node_types[node_type]
		table.insert(ltable, node)
		table.sort(ltable)
		node_texture_modifier.node_types[node_type] = ltable
	end
end

function node_texture_modifier.add_dyed_node_too_type(node, dyed_node_type)
	if not minetest.registered_items[node] then
		return
	end

	if not node_texture_modifier.dyed_node_types[dyed_node_type] then
		node_texture_modifier.dyed_node_types[dyed_node_type] = {node}
	else
		local ltable = node_texture_modifier.dyed_node_types[dyed_node_type]
		table.insert(ltable, node)
		table.sort(ltable)
		node_texture_modifier.dyed_node_types[dyed_node_type] = ltable
	end
end

function node_texture_modifier.get_node_type(node)
	for node_type, tnodes in pairs(node_texture_modifier.node_types) do
		for _, tnode in pairs(tnodes) do
			if node == tnode then
				return node_type
			end
		end
	end
	return "----"
end

function node_texture_modifier.get_dyed_node_type(node)
	for dyed_node_type, tnodes in pairs(node_texture_modifier.dyed_node_types) do
		for _, tnode in pairs(tnodes) do
			if node == tnode then
				return dyed_node_type
			end
		end
	end
	return "----"
end

function node_texture_modifier.get_type_nodes(node_type)
	return node_texture_modifier.node_types[node_type]
end

function node_texture_modifier.get_type_dyed_nodes(dyed_node_type)
	return node_texture_modifier.dyed_node_types[dyed_node_type]
end

local function update_formspec(pos)
	local meta = minetest.get_meta(pos)
	local inv = meta:get_inventory()
	local inputstack = inv:get_stack("in", 1)
	local inputcount = inputstack:get_count()
	local inputname = inputstack:get_name()
	local node_type = node_texture_modifier.get_node_type(inputname)
	local node_types = node_texture_modifier.get_type_nodes(node_type)
	local dyed_node_type = node_texture_modifier.get_dyed_node_type(inputname)
	local dyed_node_types =	node_texture_modifier.get_type_dyed_nodes(dyed_node_type)
	local page = meta:get_int("page")
	local maxpage = 1
	local modename = "click me"
	local modeimage = "node_texture_modifier_node_texture_modifier.png"
	local dsnode_type = "----"
	
	if node_types then
		maxpage = math.ceil(#node_types / inv:get_size("out"))
	end
	if dyed_node_types then
		maxpage = math.ceil(#dyed_node_types / inv:get_size("out"))
	end
	if page > maxpage then
		meta:set_int("page", maxpage)
	end
	if meta:get_string("mode")=="chisel" then
		modename = "Chisel"
		modeimage = "node_texture_modifier_hammer_and_chisel.png"
		dsnode_type = node_type
	elseif meta:get_string("mode")=="brush" then
		modename = "Brush"
		modeimage = "node_texture_modifier_brush_and_dye.png"
		dsnode_type = dyed_node_type
	end
	
	meta:set_string("formspec", 
		"size[10,11]" ..
		default.gui_bg ..
		default.gui_bg_img ..
		default.gui_slots ..
		"list[current_name;in;0.5,0.3;1,1;]" ..
		"list[current_name;out;2.5,0.3;7,6;]" ..
		"list[current_player;main;1,6.85;8,1;]" ..
		"list[current_player;main;1,8.08;8,3;8]" ..
		"listring[current_player;main]" ..
		"listring[current_name;in]" ..
		"listring[current_player;main]" ..
		"listring[current_name;out]" ..
		"list[current_name;store;0,3.3;2,2;]" ..
		"image[0,3.3;1,1;node_texture_modifier_dye_mixture.png]" ..
		"image[0.2,0;1.7,1.7;gui_hotbar_selected.png]" ..
		"button[0,2.2;1,1;mode;"..modename.."]" ..
		"image[1,2.2;1,1;"..modeimage.."]" ..
		"label[0,1.6;Node Type: "..dsnode_type.."]" ..
		"label[0,5.3;Page: "..page.."]" ..
		"button[0,5.7;1,1;left;<-]" ..
		"button[1,5.7;1,1;right;->]" ..
		"image[0.2,0;1.7,1.7;gui_hotbar_selected.png]" ..
		default.get_hotbar_bg(1,6.85))
	
	for slot=1, inv:get_size("out") do
		inv:set_stack("out", slot, "")
	end
	
	local mode = meta:get_string("mode")
	
	if mode =="chisel" then
		if inv:is_empty("in") or node_type=="----" then
		else
			local slotspside = inv:get_size("out")*(page-1)
			for slot=1, #node_types-slotspside do
				inv:set_stack("out", slot, node_types[slot+slotspside].." "..inputcount)
			end
		end
	end
	
	if mode =="brush" then
		if inv:is_empty("in") or dyed_node_type=="----" 
			or minetest.setting_get("node_texture_modifier_disable_dyeing") == "true" then
		else
			if inv:contains_item("store", "node_texture_modifier:dye_mixture "..inputcount) then
				local slotspside = inv:get_size("out")*(page-1)
				for slot=1, #dyed_node_types-slotspside do
					inv:set_stack("out", slot, dyed_node_types[slot+slotspside].." "..inputcount)
				end
			end
		end
		
	end
end

local function get_real_count(instack,new_stack,stack)
	if not new_stack:is_empty() then
		if new_stack:get_name() ~= stack:get_name() 
		or new_stack:get_count() == new_stack:get_stack_max() then
			return instack:get_count()
		elseif new_stack:get_count() + stack:get_count() > stack:get_stack_max() then
			return stack:get_count() - new_stack:get_count()
		end
	end

	return stack:get_count()
end

local function return_items(stack,player)
	local inv = player:get_inventory()

	local excess = inv:add_item("main",stack)
	if excess and not excess:is_empty() then
		minetest.item_drop(excess,player,player:getpos())
	end
end

minetest.register_node("node_texture_modifier:node_texture_modifier", {
	description = "Node Texture Modifier",
	tiles = {"node_texture_modifier_node_texture_modifier.png", "node_texture_modifier_node_texture_modifier.png",
	 "node_texture_modifier_node_texture_modifier_side.png^node_texture_modifier_brush_and_dye.png", 
	 "node_texture_modifier_node_texture_modifier_side.png^node_texture_modifier_brush_and_dye.png", 
	 "node_texture_modifier_node_texture_modifier_side.png^node_texture_modifier_hammer_and_chisel.png", 
	 "node_texture_modifier_node_texture_modifier_side.png^node_texture_modifier_hammer_and_chisel.png"},
	is_ground_content = false,
	groups = {cracky = 3, choppy = 3, oddly_breakable_by_hand = 3},
	paramtype2 = "facedir",
	legacy_facedir_simple = true,
	sounds = default.node_sound_wood_defaults(),
	
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		local inv = meta:get_inventory()
		meta:set_string("mode", "chisel")
		meta:set_int("page", 1)
		inv:set_size("out", 7*6)
		inv:set_size("in", 1)
		inv:set_size("store", 2*2)
		update_formspec(pos)
	end,
	allow_metadata_inventory_put = function(pos, listname, index, stack)
		if listname == "out" then
			return 0
		end
		return stack:get_count()
	end,
	allow_metadata_inventory_move  = function(pos, listname)
			return 0
	end,
	on_metadata_inventory_put = function(pos)
		update_formspec(pos)
	end,
	on_metadata_inventory_take = function(pos, listname, index, stack, player)
		local meta = minetest.get_meta(pos)
		local inv = meta:get_inventory()
		if listname=="out" then
		
			local mode = meta:get_string("mode")
			local instack = inv:get_stack("in", 1)
			local new_stack = inv:get_stack("out",index)
			local count = get_real_count(instack,new_stack,stack)
			local newcount = instack:get_count()-count
			local mode = meta:get_string("mode")
			
			if mode =="chisel" then
				-- Return items if a right-click swap has happened
				if new_stack:get_name() ~= stack:get_name()
				or new_stack:get_count() == new_stack:get_stack_max() then
					return_items(new_stack,player)
				end

				inv:set_stack("in", 1, instack:get_name().." "..newcount )
			end
			
			if mode =="brush" then
				-- Return items if a right-click swap has happened
				if new_stack:get_name() ~= stack:get_name()
				or new_stack:get_count() == new_stack:get_stack_max() then
					return_items(new_stack,player)
				end

				inv:set_stack("in", 1, instack:get_name().." "..newcount )
				
				inv:remove_item("store", "node_texture_modifier:dye_mixture "..count)
				
			end
		end
		update_formspec(pos, stack)
	end,
	on_receive_fields = function(pos, formname, fields)
		local meta = minetest.get_meta(pos)
		local page = meta:get_int("page")
		if fields.mode then
			if meta:get_string("mode")=="brush" then
				meta:set_string("mode", "chisel")
			else
				meta:set_string("mode", "brush")
			end
		end
		if fields.left and page >1 then
			meta:set_int("page", page-1)
		elseif fields.right then
			meta:set_int("page", page+1)
		end
		update_formspec(pos)
	end,
	can_dig = function(pos,player)
		local meta = minetest.get_meta(pos);
		local inv = meta:get_inventory()
		return inv:is_empty("in") and inv:is_empty("store")
	end,
})
