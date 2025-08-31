table.insert(data.raw["technology"]["planet-discovery-vulcanus"].effects, {
    type = "unlock-space-location",
    space_location = "gpstar-calidus",
    use_icon_overlay_constant = true
})

if mods["Cerys-Moon-of-Fulgora"] then
    --supression de la sprite de fulgora en arriere plan
    data.raw.sprite["fulgora-background"].filename = "__core__/graphics/empty.png"
    data.raw.sprite["fulgora-background"].width = 64
    data.raw.sprite["fulgora-background"].height = 64
end

if mods["maraxsis"] then
    if data.raw["mod-data"]["maraxsis-constants"] then
        --ppur que toutes les planets de type maraxis et la bonne gen
        for name, planet in pairs(data.raw.planet) do
            if planet.base_type then
                if planet.base_type == "maraxsis" then
                    data.raw["mod-data"]["maraxsis-constants"].data.MARAXSIS_SURFACES[planet.name] = true
                end
            end
        end
    end
end