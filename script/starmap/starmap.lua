local util_math = require("util.math")

local native_star = "gpstar-calidus"

local map_gen_settings = {
    width = 1024,
    height = 1024,
    default_enable_all_autoplace_controls = false,
    starting_area = "none",
    peaceful_mode = true,
    no_enemies_mode = true,
    autoplace_settings = {
        ["tile"] = {
            treat_missing_as_default = false,
            settings = {
                ["empty-space"] = {}
            }
        }
    }
}

local starmap = {}



---Recursive function to place placeholder and children
---@param surface LuaSurface : surface on you create
---@param Pname LuaSpaceLocationPrototype : String name of parent entity
---@param parent_entityPH LuaEntity : parent entity placeholder
---@param starname LuaSpaceLocationPrototype : string name of star reference of system
---@param starpH LuaEntity : star reference placeholder
---@param moon boolean : does the child are moon
local function place_placeholder(surface, Pname, parent_entityPH, starname, starpH,moon)
    local refstar = prototypes.space_location[starname]
    local parent_data =prototypes.mod_data["gptree"].data[Pname]
    if parent_data then
        for _, name in pairs(parent_data.child) do
            -- place child
            local child = prototypes.space_location[name]
            if child then
                local position = { x = child.position.x - refstar.position.x, y = child.position.y - refstar.position.y }
                local planet = surface.create_entity { type = "roboport", name = name, position = position, force = "player" }
                storage.gpuniverse[planet.name] = starpH

                -- draw circle around
                local circle_size = math.abs(prototypes.entity[name].selection_box.left_top.x)
                circle_size = circle_size + 0.3 * circle_size
                local circle = rendering.draw_circle {
                    color = { 1, 1, 1 },
                    radius = circle_size,
                    width = 2,
                    target = planet,
                    surface = surface,
                    render_layer="resource",
                    draw_on_ground = true
                }
                circle.move_to_back()

                if string.find(name,"gpbelt-",0,true) then
                    local belt_sprite=rendering.draw_sprite{
                        sprite="gpbelt",
                        orientation=math.random(),
                        x_scale=util_math.distance({x=0,y=0}, position)/30,--1=30
                        y_scale=util_math.distance({x=0,y=0}, position)/30,
                        target=parent_entityPH,
                        surface=surface,
                        render_layer="resource",
                        draw_on_ground=true

                    }
                    belt_sprite.move_to_back()
                end


                if not moon and not string.find(name,"gpbelt-",0,true) then
                    -- draw orbit
                    local angle = math.asin(2 * (circle_size) / (2 * util_math.distance({x=0,y=0}, position)))
                    local orbit = rendering.draw_arc {
                        color = { 0.3, 0.3, 0.3, 0.3 },
                        max_radius = (util_math.distance({x=0,y=0}, position) + 1 / 32),
                        min_radius = (util_math.distance({x=0,y=0}, position) - 1 / 32),
                        start_angle = util_math.cart_to_pol(position).angle + angle,
                        angle = (2 * math.pi) - (2 * angle),
                        target = parent_entityPH,
                        surface = surface,
                        render_layer="resource",
                        draw_on_ground = true,
                    }
                    orbit.move_to_back()
                end

                -- draw text
                local displayName = rendering.draw_text {
                    color = { 1, 1, 1 },
                    text = planet.localised_name or planet.name,
                    surface = surface,
                    target = { x = planet.position.x, y = planet.position.y + circle_size + 0.25 },
                    only_in_alt_mode = true,
                    scale_with_zoom = true,
                    render_layer="resource",
                    alignment = "center"
                }

                place_placeholder(surface, name, planet, starname, starpH,true)
            end
        end

        -- draw connection (on ne draw pas les connection des etoiles ou des egdes)
        if not string.find(Pname, "gpstar", 0, true) then
            for _, destination in pairs(parent_data.connection) do
                local dest = prototypes.space_location[destination]
                local circle_size = math.abs(prototypes.entity[destination].selection_box.left_top.x)
                circle_size = circle_size + 0.3 * circle_size
                local circle_size1 = math.abs(parent_entityPH.prototype.selection_box.left_top.x)
                circle_size1 = circle_size1 + 0.3 * circle_size1
                
                local position = { x = dest.position.x - refstar.position.x, y = dest.position.y - refstar.position.y }
                --local parent_entityPH_pos={ x = parent_entityPH.position.x - refstar.position.x, y = parent_entityPH.position.y - refstar.position.y }
                
                local vector = util_math.normalise_vector(util_math.vector_from_pos(parent_entityPH.position,position))
                local line = rendering.draw_line {
                    color = { 1, 1, 1 },
                    width = 2,
                    from = util_math.add_vector(parent_entityPH.position, util_math.scale_vector(vector, circle_size1)),
                    to = util_math.minus_vector(position, util_math.scale_vector(vector, circle_size)),
                    surface = surface,
                    render_layer="resource",
                }
            end
        end
    end
