local util_math=require("util.math")
local mod_gui = require("__core__.lualib.mod-gui")
local pltformlist=require("script.starmap.star_map_platform_list")
local util_tooltip=require("util.tooltip")

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
    local ship=game.surfaces[surface.name].create_entity{type="lamp",name="spaceshipph",position=position,force="player"}
    storage.gpplatform[platform.index]=ship
    storage.gpship[ship.unit_number]=platform
end

local function get_pos_on_map_from_connection(platform,scale)
    if not scale then scale=1 end
    local space_connection=platform.space_connection
    local from=space_connection.from
    local to=space_connection.to
    local length=space_connection.length

    local dist=platform.distance
    local posFrom=from.position
    local posTo=to.position
    local star=prototypes.space_location[storage.gpuniverse[from.name].name]

    posFrom=util_math.minus_vector(posFrom,star.position)
    posTo=util_math.minus_vector(posTo,star.position)
    local x=util_math.map(dist,0,1,posFrom.x,posTo.x)
    local y=util_math.map(dist,0,1,posFrom.y,posTo.y)
    return {x=x*scale,y=y*scale}
end

local function get_pos_on_Umap_from_connection(platform,scale)
    if not scale then scale=1 end
    local space_connection=platform.space_connection
    local from=space_connection.from
    local to=space_connection.to
    local length=space_connection.length

    local dist=platform.distance
    local posFrom=from.position
    local posTo=to.position
    local star={position={x=0,y=0}}--prototypes.space_location[storage.gpuniverse[from.name].name]

    posFrom=util_math.minus_vector(posFrom,star.position)
    posTo=util_math.minus_vector(posTo,star.position)
    local x=util_math.map(dist,0,1,posFrom.x,posTo.x)
    local y=util_math.map(dist,0,1,posFrom.y,posTo.y)
    return {x=x*scale,y=y*scale}

end

local function on_space_platform_changed_state(e)
    local platform=e.platform
    if platform and platform.valid then
        local data=pltformlist.get_state(platform)
        if data.enabled then
            for _,player in pairs(game.players) do
                if mod_gui.get_frame_flow(player).platform_list then
                    for k,v in pairs(mod_gui.get_frame_flow(player).platform_list.children) do
                        if v.tags.index==platform.index then
                            v.enabled=data.enabled
                            v.caption=util_tooltip.platform_caption_list(data,platform)
                            v.raise_hover_events=true
                            v.tooltip=data.tooltip
                        end
                    end
                end
            end
        end
    end
end

local function on_tick(e)
    if e.tick%5==0 then
        for _,force in pairs(game.forces) do
            for _,platform in pairs(force.platforms) do
                if platform.scheduled_for_deletion>0 then
                    if storage.gpplatform[platform.index] then
                        storage.gpplatform[platform.index].destroy()
                        storage.gpplatform[platform.index]=nil
                    end
                    goto suivant
                end
                
                if not storage.gpplatform[platform.index] then
                    createPlatformPh(platform)
                end
                if platform.space_location then
                    local circle_size = math.abs(prototypes.entity[platform.space_location.name].selection_box.left_top.x)
                    circle_size = circle_size + 0.3 * circle_size
                    local star=prototypes.space_location[storage.gpuniverse[platform.space_location.name].name]
                    local position=util_math.minus_vector(util_math.add_vector(platform.space_location.position,util_math.pol_to_cart(circle_size,platform.index+e.tick/500)),star.position)
                    storage.gpplatform[platform.index].teleport(position)

                elseif platform.space_connection then
                    if string.find(platform.space_connection.from.name,"-system-edge",0,true) and string.find(platform.space_connection.to.name,"-system-edge",0,true) then
                        if not string.find(storage.gpplatform[platform.index].surface.name,"gpstar-gpuniverse",0,true) then
                            local temp=storage.gpplatform[platform.index].clone{
                                position=platform.space_connection.from.position,
                                surface="gpstar-gpuniverse",
                                force=storage.gpplatform[platform.index].force
                            }
                            storage.gpship[storage.gpplatform[platform.index].unit_number]=nil
                            storage.gpplatform[platform.index].destroy()
                            storage.gpplatform[platform.index]=temp
                            storage.gpship[temp.unit_number]=platform
                        end
                        local position=util_math.minus_vector(get_pos_on_Umap_from_connection(platform,1/5),{x=50*1/5,y=0})
                        storage.gpplatform[platform.index].teleport(position)
                    else
                        local star=game.surfaces["gpstar-gpuniverse"].find_entities_filtered{name=storage.gpuniverse[platform.space_connection.from.name].name}
                        star=star[1]
                        if storage.gpplatform[platform.index].surface.name==storage.gpuniverse[platform.space_connection.from.name].name then
                            local position=get_pos_on_map_from_connection(platform)
                            storage.gpplatform[platform.index].teleport(position)
                        else
                            local temp=storage.gpplatform[platform.index].clone{
                                position=util_math.minus_vector(platform.space_connection.from.position,util_math.scale_vector(star.position,5)),
                                surface=storage.gpuniverse[platform.space_connection.from.name].surface,
                                force=storage.gpplatform[platform.index].force
                            }
                            storage.gpship[storage.gpplatform[platform.index].unit_number]=nil
                            storage.gpplatform[platform.index].destroy()
                            storage.gpplatform[platform.index]=temp
                            storage.gpship[temp.unit_number]=platform
                            --game.tick_paused=true
                        end
                    end
                end
                ::suivant::
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
    [defines.events.on_entity_died]=on_entity_died,
}

return sm_platform