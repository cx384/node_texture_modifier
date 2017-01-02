minetest.register_craftitem("node_texture_modifier:hammer_and_chisel", {
	description = "Hammer and Chisel",
	inventory_image = "node_texture_modifier_hammer_and_chisel.png",
})

minetest.register_craftitem("node_texture_modifier:brush_and_dye", {
	description = "Brush and Dye",
	inventory_image = "node_texture_modifier_brush_and_dye.png",
})	

minetest.register_craftitem("node_texture_modifier:dye_mixture", {
	description = "Dye Mixture",
	inventory_image = "node_texture_modifier_dye_mixture.png",
	stack_max = minetest.craftitemdef_default.stack_max*9*4,
	groups = {dye=1},
})	
