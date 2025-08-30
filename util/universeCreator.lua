local util_math = require("util.math")

local uCreator = {}

function uCreator.get_final_pos(gen, possible_distance, max_planets)
    local final_pos = {}
    for i = 1, max_planets do
        local index = gen:random(1, #possible_distance)
        table.insert(final_pos, possible_distance[index])
        table.remove(possible_distance, index)
    end
    table.sort(final_pos)
    return final_pos
end

function uCreator.make_final_coord(parent_pos, child_pos)
    -- Convert both to Cartesian
    local base_cart = util_math.fpol_to_cart(parent_pos)
    local rel_cart  = util_math.fpol_to_cart(child_pos)

    -- Add vectors
    local sum_cart  = {
        x = base_cart.x + rel_cart.x,
        y = base_cart.y + rel_cart.y
    }

    -- Convert back to polar from origin
    return util_math.cart_to_fpol(sum_cart)
end

function uCreator.get_name(gen)
    local index = gen:random(1, #gpbackers)
    local name = gpbackers[index]
    if gptree[name] or gptree["gpstar-" .. name] or gptree["gpbelt-" .. name] then
        return uCreator.get_name(gen)
    end
    --table.remove(gpbackers,index)
    return name
end

function uCreator.create_system_location(max_system, gen)
    local points_cart = { { position = { x = 0, y = 0 } } }
    local max = 0
    while #points_cart < max_system and max < 5000 do
        local new_point = { position = { x = gen:random(-500, 500), y = gen:random(-500, 500) } }
        local overlap = false
        for _, point in pairs(points_cart) do
            if util_math.distance(new_point.position, point.position) < (50 + 50 + 2) then
                overlap = true
                break
            end
        end
        max = max + 1
        if not overlap then
            table.insert(points_cart, new_point)
            max = 0
        end
    end
    log(#points_cart .. "/" .. max_system)
    return points_cart
end

local function make_supertriangle(star_position, state)
    local offset = 2
    local d = 500
    if state == 1 then
        d = 1000
    end

    local dist = d --(d/math.cos(math.pi/3))+offset
    local position = util_math.fpol_to_cart({ distance = dist, angle = 0 })
    position = util_math.add_vector(star_position, position)
    local point_A = {
        position = position, --cartesian position in system
        name = "point_A",
    }
    position = util_math.fpol_to_cart({ distance = dist, angle = 0.66 })
    position = util_math.add_vector(star_position, position)
    local point_B = {
        position = position, --cartesian position in system
        name = "point_B",
    }
    position = util_math.fpol_to_cart({ distance = dist, angle = 0.33 })
    position = util_math.add_vector(star_position, position)
    local point_C = {
        position = position, --cartesian position in system
        name = "point_C",
    }

    return { name = point_A.name .. "-" .. point_B.name .. "-" .. point_C.name, sommet = { point_A, point_B, point_C }, edge = { { point_A, point_B }, { point_B, point_C }, { point_C, point_A } } }
end

local function cercle_circonscrit(triangle)
    local pa = triangle.sommet[1]
    local pb = triangle.sommet[2]
    local pc = triangle.sommet[3]

    local delta = util_math.determiant(pa.position.x, pa.position.y, 1, pb.position.x, pb.position.y, 1, pc.position.x,
        pc.position.y, 1)
    local a = pa.position.x * pa.position.x + pa.position.y * pa.position.y
    local d = pb.position.x * pb.position.x + pb.position.y * pb.position.y
    local g = pc.position.x * pc.position.x + pc.position.y * pc.position.y
    local x = (1 / (2 * delta)) * util_math.determiant(a, pa.position.y, 1, d, pb.position.y, 1, g, pc.position.y, 1)
    local y = -(1 / (2 * delta)) * util_math.determiant(a, pa.position.x, 1, d, pb.position.x, 1, g, pc.position.x, 1)
    local centre = { x = x, y = y }
    local rayon = (util_math.distance2(pa, pb) * util_math.distance2(pb, pc) * util_math.distance2(pc, pa)) / (2 * delta)
    return { position = centre, rayon = rayon }
end

function uCreator.triangulation(star_position, system, state)
    local supertriangle = make_supertriangle(star_position, state)
    local triangles = { supertriangle }
    local points = system --table.deepcopy(system)

    for _, sommet in pairs(points) do
        local badTriangles = {}
        local polygon = {}
        for _, triangle in pairs(triangles) do
            local cercle_data = cercle_circonscrit(triangle)
            if util_math.in_circle(sommet, cercle_data) then
                table.insert(badTriangles, triangle)
                for _, edge in pairs(triangle.edge) do
                    table.insert(polygon, edge)
                end
            end
        end

        for _, tri in pairs(badTriangles) do
            for j = #triangles, 1, -1 do
                if tri.name == triangles[j].name then
                    table.remove(triangles, j)
                end
            end
        end
        --log(serpent.block(polygon))
        for _, edge in pairs(polygon) do
            local triangle = {
                name = sommet.name .. "-" .. edge[1].name .. "-" .. edge[2].name,
                sommet = {
                    sommet, edge[1], edge[2]
                },
                edge = {
                    { sommet,  edge[1] },
                    { edge[1], edge[2] },
                    { edge[2], sommet }
                }
            }
            table.insert(triangles, triangle)
        end
    end
    --serpent.block(triangles))
    local final_triangles = {}
    for _, triangle in pairs(triangles) do
        if not string.match(triangle.name, "point_") then
            table.insert(final_triangles, triangle)
        end
    end
    --log(serpent.block(final_triangles))
    return final_triangles
end

function uCreator.make_final_routes(space_routes)
    local final_routes = {}
    for _, triangle in pairs(space_routes) do
        for _, edge in pairs(triangle.edge) do
            for _, route in pairs(final_routes) do
                if (edge[1].name == route[1].name and edge[2].name == route[2].name) or (edge[1].name == route[2].name and edge[2].name == route[1].name) then
                    goto pass2
                end
            end
            table.insert(final_routes, edge)
            ::pass2::
        end
    end
    return final_routes
end

function uCreator.create_system_connection(star_position, system)
    --local connection={} --array of {edge1,edge2}
    local space_routes = uCreator.triangulation(star_position, system, 0)
    local final_space_route = uCreator.make_final_routes(space_routes)
    return final_space_route

    --return connection
end

function uCreator.create_universe_connection(system_spot, galaxy_objects)
    local system = {}
    for _, sys in pairs(galaxy_objects) do
        table.insert(system, sys[1])
    end
    local space_routes = uCreator.triangulation({ x = 0, y = 0 }, system, 1)
    local final_space_route = uCreator.make_final_routes(space_routes)
    return final_space_route
end

function uCreator.switch_planet(gen, galaxy_objects, planet)
    if planet.orbit then
        if planet.orbit.parent then
            if planet.orbit.parent.type=="planet" then
                --so it's a moon
                local index = gen:random(2, #gpmoontracker)
                local moon_data = gpmoontracker[index]
                if gpPlanetCollector.modded.planet[moon_data.moon.name] then
                    log("essai de changement d'une moon modded")
                    return uCreator.switch_planet(gen, galaxy_objects, planet)
                end
                
                local pname = moon_data.moon.name
                planet.distance = moon_data.moon.distance
                planet.orientation = moon_data.moon.orientation
                planet.subgroup = moon_data.moon.subgroup
                planet.order = moon_data.moon.order
                planet.solar_power_in_space=moon_data.moon.solar_power_in_space
                planet.surface_properties["solar-power"]=(planet.surface_properties["solar-power"]< planet.solar_power_in_space and planet.surface_properties["solar-power"]) or planet.solar_power_in_space
        

                gptree[planet.name] = gptree[pname] or { child = {}, connection = {} }
                gptree[pname]=nil
                gpmoontracker[index].moon=planet

                for i=1,#gptree[gpmoontracker[index].parent].child do
                    if gptree[gpmoontracker[index].parent].child[i]==pname then
                        gptree[gpmoontracker[index].parent].child[i]=planet.name
                        break
                    end
                end
                
                for _,system in pairs(galaxy_objects) do
                    if system[#system].effects then
                        for _, effect in pairs(system[#system].effects) do
                            if effect.type == "unlock-space-location" then
                                if effect.space_location == pname then
                                    effect.space_location = planet.name
                                end
                            end
                        end
                    end
                end

                return true
            end
        end
        planet.orbit=nil
        return uCreator.switch_planet(gen, galaxy_objects, planet)
    else
        local index_s = gen:random(2, #galaxy_objects)
        local system = galaxy_objects[index_s]
        local fstar = 1
        local fplanet = 2
        local fconn = 3
        for index, dat in ipairs(system) do
            if dat.type == "space-connection" then
                fconn = index
                break
            end
        end
        local planet_index = gen:random(2, fconn - 1)
        if gpPlanetCollector.modded.planet[system[planet_index].name] then
            log("essai de changement d'un planet modded")
            return uCreator.switch_planet(gen, galaxy_objects, planet)
        elseif (system[planet_index].moon_number or -1) > 0 then
            log("essai de changement d'une planet mooned")
            return uCreator.switch_planet(gen, galaxy_objects, planet)
        elseif string.find(system[planet_index].name, "-system-edge", 0, true) then
            log("essai de changement d'un edge")
            return uCreator.switch_planet(gen, galaxy_objects, planet)
        end

        local pname = system[planet_index].name
        planet.distance = system[planet_index].distance
        planet.orientation = system[planet_index].orientation
        planet.subgroup = system[planet_index].subgroup
        planet.order = system[planet_index].order
        planet.solar_power_in_space=system[planet_index].solar_power_in_space
        planet.surface_properties["solar-power"]=(planet.surface_properties["solar-power"]< planet.solar_power_in_space and planet.surface_properties["solar-power"]) or planet.solar_power_in_space
        table.remove(system, planet_index)
        table.insert(system, planet_index, planet)


        for i = 1, #gptree[system[1].name].child do
            if gptree[system[1].name].child[i] == pname then
                table.remove(gptree[system[1].name].child, i)
                table.insert(gptree[system[1].name].child, planet.name)
                break
            end
        end
        gptree[planet.name] = gptree[pname] or { child = {}, connection = {} }
        gptree[pname] = nil

        for i = fconn, #system do
            if system[i].type == "space-connection" then
                if system[i].from == pname then
                    system[i].from = planet.name
                    system[i].name = planet.name .. "-to-" .. system[i].to
                end
                if system[i].to == pname then
                    system[i].to = planet.name
                    system[i].name = system[i].from .. "-to-" .. planet.name
                end
            end
        end

        --log(system[11].name)

        for _, effect in pairs(system[#system].effects) do
            if effect.type == "unlock-space-location" then
                if effect.space_location == pname then
                    effect.space_location = planet.name
                end
            end
        end
        return true
    end
end

function uCreator.get_gazeous_field(gen)
    local light = gp_gazeous_field["light"][gen:random(1,#gp_gazeous_field["light"])]
    local heavy =gp_gazeous_field["heavy"][gen:random(1,#gp_gazeous_field["heavy"])]
    return {light=light,heavy=heavy}
end


return uCreator
