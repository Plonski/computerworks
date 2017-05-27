minetest.register_node('computerworks:farming', {
    description = 'computer',
    titles = {'picture.png'},
    group = {snappy=1, oddly_breakable_by_hand=2},

    after_place_node = function(pos, placer)
         local meta = minetest.get_meta(pos)
         meta:set_string("formspec",
                         "size[30,30]",
                         "label[1,1; This is shown on right click]"..
                         "field[1,2;2,1;x;x;]")
         end,
    on_receive_fields = function(pos, formname, fields, player)
         if (fields.quit) then return end
         print(fields.x)
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





