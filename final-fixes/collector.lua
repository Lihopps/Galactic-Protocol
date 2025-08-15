local vanilla_corpse = {
        ["nauvis"] = true,
        ["vulcanus"] = true,
        ["gleba"] = true,
        ["fulgora"] = true,
        ["aquilo"] = true,
        ["solar-system-edge"] = true,
        ["shattered-planet"] = true, --TODO a voir si on le mets a part
}


--definition de la table qui recupere toutes les planets,connection etc
gpPlanetCollector = {
    vanilla = {
        planet = {},
        ["space-location"] = {},
        connection={},
    },
    modded = {
        planet = {},
        ["space-location"] = {},
        connection={}
    },
    
}

-- on recupere planet et space location
for _, type in pairs({ "planet", "space-location" }) do
    for name, entity in pairs(data.raw[type]) do
        if not string.find(name,"space-location-unknow",0,true) then
            if vanilla_corpse[name] then
                gpPlanetCollector.vanilla[type][name]=table.deepcopy(entity)
                data.raw[type][name]=nil
            else
                gpPlanetCollector.modded[type][name]=table.deepcopy(entity)
                data.raw[type][name]=nil
            end
        end
    end
end

-- on recupere les space connection
for name, connection in pairs(data.raw["space-connection"]) do
    if vanilla_corpse[connection.from] and vanilla_corpse[connection.to] then
        gpPlanetCollector.vanilla.connection[name]=table.deepcopy(connection)
        data.raw["space-connection"][name]=nil
    else
        gpPlanetCollector.modded.connection[name]=table.deepcopy(connection)
        data.raw["space-connection"][name]=nil
    end
end