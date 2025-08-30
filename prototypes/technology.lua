data:extend({
    {
      type = "technology",
      name = "gp-harvester-l",
      icon = "__zzz-GalacticProtocol__/graphics/technology/gp-harvester-l.png",
      icon_size = 256,
      essential = true,
      effects = {
        -- {
        -- type = "unlock-recipe",
        -- recipe = "gp-harvester"
        -- },
      },
      prerequisites = { "rocket-silo" },
      unit =
      {
        count = 1000,
        ingredients =
        {
          { "automation-science-pack", 1 },
          { "logistic-science-pack",   1 },
          { "chemical-science-pack",   1 },
          { "space-science-pack",      1 }
        },
        time = 60
      }
    },
     {
      type = "technology",
      name = "gp-superbarrel",
      icon = "__zzz-GalacticProtocol__/graphics/technology/lihop-superbarrel.png",
      icon_size = 256,
      essential = true,
      effects = {},
      prerequisites = { "gp-harvester-l" },
      unit =
      {
        count = 1000,
        ingredients =
        {
          { "automation-science-pack", 1 },
          { "logistic-science-pack",   1 },
          { "chemical-science-pack",   1 },
          { "space-science-pack",      1 }
        },
        time = 60
      }
    },
})