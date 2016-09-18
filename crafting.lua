minetest.register_craft({
	output = 'node_texture_modifier:hammer_and_chisel',
	recipe = {
		{'', '', 'default:steelblock'},
		{'', 'group:stick', 'default:steel_ingot'},
		{'group:stick', '', 'default:steel_ingot'},
	}
})

minetest.register_craft({
	output = 'node_texture_modifier:brush_and_dye',
	recipe = {
		{'', '', 'group:wool'},
		{'', 'group:stick', 'group:dye'},
		{'group:stick', '', 'bucket:bucket_water'},
	}
})

minetest.register_craft({
	output = 'node_texture_modifier:node_texture_modifier',
	recipe = {
		{'node_texture_modifier:hammer_and_chisel', 'default:chest', 'node_texture_modifier:brush_and_dye'},
		{'default:wood', 'default:mese_crystal', 'default:wood'},
		{'default:steel_ingot', 'default:wood', 'default:steel_ingot'},
	}
})
