data:extend({
    {
        type = "item-group",
        name = "planets",
        order = "da",
        icon = "__zzz-GalacticProtocol__/graphics/icons/galaxy.png",
        icon_size = 128,
    },
    {
        type = "item-subgroup",
        name = "gpstar-interstellar_route",
        group = "planets",
        order = "zzzzzz",
    },
    {
    type = "custom-input",
    name = "open-custom-PLANET",
    key_sequence = "ALT + mouse-button-1",
    linked_game_control="open-factoriopedia",
    include_selected_prototype=true,
    consuming = "none",--"game-only",
    action = "lua"
  },
})