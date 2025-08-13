data:extend({
    {
        type = "lamp",
        name = "spaceshipph",
        icon = "__base__/graphics/icons/locomotive.png",
        flags = { "placeable-neutral", "player-creation", "placeable-off-grid","get-by-unit-number" },
        collision_box = { { -0.15, -0.15 }, { 0.15, 0.15 } },
        selection_box =  { { -0.3, -0.3 }, { 0.3, 0.3 } },
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
            layers = {{
                filename= "__base__/graphics/icons/locomotive.png",
                width=64,
                height=64,
                scale=0.5
            }}
        },
    }
})