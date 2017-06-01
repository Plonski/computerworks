local computer = minetest.get_content_id("default:chest")

local computer_formspec =
	"size[8,9]"..
	--default.gui_bg..
	--default.gui_bg_img..
	--default.gui_slots..
	"list[current_name;main;0,0.3;8,4;]"..
	"list[current_player;main;0,4.85;8,1;]"..
	"list[current_player;main;0,6.08;8,3;8]"..
        "button[2,2;2,2;name;Load disk]"
--default.get_hotbar_bg(0,4.85)


minetest.register_node('computerworks:farming', {
    description = 'computer',
    titles = {'picture.png'},
    group = {snappy=1, oddly_breakable_by_hand=2},

    on_construct = function(pos)
	local meta = minetest.get_meta(pos)
	meta:set_string("formspec", computer_formspec)
	meta:set_string("infotext", "Computer")
	local inv = meta:get_inventory()
	inv:set_size("main", 1*1)
    end,


    on_receive_fields = function(pos, formname, fields, player)
         if (fields.quit) then return end
         print(fields.x)
    end,  

    on_rightclick = function(pos, node, player, itemstack, pointed_thing)
        local meta = minetest.get_meta(pos)
        meta:set_string("formspec",
                         "size[15, 15]",
                         "label[1,1; This is shown on right click]"..
                         "field[1,2;2,1;x;x;]")

    end,

    allow_metadata_inventory_put = function(pos, listname, index, stack, player)
    if player then
	minetest.chat_send_player(player:get_player_name(),
	"You're not allowed to put things in treasure chests!")
	    return 0
        end

    end,

    on_metadata_inventory_put = function(pos, listname, index, stack, player)
	minetest.log("action", player:get_player_name() ..
         	" moves stuff to chest at " .. minetest.pos_to_string(pos))
    end

})

minetest.register_node("computerworks:floppy_disk",{
     description = "floppy disk",
     titles = {"floppy.png"},
     group = {snappy=1},

})


minetest.register_craft({
    output = 'testmod:computer',
    recipe = {
         {'default:dirt', 'default:dirt',},
         {'default:dirt', 'default:dirt',},
         }, 
})


minetest.on_metadata_inventory_put = function(pos, listname, index, stack, player)
    minetest.chat_send_player(player:get_player_name(), "yooo")
end

minetest.register_on_player_receive_fields(function(player, formname, fields)
    minetest.chat_send_player("singleplayer", "yooo")
    if fields.name then
        print("hello")
    	minetest.chat_send_player(player:get_player_name(), "yooo")
    end
end)

