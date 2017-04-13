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
		{'', 'group:stick', 'node_texture_modifier:dye_mixture'},
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

minetest.register_craft({
	type = "shapeless",
	output = "node_texture_modifier:dye_mixture 5",
	recipe = {"dye:cyan", "dye:magenta", "dye:yellow", "dye:black", "dye:white"},
})

minetest.register_craft({
	type = "shapeless",
	output = "node_texture_modifier:dye_mixture 5",
	recipe = {"dye:red", "dye:green", "dye:blue", "dye:black", "dye:white"},
})

minetest.register_craft({
	type = "shapeless",
	output = "node_texture_modifier:dye_mixture 3",
	recipe = {"node_texture_modifier:dye_mixture", "group:dye", "node_texture_modifier:dye_mixture"},
})

if minetest.setting_get("node_texture_modifier_disable_dyeing") ~= "true" then
	for _, dye in ipairs(dye.dyes) do
		minetest.register_craft({
			type = "shapeless",
			output = "dye:"..dye[1].." 2",
			recipe = {"dye:"..dye[1], "node_texture_modifier:dye_mixture"},
		})
	end
end
