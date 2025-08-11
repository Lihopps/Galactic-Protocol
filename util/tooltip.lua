local util_format=require("util.format")

local util_tooltip={}

function util_tooltip.contains(planet)
    local entities={""}
    for  entity,_ in pairs(planet.map_gen_settings.autoplace_settings["entity"].settings) do
        table.insert(entities,"[entity="..entity.."]")
    end


    local fluids={""}
    local fluid={}
    for  tile,_ in pairs(planet.map_gen_settings.autoplace_settings["tile"].settings) do
        if data.raw.tile[tile].fluid then
            if not fluid[data.raw.tile[tile].fluid] then
                fluid[data.raw.tile[tile].fluid]=true
                table.insert(fluids,"[fluid="..data.raw.tile[tile].fluid.."]")
            end
        end
       
    end


    local enemies={""}
    local enemy={}
    for name,dat in pairs(data.raw["autoplace-control"]) do
        if dat.category=="enemy" then
            if planet.map_gen_settings.autoplace_controls[dat.name] then
                enemy[dat.name]=true
            end
        end
    end
    for typ,_ in pairs(data.raw) do
        for name,dat in pairs(data.raw[typ])do
            if dat.autoplace then
                if enemy[dat.autoplace.control] then
                    table.insert(enemies,"[entity="..dat.name.."]")
                end
            end
        end
    end
    if planet.map_gen_settings.territory_settings then
        for _,unit in pairs(planet.map_gen_settings.territory_settings.units) do
            table.insert(enemies,"[entity="..unit.."]")
        end
    end



    return {"",entities,enemies,fluids}
end

function util_tooltip.makeTooltip(planet)
    if planet.surface_properties then
        local tooltip = {}
        for name, value in pairs(planet.surface_properties) do
            local val={ "surface-property-unit." .. name, tostring(math.floor(value)) } or tostring(math.floor(value))
            if string.find(name,"day-night-cycle",0,true) then
                val=util_format.seconds_to_readable_times(value/60)
            end
            table.insert(tooltip, {
                name = { "surface-property-name." .. name } or name,
                value = val
            })
        end
        if planet.surface_properties["gravity"] and planet.surface_properties["pressure"] then
            table.insert(tooltip, {
                name = { "gui-space-locations.robot-energy-usage" },
                value = { "", "x ", tostring(100 * planet.surface_properties["gravity"] / (planet.surface_properties["pressure"])) }
            })
        end
        if planet.lightning_properties then
            table.insert(tooltip, {
                name = { "description.mean-lightning-power" },
                value = {"description.mean-lightning-power-unit", tostring(1000/34.12969288)}
            })
        end
        if planet.map_gen_settings then
            table.insert(tooltip, {
                name = { "gui-space-locations.contains" },
                value = util_tooltip.contains(planet)
            })
        end

        if planet.solar_power_in_space then
            table.insert(tooltip, {
                name = { "surface-property-name.solar-power-in-space" },
                value = { "surface-property-unit.solar-power-in-space", tostring(planet.solar_power_in_space) } or tostring(planet.solar_power_in_space)
            })
        end

        

        return tooltip
    end
    return nil
end

return util_tooltip