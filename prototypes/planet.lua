local util_math=require("util.math")
local uCreator=require("util.universeCreator")
local planetCreator={}

local function make_solid_planet(index,starname,position,planetname)
    local gen=mwc(util_math.hash(planetname))
    local planet=table.deepcopy(gpPlanetCollector.vanilla.planet["nauvis"])
    planet.name=planetname
    planet.localised_name=planetname
    planet.draw_orbit = false
    planet.distance=position.distance
    planet.orientation=position.angle or position.orientation
    return planet
end

function planetCreator.create_planet(index,starname,position,planetname)
    return make_solid_planet(index,starname,position,planetname)
end


return planetCreator