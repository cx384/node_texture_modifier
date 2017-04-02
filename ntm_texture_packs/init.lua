
local path_mod = minetest.get_modpath("ntm_texture_packs")
local path_minetest = string.sub(path_mod,1,string.find(path_mod,"/mods/"))
local path_mod_textures = path_mod.."/textures/"
local insecure_environment = minetest.request_insecure_environment()

if not insecure_environment then
	error("You have too add the ntm_texture_packs mod to the secure.trusted_mods setting if you want to use it.")
end

local setting_show_nodes_in_creative_inventory = minetest.setting_get("ntm_texture_packs_show_nodes_in_creative_inventory")
local setting_copy_textures = minetest.setting_get("ntm_texture_packs_copy_textures")

local function get_table_length(t)
	local l = 0
	for _, m in pairs(t) do
		l = l+1
	end
	return l
end

local function table_contains(v, t)
	for _,i in ipairs(t) do
		if i == v then
			return true
		end
	end
	return false
end

local function between_num(n, a, b)
	if n <= a and n >= b then 
		return true
	elseif n >= a and n <= b then
		return true
	end
	return false
end

local function description_to_name(description)
	local name = string.lower(description)
	local notstop = true
	while notstop do
		local numstring = string.find(name, " ")
		if numstring then
			name = string.sub(name, 1, numstring-1).."_"..string.sub(name, numstring+1) 
		else
			notstop = false
		end
	end
	for laname=1, string.len(name) do
		local la = string.sub(name,laname,laname)
		local lab = string.byte(la)
		if lab then
			local ab = string.byte("a")
			local zb = string.byte("z")
			local ob = string.byte("0")
			local nb = string.byte("9")
			local _b = string.byte("_")
			if not (between_num(lab, ab, zb) or between_num(lab, ob, nb) or lab == _b)then
				name = string.sub(name,1,laname-1).."_"..string.sub(name, laname+1)
			end
		end
	end
	return name
end

-- turns "mod:name" into "mod_name"
local function get_nwomn(name)
	local numstring = string.find(name, ":")
	local new_name = string.sub(name, numstring+1)
	local mod_name = string.sub(name, 1, numstring-1)
	return mod_name.."_"..new_name
end

local function search_for_uletters(tstring)
	local lettertable = {"[", "]", "^", "(", ")", "=", ":", string.char(92)}
	local letternumtable = {}
	for k, letter in pairs(lettertable) do
		local letterthere = string.find(tstring, letter, 1, true)
		if letterthere then
			letternumtable[k] = letterthere
		else
			letternumtable[k] = string.len(tstring)+1
		end
	end
	local letterpos = math.min(letternumtable[1], letternumtable[2], 
		letternumtable[3], letternumtable[4], letternumtable[5], 
		letternumtable[6], letternumtable[7], letternumtable[8])
	if letterpos < string.len(tstring)+1 then
		return letterpos
	else
		return false
	end
end

-- convert tile into table
local function cotiinta(tile)
	local tiletable = {}
	local letterpos = search_for_uletters(tile)
	local tableindnum = 0
	while letterpos do
		tableindnum = tableindnum+1
		tiletable[tableindnum] = {}
		tiletable[tableindnum][1] = string.sub(tile, 1, letterpos-1)
		tiletable[tableindnum][2] = "text"
		tableindnum = tableindnum+1
		tiletable[tableindnum] = {}
		tiletable[tableindnum][1] = string.sub(tile, letterpos, letterpos)
		tiletable[tableindnum][2] = "uletter"
		tile = string.sub(tile, letterpos+1)
		letterpos = search_for_uletters(tile)
	end
	tableindnum = tableindnum+1
	tiletable[tableindnum] = {}
	tiletable[tableindnum][1] = tile
	tiletable[tableindnum][2] = "text"
	return tiletable
end

