
node_texture_modifier.node_types = {}

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

function node_texture_modifier.add_node_too_type(node, node_type)
	if not minetest.registered_nodes[node] then
		return
	end

	if not node_texture_modifier.node_types[""..node_type..""] then
		node_texture_modifier.node_types[""..node_type..""] = {node}
	else
		local ltable = node_texture_modifier.node_types[""..node_type..""]
		table.insert(ltable, node)
		table.sort(ltable)
		node_texture_modifier.node_types[""..node_type..""] = ltable
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

function node_texture_modifier.get_type_nodes(node_type)
	return node_texture_modifier.node_types[""..node_type..""]
end

local function update_formspec(pos)
	local meta = minetest.get_meta(pos)
	local inv = meta:get_inventory()
	local inputstack = inv:get_stack("in", 1)
	local inputcount = inputstack:get_count()
	local inputname = inputstack:get_name()
	local node_type = node_texture_modifier.get_node_type(inputname)
	local node_types =	node_texture_modifier.get_type_nodes(node_type)
	local page = meta:get_int("page")
	local maxpage = 1
	if node_types then
		maxpage = math.ceil(#node_types / inv:get_size("out"))
	end
	if page > maxpage then
		meta:set_int("page", maxpage)
	end
	if minetest.setting_get("node_texture_modifier_display_node_type")=="true" or
	not minetest.setting_get("node_texture_modifier_display_node_type") then
		meta:set_string("formspec", 
			"size[9,10]" ..
			default.gui_bg ..
			default.gui_bg_img ..
			default.gui_slots ..
			"list[current_name;in;0.3,0.3;1,1;]" ..
			"list[current_name;out;2,0.3;7,5;]" ..
			"list[current_player;main;1,5.85;8,1;]" ..
			"list[current_player;main;1,7.08;8,3;8]" ..
			"listring[current_player;main]" ..
			"listring[current_name;in]" ..
			"listring[current_player;main]" ..
			"listring[current_name;out]" ..
			"label[0,1.6;Node Type: "..node_type.."]" ..
			"button[0,4;1,1;left;<-]" ..
			"label[0,3.5;Page: "..page.."]" ..
			"button[1,4;1,1;right;->]" ..
			"image[0,0;1.7,1.7;gui_hotbar_selected.png]" ..
			default.get_hotbar_bg(1,5.85))
	else
		meta:set_string("formspec", 
			"size[9,10]" ..
			default.gui_bg ..
			default.gui_bg_img ..
			default.gui_slots ..
			"list[current_name;in;0.3,0.3;1,1;]" ..
			"list[current_name;out;2,0.3;7,5;]" ..
			"list[current_player;main;1,5.85;8,1;]" ..
			"list[current_player;main;1,7.08;8,3;8]" ..
			"listring[current_player;main]" ..
			"listring[current_name;in]" ..
			"listring[current_player;main]" ..
			"listring[current_name;out]" ..
			"button[0,4;1,1;left;<-]" ..
			"label[0,3.5;Page: "..page.."]" ..
			"button[1,4;1,1;right;->]" ..
			"image[0,0;1.7,1.7;gui_hotbar_selected.png]" ..
			default.get_hotbar_bg(1,5.85))
	end
	for slot=1, inv:get_size("out") do
		inv:set_stack("out", slot, "")
	end
	if inv:is_empty("in") or node_type=="----" then
	else
		local slotspside = inv:get_size("out")*(page-1)
		for slot=1, #node_types-slotspside do
			inv:set_stack("out", slot, node_types[slot+slotspside].." "..inputcount)
		end
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
		update_formspec(pos)
		local meta = minetest.get_meta(pos)
		local inv = meta:get_inventory()
		meta:set_int("page", 1)
		inv:set_size("out", 7*5)
		inv:set_size("in", 1)
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
	on_metadata_inventory_take = function(pos, listname, index, stack)
		if listname=="out" then
			local meta = minetest.get_meta(pos)
			local inv = meta:get_inventory()
			local instack = inv:get_stack("in", 1)
			local newcount = instack:get_count()-stack:get_count()
			inv:set_stack("in", 1, instack:get_name().." "..newcount )
		end
		update_formspec(pos, stack)
	end,
	on_receive_fields = function(pos, formname, fields)
		local meta = minetest.get_meta(pos)
		local page = meta:get_int("page")
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
		return inv:is_empty("in")
	end,
})
