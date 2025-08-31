local util_math=require("util.math")
local uCreator=require("util.universeCreator")
local belt=require("prototypes.asteroids-belt")
local planet_gen_settings=require("prototypes.planet_gen_settings")
local planetCreator={}

local function make_gazeous_planet(gen,index,star,distance,position,planetname)
    local icon=gen:random(1,gazeous_graphics)
    local planet=table.deepcopy(gpPlanetCollector.vanilla["space-location"]["solar-system-edge"])
    planet.icon="__zzz-GalacticProtocol__/graphics/starmap/gazeous/icon-"..icon..".png"
    planet.starmap_icon="__zzz-GalacticProtocol__/graphics/starmap/gazeous/icon-"..icon.."-starmap.png"
    planet.starmap_icon_size=512
    planet.magnitude=gen:random(2,4)
    planet.gravity_pull= planet.magnitude*10
    planet.name=planetname
    planet.localised_name=planetname
    planet.draw_orbit = false
    planet.distance=position.distance
    planet.orientation=position.angle or position.orientation
    planet.auto_save_on_first_trip=false
    planet.solar_power_in_space=util_math.map(distance,0,50,star.solar_power_in_space,1)
    planet.moon_number=gen:random(2,4)
    planet.field=uCreator.get_gazeous_field(gen)
    return planet
end



local function make_solid_planet(gen,index,star,distance,position,planetname,moon)
    local available_type={}
    for _,v in pairs({"vanilla","modded"}) do
        for key,_ in pairs(gpPlanetCollector[v].planet) do
            table.insert(available_type,key)
        end
    end
    local planet_type_base=available_type[gen:random(1,#available_type)]
    local planet=table.deepcopy(gpPlanetCollector.vanilla.planet[planet_type_base] or gpPlanetCollector.modded.planet[planet_type_base])
    planet.name=planetname
    planet.localised_name=planetname
    planet.draw_orbit = false
    planet.magnitude=gen:random(0,2)*planet.magnitude
    if moon then
        planet.magnitude=planet.magnitude/3
        planet.localised_name={"",{"gui.moon"},planetname}
    end
    planet.distance=position.distance
    planet.orientation=position.angle or position.orientation
    planet.auto_save_on_first_trip=false
    planet.solar_power_in_space=util_math.map(distance,0,50,star.solar_power_in_space,1)
    planet.surface_properties["solar-power"]=(planet.surface_properties["solar-power"]< planet.solar_power_in_space and planet.surface_properties["solar-power"]) or planet.solar_power_in_space
    planet.surface_properties["size_surface"]=uCreator.get_planet_size(planet.magnitude)
    if not moon then
        planet.moon_number=gen:random(0,1)
    end
    planet.moon=moon or false
    planet_gen_settings.tweak_planet(gen,planet)
    planet.base_type=planet_type_base
    return planet
end

function planetCreator.create_planet(index,star,distance,position,planetname,moon)
    local gen=mwc(util_math.hash(planetname))
    local randnumber=gen:random()
    if randnumber<0.1 and not moon then
        return belt.asteroid_belt(gen,index,star,distance,position,planetname)
    elseif randnumber<0.2 and not moon then
        return make_gazeous_planet(gen,index,star,distance,position,planetname)
    else
        return make_solid_planet(gen,index,star,distance,position,planetname,moon)
    end
end


return planetCreator