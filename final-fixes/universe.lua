local system=require("final-fixes.system")
local uCreator=require("util.universeCreator")


local function add_galaxy_objects_to_game(galaxy_objects)
    for _,datas in pairs(galaxy_objects) do
        for _,system_object in pairs(datas) do
            data:extend({system_object})
        end
    end
end

local function create_universe()
    local galaxy_objects = {}
    local max_system=6
    local gen = mwc(1000)

    
    local system_spot=uCreator.create_system_location(max_system,gen)


    table.insert(galaxy_objects,system.create_vanilla_system(system_spot[1].position))
    for i=2,#system_spot do
        local name=uCreator.get_name(gen)
        table.insert(galaxy_objects,system.create_system(i,name,system_spot[i].position))
    end

    --add modded


    --make connection between system
    local space_route={}
    local interstellar_route=uCreator.create_universe_connection(system_spot,galaxy_objects)
    for _, edge in pairs(interstellar_route) do
        local data=helpers.json_to_table(edge[1].factoriopedia_description)
        --log(serpent.block(data))
        if data then
            table.insert(data.connection,edge[2].name)
            edge[1].factoriopedia_description=helpers.table_to_json(data)
        end

        local from=edge[1].name
        if from=="gpstar-calidus" then
            from="solar"
        end
        local to=edge[2].name
        if to=="gpstar-calidus" then
            to="solar"
        end
        table.insert(space_route,
            {
                type = "space-connection",
                name = edge[1].name .. "-to-" .. edge[2].name,
                subgroup = "gpstar-interstellar_route",
                from = from.."-system-edge",
                to =to.."-system-edge",
                length=1000000,
                --order = "z" .. edge[1].name,
                need_spanwdef = true
            })
    end
    table.insert(galaxy_objects,space_route)


    --ajout shattered planet -- obligation pur le jeu science et achivement
    data:extend({gpPlanetCollector.vanilla["space-location"]["shattered-planet"]})
    data:extend({gpPlanetCollector.vanilla.connection["solar-system-edge-shattered-planet"]})


    --ajout de tout dans le jeu
    helpers.write_file("universe.json",helpers.table_to_json(galaxy_objects))
    add_galaxy_objects_to_game(galaxy_objects)

    -- on met a jour les icons si besoin
    require("final-fixes.space-connection")
end

create_universe()