local function setstring_to_table(setstring)
	local new_table = {}
	local notstop = true
	while notstop do
		local numstring = string.find(setstring, ",")
		if numstring then
			table.insert(new_table, string.sub(setstring, 1, numstring-1))
			setstring = string.sub(setstring, numstring+2)
		else
			table.insert(new_table, setstring)
			notstop = false
		end
	end
	return new_table
end

local function file_exists(name)
	setfenv(1, insecure_environment)
	local f=io.open(name,"r")
	if f~=nil then io.close(f) return true else return false end
end

local function copy_and_rename_texture(texture_pack, texture, texture_pack_name)
	setfenv(1, insecure_environment)
	local file=io.open(path_minetest.."textures/"..texture_pack.."/"..texture, "r")
	local target=io.open(path_mod_textures..texture, "w")
	target:write(file:read("*a"))
	file:close()
	target:close()
	os.rename (path_mod_textures..texture, path_mod_textures.."node_texture_modifier_"..texture_pack_name.."_"..texture)
end

local function get_and_check_texture(texture_pack, texture, texture_pack_name)
	if file_exists(path_mod_textures.."node_texture_modifier_"..texture_pack_name.."_"..texture) then
		return true
	end
	if file_exists(path_minetest.."textures/"..texture_pack.."/"..texture) and setting_copy_textures ~= "false"  then	
		copy_and_rename_texture(texture_pack, texture, texture_pack_name)
		return true
	end
	return false
end

local function get_new_texture(texture_pack, tile, texture_pack_name)
	local texture = ""
	local tiletable = {}
	local texturetm = ""
	
	if type(tile) == "string" then 
		texture = tile
		texturetm = "normal"
	elseif type(tile) == "table" and tile["name"] then
		texture = tile["name"]
		tiletable = tile
		texturetm = "name"
	elseif type(tile) == "table" and tile["image"] then
		texture = tile["image"]
		tiletable = tile
		texturetm = "image"
	end
	
	local texturetable = cotiinta(texture)
	local new_textures = 0
	for k, textureentry in pairs(texturetable) do
		local texturename = textureentry[1]
		local texturetype = textureentry[2]
		if texturename=="" or texturetype =="uletter" 
				or not string.find(texturename, ".png") then
		else
			if get_and_check_texture(texture_pack, texturename, texture_pack_name) then
				new_textures = new_textures+1
				texturetable[k][1] = "node_texture_modifier_"..texture_pack_name.."_"..texturename
			end
		end
	end
	
	local new_texture_name = ""
	
	for _, ntextureentry in pairs(texturetable) do
		new_texture_name = new_texture_name..ntextureentry[1]
	end
	
	local returntable = {}
	
	if texturetm == "name" then
		tiletable["name"] = new_texture_name
		returntable[1] = tiletable
	elseif texturetm == "image" then
		tiletable["image"] = new_texture_name
		returntable[1] = tiletable
	elseif texturetm == "normal" then
		returntable[1] = new_texture_name
	end
	
	if new_textures > 0 then
		returntable[2] = true
	else
		returntable[2] = false
	end
	
	return returntable
end

