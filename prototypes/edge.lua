local uCreator=require("util.universeCreator")

local edge={}


---create a star for system
---@param etoile spacelocation : star 
function edge.create_edge(etoile)
    local position=uCreator.make_final_coord(etoile,{distance=50,orientation=0.25})
    local edge_system={

    type = "space-location",
    name = etoile.name.."-system-edge",
    localised_name={"gui.edgenamefromstar",etoile.name},
    icons = {
        {
            icon = "__zzz-GalacticProtocol__/graphics/icons/solar-system-edge.png",
            icon_size = 64,
        }
    },
    starmap_icons = {
        {
            icon = "__zzz-GalacticProtocol__/graphics/icons/solar-system-edge.png",
            icon_size = 64,
        }
    },
    order = "z",
    subgroup=etoile.name,
    draw_orbit = false,
    gravity_pull = 0,
    solar_power_in_space = 1,
    distance = position.distance,
    magnitude=1,
    orientation = position.orientation,
}
return edge_system
end


return edge