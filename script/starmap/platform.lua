local util_math=require("util.math")

local sm_platform={}

local function createPlatformPh(platform)
    local surface=nil
    local position=nil
    if platform.space_location then
        surface=storage.gpuniverse[platform.space_location.name]
        position=platform.space_location.position
    elseif platform.last_visited_space_location then
        surface=storage.gpuniverse[platform.last_visited_space_location.name]
        position= platform.last_visited_space_location.position
    else
        return
    end
    local ship=game.surfaces[surface.name].create_entity{type="lamp",name="spaceshipph",position=position,force="gp-superfriendly"}
    storage.gpplatform[platform.index]=ship
    storage.gpship[ship.unit_number]=platform
end

local function get_pos_on_map_from_connection(platform)
    local space_connection=platform.space_connection
    local from=space_connection.from
    local to=space_connection.to
    local length=space_connection.length

    local dist=platform.distance
    local x=util_math.map(dist,0,1,from.position.x,to.position.x)
    local y=util_math.map(dist,0,1,from.position.y,to.position.y)
    return {x=x,y=y}

end

local function on_space_platform_changed_state(e)

end

local function on_tick(e)
    if e.tick%5==0 then
        for _,force in pairs(game.forces) do
            for _,platform in pairs(force.platforms) do
                if not storage.gpplatform[platform.index] then
                    createPlatformPh(platform)
                end
                if platform.space_location then
                    local circle_size = math.abs(prototypes.entity[platform.space_location.name].selection_box.left_top.x)
                    circle_size = circle_size + 0.3 * circle_size

                    local position=util_math.add_vector(platform.space_location.position,util_math.pol_to_cart(circle_size,platform.index+e.tick/500))
                    storage.gpplatform[platform.index].teleport(position)
                elseif platform.space_connection then
                    local position=get_pos_on_map_from_connection(platform)
                    storage.gpplatform[platform.index].teleport(position)
                end
            end
        end
    end
end

local function on_entity_renamed(e)
    if e.entity and e.entity.valid then
        if e.entity.name=="space-platform-hub" then
            storage.gpplatform[e.entity.surface.platform.index].name_tag=e.entity.backer_name
        end
    end
end


local function on_entity_died(e)
    if e.entity.name=="space-platform-hub" then
        storage.gpship[e.entity.unit_number]=nil
        storage.gpplatform[e.entity.surface.platform.index].destroy()
        storage.gpplatform[e.entity.surface.platform.index]=nil
    end
end

sm_platform.events={
    [defines.events.on_space_platform_changed_state]=on_space_platform_changed_state,
    [defines.events.on_tick]=on_tick,
    [defines.events.on_entity_renamed]=on_entity_renamed,
    [defines.events.on_entity_died]=on_entity_died
}

return sm_platform