local function make_nodes_for_table(texture_pack, typenodestable)

	-- example table entry:
	-- {"stone", 				{"default:stone", "default:stone_block", "default:stonebrick"}},
	
	local texture_pack_name = description_to_name(texture_pack)
	for _, regitable in pairs(typenodestable) do
		for _, reginode in pairs(regitable[2]) do
			local node_attribute = regitable[3]
			
			-- option to disable this
			if node_attribute and table_contains("complex", node_attribute) then
				break
			end
			
			-- doors (imperfect)
			if node_attribute and table_contains("door", node_attribute) then
				local nodetable = table.copy(minetest.registered_nodes[reginode.."_a"])
				local itemtable = table.copy(minetest.registered_items[reginode])
				local inventory_image = itemtable.inventory_image
				local doortable = {}
				local new_textures = 0
				local tile = nodetable.tiles[1].name
				local new_name = texture_pack_name.."_"..get_nwomn(reginode)
				doortable.tiles = nodetable.tiles
				doortable.description = texture_pack.." "..itemtable.description
				doortable.groups = nodetable.groups
				doortable.sounds = nodetable.sounds
				
				if setting_show_nodes_in_creative_inventory ~= "true" then
					doortable.groups.not_in_creative_inventory = 1
				end
				
				if get_and_check_texture(texture_pack, inventory_image, texture_pack_name) then
					doortable.inventory_image = "node_texture_modifier_"..texture_pack_name.."_"..inventory_image
					new_textures = new_textures+1
				else
					doortable.inventory_image = inventory_image
				end
				
				if tile and get_and_check_texture(texture_pack, tile, texture_pack_name) then
					doortable.tiles[1].name = "node_texture_modifier_"..texture_pack_name.."_"..tile
					new_textures = new_textures+1
				end
				
				if new_textures > 0 then
					doors.register(new_name, doortable)
				
					node_texture_modifier.add_node_too_type("doors:"..new_name, node_texture_modifier.get_node_type(reginode))
					local dye_type = node_texture_modifier.get_dyed_node_type(reginode)
					if dye_type then
						node_texture_modifier.add_dyed_node_too_type("doors:"..new_name, dye_type)
					end
				end
				
				break
			end
			
			-- trapdoors (imperfect)
			if node_attribute and table_contains("trapdoor", node_attribute) then
				local nodetable = table.copy(minetest.registered_nodes[reginode])
				local new_name = "node_texture_modifier:"..texture_pack_name.."_"..get_nwomn(reginode)
				local trapdoortable = {}
				local inventory_image = nodetable.inventory_image
				local tile_front = nodetable.tiles[1]
				local tile_side = nodetable.tiles[3]
				local new_textures = 0
				trapdoortable.description = texture_pack.." "..nodetable.description
				trapdoortable.groups = nodetable.groups
				trapdoortable.sounds = nodetable.sounds
				
				if setting_show_nodes_in_creative_inventory ~= "true" then
					trapdoortable.groups.not_in_creative_inventory = 1
				end
				
				if get_and_check_texture(texture_pack, inventory_image, texture_pack_name) then
					trapdoortable.inventory_image = "node_texture_modifier_"..texture_pack_name.."_"..inventory_image
					trapdoortable.wield_image = "node_texture_modifier_"..texture_pack_name.."_"..inventory_image
					new_textures = new_textures+1
				else
					trapdoortable.inventory_image = inventory_image
					trapdoortable.wield_image = inventory_image
				end
				
				if tile_front and get_and_check_texture(texture_pack, tile_front, texture_pack_name) then
					trapdoortable.tile_front = "node_texture_modifier_"..texture_pack_name.."_"..tile_front
					new_textures = new_textures+1
				else
					trapdoortable.tile_front = tile_front
				end
				
				if tile_side and get_and_check_texture(texture_pack, tile_side, texture_pack_name) then
					trapdoortable.tile_side = "node_texture_modifier_"..texture_pack_name.."_"..tile_side
					new_textures = new_textures+1
				else
					trapdoortable.tile_side = tile_side
				end
				
				if new_textures > 0 then
					doors.register_trapdoor(":"..new_name, trapdoortable)
					
					node_texture_modifier.add_node_too_type(new_name, node_texture_modifier.get_node_type(reginode))
					local dye_type = node_texture_modifier.get_dyed_node_type(reginode)
					if dye_type then
						node_texture_modifier.add_dyed_node_too_type(new_name, dye_type)
					end
				end
				
				break
			end
			
			--[[
			-- fencegates (imperfect)
			if node_attribute and table_contains("fencegate", node_attribute) then
				break
			end
			]]--
			
			-- panes (imperfect)
			if node_attribute and table_contains("pane", node_attribute) then
				local nodetable = table.copy(minetest.registered_nodes[reginode])
				local new_name = texture_pack_name.."_"..string.sub(get_nwomn(reginode), 1, -6)
				local panetable = {}
				local inventory_image = nodetable.inventory_image
				local textures = nodetable.tiles
				local new_textures = 0
				panetable.description = texture_pack.." "..nodetable.description
				panetable.groups = nodetable.groups
				panetable.groups.pane = 0
				panetable.sounds = nodetable.sounds
				panetable.recipe = {{""}}
				
				if setting_show_nodes_in_creative_inventory ~= "true" then
					panetable.groups.not_in_creative_inventory = 1
				end
				
				if get_and_check_texture(texture_pack, inventory_image, texture_pack_name) then
					panetable.inventory_image = "node_texture_modifier_"..texture_pack_name.."_"..inventory_image
					panetable.wield_image = "node_texture_modifier_"..texture_pack_name.."_"..inventory_image
					new_textures = new_textures+1
				else
					panetable.inventory_image = inventory_image
					panetable.wield_image = inventory_image
				end
				
				if textures then
					local newtexturest = {}
					if get_and_check_texture(texture_pack, textures[1], texture_pack_name) then
						local thetable = get_new_texture(texture_pack, textures[1], texture_pack_name)
						newtexturest[3] = thetable[1]
						if thetable[2] == true then
							new_textures = new_textures+1
						end
					end
					if get_and_check_texture(texture_pack, textures[3], texture_pack_name) then
						local thetable = get_new_texture(texture_pack, textures[3], texture_pack_name)
						newtexturest[1] = thetable[1]
						if thetable[2] == true then
							new_textures = new_textures+1
						end
					end
					panetable.textures = newtexturest
				end
				
				if new_textures > 0 then
					xpanes.register_pane(new_name, panetable)
				
					node_texture_modifier.add_node_too_type("xpanes:"..new_name.."_flat", node_texture_modifier.get_node_type(reginode))
					local dye_type = node_texture_modifier.get_dyed_node_type(reginode)
					if dye_type then
						node_texture_modifier.add_dyed_node_too_type("xpanes:"..new_name.."_flat", dye_type)
					end
				end
				break
			end
			
			-- torch (imperfect)
			if node_attribute and table_contains("torch", node_attribute) then
				break
			end
			

			-- normal nodes 
			if not minetest.registered_nodes[reginode] then
				break
			end
				
			local nodetable = ""
			
			-- old 2dtorch
			if node_attribute and table_contains("2dtorch", node_attribute) then
			
				--taken from default 
				--( https://github.com/minetest/minetest_game/commit/0bd2efcfc1fb23bdb078d5aaeea8cad8ec27d828#diff-4c0fc0806e6a443774cea3aea5f3febeL1595 )
				nodetable = {
					description = "Torch",
					drawtype = "torchlike",
					tiles = {
						{
							name = "default_torch_on_floor_animated.png",
							animation = {
								type = "vertical_frames",
								aspect_w = 16,
								aspect_h = 16,
								length = 3.0
							},
						},
						{
							name="default_torch_on_ceiling_animated.png",
							animation = {
								type = "vertical_frames",
								aspect_w = 16,
								aspect_h = 16,
								length = 3.0
							},
						},
						{
							name="default_torch_animated.png",
							animation = {
								type = "vertical_frames",
								aspect_w = 16,
								aspect_h = 16,
								length = 3.0
							},
						},
					},
					inventory_image = "default_torch_on_floor.png",
					wield_image = "default_torch_on_floor.png",
					paramtype = "light",
					paramtype2 = "wallmounted",
					sunlight_propagates = true,
					is_ground_content = false,
					walkable = false,
					light_source = default.LIGHT_MAX - 1,
					selection_box = {
						type = "wallmounted",
						wall_top = {-0.1, 0.5 - 0.6, -0.1, 0.1, 0.5, 0.1},
						wall_bottom = {-0.1, -0.5, -0.1, 0.1, -0.5 + 0.6, 0.1},
						wall_side = {-0.5, -0.3, -0.1, -0.5 + 0.3, 0.3, 0.1},
					},
					groups = {choppy = 2, dig_immediate = 3, flammable = 1, attached_node = 1},
					legacy_wallmounted = true,
					sounds = default.node_sound_defaults(),
				}
			else
				nodetable = table.copy(minetest.registered_nodes[reginode])
			end
			
			if setting_show_nodes_in_creative_inventory ~= "true" then
				nodetable.groups.not_in_creative_inventory = 1
			end
			
			if node_attribute then
				local deleteentrys = node_attribute["deleteentrys"]
				if deleteentrys then
					for _, dentry in pairs(deleteentrys) do
						nodetable[dentry] = nil
					end
				end
			end
			
			local new_nodename = "node_texture_modifier:"..texture_pack_name.."_"..get_nwomn(reginode)
			local new_description = texture_pack.." "..nodetable["description"]
			nodetable["description"] = new_description
			
			local new_tiles = 0
			local missing_tiles = 0
			
			for k, tile in pairs(nodetable["tiles"]) do
				if type(tile) ~= "string" and type(tile) ~= "table" then 
					break
				end
				local ttile_table = get_new_texture(texture_pack, tile, texture_pack_name)
				nodetable["tiles"][k] = ttile_table[1]
				if ttile_table[2] then
					new_tiles = new_tiles +1
				end
				tile = ""
			end
			
			local inventory_image = nodetable["inventory_image"]
			if inventory_image then
				local tinventory_image_table = get_new_texture(texture_pack, inventory_image, texture_pack_name)
				nodetable["inventory_image"] = tinventory_image_table[1]
				if tinventory_image_table[2] then
					new_tiles = new_tiles +1
				end
			end
			
			local wield_image = nodetable["inventory_image"]
			if wield_image then
				local twield_image_table = get_new_texture(texture_pack, wield_image, texture_pack_name)
				nodetable["wield_image"] = twield_image_table[1]
				if twield_image_table[2] then
					new_tiles = new_tiles +1
				end
			end
			
			if new_tiles > 0 then
				minetest.register_node(":"..new_nodename, nodetable)
				node_texture_modifier.add_node_too_type(new_nodename, node_texture_modifier.get_node_type(reginode))
				local dye_type = node_texture_modifier.get_dyed_node_type(reginode)
				if dye_type then
					node_texture_modifier.add_dyed_node_too_type(new_nodename, dye_type)
				end
			end
		end
	end
end

local function get_all_tps()
	setfenv(1, insecure_environment)
    local i, t, popen = 0, {}, io.popen
    local pfile = {}
    if string.sub(path_minetest,1,6) == "/home/" then
		--linux
		pfile = popen("ls -a "..path_minetest.."textures")
	elseif string.sub(path_minetest,2,9) == ":"..string.char(72).."Users"..string.char(72) then
		--windows (not tested yet)
		pfile = popen("dir "..path_minetest.."textures /b /ad")
	else
		return {}
	end
    for filename in pfile:lines() do
        if filename ~= ".." and filename ~= "." and filename ~= nil then
			i = i + 1
			t[i] = filename
        end
    end
    pfile:close()
    return t
end

local activated_tps = {}
if minetest.setting_get("ntm_texture_packs_activate_all_texture_packs") ~= "false" then
	activated_tps = get_all_tps()
else
	activated_tps = setstring_to_table(minetest.setting_get("ntm_texture_packs_activated_texture_packs"))
end

if activated_tps then 	
	for _, texture_pack in pairs(activated_tps) do
		for _, registration_table in pairs(node_texture_modifier.registrations) do
			make_nodes_for_table(texture_pack, registration_table)
		end
	end
end
