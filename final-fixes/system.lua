local util_math = require("util.math")
local uCreator = require("util.universeCreator")
local util_graphics = require("util.graphics")
local starCreator = require("prototypes.star")
local edgeCreator = require("prototypes.edge")
local planetCreator = require("prototypes.planet")
local systemCreator = {}

local function unlock_system(etoile, system)
    local effect = {}
    table.insert(effect, {
        type = "unlock-space-location",
        space_location = etoile.name,
        use_icon_overlay_constant = true
    })
    for _, planet in pairs(system) do
        table.insert(effect,
            {
                type = "unlock-space-location",
                space_location = planet.name,
                use_icon_overlay_constant = true
            })
        for _,moon in pairs(gptree[planet.name].child) do
            table.insert(effect,
            {
                type = "unlock-space-location",
                space_location = moon,
                use_icon_overlay_constant = true
            })
        end
    end
    table.insert(effect,
        {
            type = "unlock-space-location",
            space_location = etoile.name .. "-system-edge",
            use_icon_overlay_constant = true
        })
    local tech = {
        type = "technology",
        name = etoile.name,
        localised_name = { "technology-name.lihop-system-discovery", etoile.name },
        localised_description = { "technology-description.help-discovery", etoile.name },
        icons = util_graphics.sptechnology_icon_constant_planet(etoile.icons),
        icon_size = 256,
        essential = true,
        effects = effect,
        prerequisites = { "rocket-silo" },
        research_trigger = {
            type = "send-item-to-orbit",
            item = "iron-plate"
        }
    }
    return tech
end

function systemCreator.create_vanilla_system(pos)
    local system = {}
    local position = util_math.cart_to_fpol(pos)
    local etoile = starCreator.create_star("calidus", 140, position)
    local children = {}
    for typ, _ in pairs(gpPlanetCollector.vanilla) do
        for name, entity in pairs(gpPlanetCollector.vanilla[typ]) do
            if typ == "space-location" and name == "shattered-planet" then
                --do nothing
            elseif typ == "connection" then
                if entity.to == "shattered-planet" then
                    --do nothing
                else
                    entity.subgroup = "gpstar-calidus"
                    entity.order = "z" .. entity.order
                    table.insert(system, entity)
                end
            else
                entity.subgroup = "gpstar-calidus"
                table.insert(children, entity.name)
                table.insert(system, entity)
                gptree[entity.name]={child={},connection={}}
            end
        end
    end

    
    --etoile.factoriopedia_description = helpers.table_to_json({ child = children, connection = {} })
    gptree[etoile.name]={ child = children, connection = {} }
    table.insert(system, 1, etoile)
    table.insert(system, {
        type = "space-connection",
        name = "gpstar-calidus-to-vulcanus",
        to = "gpstar-calidus",
        from = "vulcanus",
        order = "z0",
        subgroup = "gpstar-calidus",
        length = 1000, --20000,
        --need_spanwdef = true
        --asteroid_spawn_definitions =asteroid_spawn_definitions --asteroid_util.spawn_definitions(asteroid_util.gleba_aquilo)
    })
    table.insert(system, {
        type = "item-subgroup",
        name = "gpstar-calidus",
        group = "planets",
        order = "1",
    })
    return system
end

function systemCreator.create_system(index, name, pos)
    local possible_distance = { 10, 15, 20, 25, 30, 35, 40 }
    local gen = mwc(util_math.hash(name))
    local system = {}
    --local moons={}
    local position = util_math.cart_to_fpol(pos)
    local max_planets = gen:random(2, 8)
    log("max: " .. max_planets)
    local final_pos = uCreator.get_final_pos(gen, possible_distance, max_planets)
    local children = {}

    local etoile = starCreator.create_star(name, gen:random(100, 300), position)
    for i = 1, #final_pos do
        local pname = uCreator.get_name(gen)
        local planet_position = uCreator.make_final_coord(position,
            { distance = final_pos[i], orientation = util_math.map(gen:random(), 0, 1, 0, 0.5) })
        local planet = planetCreator.create_planet(i, etoile,final_pos[i], planet_position, pname)
        planet.subgroup = "gpstar-" .. name
        planet.order = tostring(i)
        planet.position = util_math.fpol_to_cart({ distance = planet.distance, orientation = planet.orientation })
        if planet then
            table.insert(children, planet.name)
            table.insert(system, planet)
            gptree[planet.name]={child={},connection={}}
            -- moon ?
            if planet.moon_number then
                if planet.moon_number>0 then
                    for j=1,planet.moon_number do
                        local pname = uCreator.get_name(gen)
                        local moon_position = uCreator.make_final_coord(planet_position,{ distance = 2+j, orientation =gen:random()})
                        local moon = planetCreator.create_planet(i, etoile,final_pos[i], moon_position, pname,true)
                        moon.subgroup = "gpstar-" .. name
                        moon.order = tostring(i)..tostring(j)
                        moon.position = util_math.fpol_to_cart({ distance = moon.distance, orientation = moon.orientation })
                        if moon then
                            table.insert(gptree[planet.name].child,moon.name)
                            gptree[moon.name]={child={},connection={}}
                            data:extend({moon,{
                                type = "space-connection",
                                name = planet.name .. "-to-" .. moon.name,
                                subgroup = "gpstar-" .. name,
                                from = planet.name,
                                to = moon.name,
                                order = planet.name.."z" .. etoile.order,
                                need_spanwdef = true
                            }})
                        end
                    end
                end
            end
        else
            log("Attention :" ..pname.."is nil !!")
        end
    end
    table.insert(children, etoile.name .. "-system-edge")
    --etoile.factoriopedia_description = helpers.table_to_json({ child = children, connection = {} })
    gptree[etoile.name]={ child = children, connection = {} }

    local tech = unlock_system(etoile, system)
    local connection = uCreator.create_system_connection(pos, system)
    --log(serpent.block(connection))
    -- si que deux astres les relier entre eux
    if #system == 2 then
        table.insert(connection, { system[1], system[2] })
    end


    table.insert(system, 1, etoile)
    table.insert(system, edgeCreator.create_edge(etoile))
    table.insert(system,
        {
            type = "space-connection",
            name = system[2].name .. "-to-" .. etoile.name,
            subgroup = "gpstar-" .. name,
            from = system[2].name,
            to = etoile.name,
            order = "z" .. etoile.order,
            need_spanwdef = true
        })
    table.insert(system,
        {
            type = "space-connection",
            name = system[#system - 2].name .. "-to-" .. system[#system - 1].name,
            subgroup = "gpstar-" .. name,
            from = system[#system - 2].name,
            to = system[#system - 1].name,
            order = "z" .. system[#system - 1].order,
            need_spanwdef = true,
            length = 100000
        })
    for _, edge in pairs(connection) do
        table.insert(system,
            {
                type = "space-connection",
                name = edge[1].name .. "-to-" .. edge[2].name,
                subgroup = "gpstar-" .. name,
                from = edge[1].name,
                to = edge[2].name,
                order = "z" .. edge[1].name,
                need_spanwdef = true
            })
    end

    table.insert(system, {
        type = "item-subgroup",
        name = "gpstar-" .. name,
        group = "planets",
        order = tostring(index),
    })
    table.insert(system, tech)
    return system
end

return systemCreator