end

---Create surface and place placeholder for system
---@param starname string : name of star system
---@param fisrt boolean : is the first ?
function starmap.createSystem(starname,first)
    local surface = game.create_surface(starname, map_gen_settings)
    surface.always_day = true
    game.forces["player"].chart_all(surface)

    local star = surface.create_entity { type = "roboport", name = starname, position = { 0, 0 }, force = "player" }
    storage.gpuniverse[star.name] = star
    -- draw circle around
    local circle_size = math.abs(prototypes.entity[starname].selection_box.left_top.x)
    circle_size = circle_size + 0.3 * circle_size
    local circle = rendering.draw_circle {
        color = { 1, 1, 1 },
        radius = circle_size,
        width = 2,
        target = star,
        surface = surface,
        draw_on_ground = true
    }
    circle.move_to_back()

    -- draw text
    local displayName = rendering.draw_text {
        color = { 1, 1, 1 },
        text = star.localised_name or star.name,
        surface = surface,
        target = { x = star.position.x, y = star.position.y + circle_size + 0.25 },
        only_in_alt_mode = true,
        scale_with_zoom = true,
        alignment = "center"
    }

    place_placeholder(surface, starname, star, starname, star)

    starmap.addsystemtouniverse(star,first)
   
end

function starmap.addsystemtouniverse(star,first)
    --ajoute l'etoile
    local surface=game.surfaces["gpstar-gpuniverse"]
    local position=util_math.scale_vector(prototypes.space_location[star.name].position,1/5)
    local star = surface.create_entity { type = "roboport", name = star.name, position = position, force = "player" }

    -- draw circle around
    local circle_size = math.abs(prototypes.entity[star.name].selection_box.left_top.x)
    circle_size = circle_size + 0.3 * circle_size
    local circle = rendering.draw_circle {
        color = { 1, 1, 1 },
        radius = circle_size,
        width = 2,
        target = star,
        surface = surface,
        draw_on_ground = true
    }
    circle.move_to_back()

    -- draw text
    local displayName = rendering.draw_text {
        color = { 1, 1, 1 },
        text = star.localised_name or star.name,
        surface = surface,
        target = { x = star.position.x, y = star.position.y + circle_size + 0.25 },
        only_in_alt_mode = true,
        scale_with_zoom = true,
        alignment = "center"
    }


    --ajoute les connection si elle sont decouvertes
    local parent_data = prototypes.mod_data["gptree"].data[star.name]
    if parent_data then
        for _,v in pairs(parent_data.connection) do
            local conn=surface.find_entities_filtered{name=v}
            if #conn==1 then
                if conn[1] and conn[1].valid then
                    local circle_size1 = math.abs(prototypes.entity[conn[1].name].selection_box.left_top.x)
                    circle_size1 = circle_size1 + 0.3 * circle_size1
                    local vector = util_math.normalise_vector(util_math.vector_from_pos(star.position,conn[1].position))
                    local line = rendering.draw_line {
                    color = { 1, 1, 1 },
                    width = 2,
                    from =util_math.add_vector(star.position, util_math.scale_vector(vector, circle_size)),
                    to = util_math.minus_vector(conn[1].position, util_math.scale_vector(vector, circle_size1)),
                    surface = surface
                }
                end
            end
        end
    end
    if first then storage.gpuniverse["gp-universe"]=star end
end

function starmap.createUniverseMap()
    local surface = game.create_surface("gpstar-gpuniverse", map_gen_settings)
    surface.always_day = true
    game.forces["player"].chart_all(surface)

end

---Create Unviverse from prototypes
function starmap.createUniverse()
    --TODO : starmap des stars avec liaison entre elle
    starmap.createUniverseMap()


    -- creation du system standard
    starmap.createSystem(native_star,true)
end

return starmap
