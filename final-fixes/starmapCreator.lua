local function createPlaceHolder_starmap(planet)
    local reduce = 50
    local icons = planet.icons or { { icon = planet.icon } }
    local starmap_icons = nil
    local magnitude = 1
    local tint=nil
    if planet.starmap_icons then
        starmap_icons = table.deepcopy(planet.starmap_icons)
        for k, layer in pairs(starmap_icons) do
            if layer.icon_size * planet.magnitude * (reduce / layer.icon_size) > magnitude then
                magnitude = layer.icon_size * planet.magnitude * (reduce / layer.icon_size)
            end
            layer.filename = layer.icon
            layer.width = layer.icon_size
            layer.height = layer.icon_size
            layer.scale = planet.magnitude * (reduce / layer.icon_size)
            layer.icon_size = nil
            layer.icon = nil
        end
    elseif planet.starmap_icon then
        magnitude = planet.starmap_icon_size * planet.magnitude * (reduce / planet.starmap_icon_size)
        starmap_icons = {
            {
                filename = planet.starmap_icon,
                priority = "high",
                width = planet.starmap_icon_size,
                height = planet.starmap_icon_size,
                scale = planet.magnitude * (reduce / planet.starmap_icon_size),
                tint=tint
            }
        }
    else
        magnitude = 64 * planet.magnitude * (reduce / 64)
        starmap_icons = {
            {
                filename = planet.icon,
                priority = "high",
                width = 64,
                height = 64,
                scale = planet.magnitude * (reduce / 64),
                tint=tint
            }
        }
    end

    magnitude = 1.5 * magnitude / reduce

    local placeholder =
    {
        type = "lamp",
        name = planet.name,
        localised_name = planet.localised_name or { "space-location-name." .. planet.name } or planet.name,
        localised_description = { "space-location-description." .. planet.name },
        icons = icons,
        flags = { "placeable-neutral", "player-creation", "placeable-off-grid" },
        collision_box = { { -0.15, -0.15 }, { 0.15, 0.15 } },
        selection_box = { { -0.5 * magnitude, -0.5 * magnitude }, { 0.5 * magnitude, 0.5 * magnitude } },
        always_on = true,
        hidden = true,
        hidden_in_factoriopedia = true,
        energy_usage_per_tick = "0.01W",
        energy_source =
        {
            type = "void",
        },
        picture_on =
        {
            layers = starmap_icons,
        },
    }
    data:extend({ placeholder })
end

-- on créé les placeholder pour les planets/moon
for planet_name, planet in pairs(data.raw["planet"]) do
    createPlaceHolder_starmap(planet)
end

-- on créé les placeholder pour les space-location
for splocation_name, splocation in pairs(data.raw["space-location"]) do
    if splocation_name ~= "space-location-unknown" then
        createPlaceHolder_starmap(splocation)
    end
end
