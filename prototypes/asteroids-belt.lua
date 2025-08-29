local util_math=require("util.math")
local belt={}

function belt.asteroid_belt(gen,index,star,distance,position,planetname)
    local icon=1--gen:random(1,gazeous_graphics)
    local planet=table.deepcopy(gpPlanetCollector.vanilla["space-location"]["solar-system-edge"])
    planet.icon="__zzz-GalacticProtocol__/graphics/starmap/belt/icon-"..icon..".png"
    planet.starmap_icon="__zzz-GalacticProtocol__/graphics/starmap/belt/icon-"..icon.."-starmap.png"
    planet.starmap_icon_size=512
    planet.magnitude=1
    planet.gravity_pull= 0
    planet.name="gpbelt-"..planetname
    planet.localised_name=planetname
    planet.draw_orbit = false
    planet.distance=position.distance
    planet.orientation=position.angle or position.orientation
    planet.auto_save_on_first_trip=false
    planet.solar_power_in_space=util_math.map(distance,0,50,star.solar_power_in_space,1)
    planet.fly_condition=true
    planet.moon=true
    return planet
end


function belt.starmap_belt()

end

return belt