local spacelocationfinalupdate={}

---build connection tags for construc starmap
---@param planet_name SpaceLocationPrototype :  as string name planet to build connection
local function build_connection(planet_name)
    local connection={}
    for name,conn in pairs(data.raw["space-connection"]) do
        if conn.from==planet_name then
            table.insert(connection,conn.to)
        end
    end
    return connection
end

---TODO : pour le moment mets en custom tooltip et 
---@param planet any
function spacelocationfinalupdate.updateArbo(planet)
    if planet.factoriopedia_description then
        if not planet.custom_tooltip_fields then
            planet.custom_tooltip_fields={}
        end
        table.insert(planet.custom_tooltip_fields[0],{
            name="Factoriopedia Description",
            value=planet.factoriopedia_description
        })
    end
    local connection=build_connection(planet.name)
    planet.factoriopedia_description=helpers.table_to_json({child={},connection=connection})
end

return spacelocationfinalupdate