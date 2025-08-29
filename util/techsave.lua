return {
    ["steam-power"] = {
        type = "technology",
        name = "steam-power",
        icon = "__base__/graphics/technology/steam-power.png",
        icon_size = 256,
        effects = { {
            type = "unlock-recipe",
            recipe = "pipe"
        }, {
            type = "unlock-recipe",
            recipe = "pipe-to-ground"
        }, {
            type = "unlock-recipe",
            recipe = "offshore-pump"
        }, {
            type = "unlock-recipe",
            recipe = "boiler"
        }, {
            type = "unlock-recipe",
            recipe = "steam-engine"
        } },
        research_trigger = {
            type = "craft-item",
            item = "iron-plate",
            count = 50
        }
    },
    electronics = {
        type = "technology",
        name = "electronics",
        icon = "__base__/graphics/technology/electronics.png",
        icon_size = 256,
        effects = { {
            type = "unlock-recipe",
            recipe = "copper-cable"
        }, {
            type = "unlock-recipe",
            recipe = "electronic-circuit"
        }, {
            type = "unlock-recipe",
            recipe = "lab"
        }, {
            type = "unlock-recipe",
            recipe = "inserter"
        }, {
            type = "unlock-recipe",
            recipe = "small-electric-pole"
        } },
        research_trigger = {
            type = "craft-item",
            item = "copper-plate",
            count = 10
        }
    },
    ["automation-science-pack"] = {
        type = "technology",
        name = "automation-science-pack",
        icon = "__base__/graphics/technology/automation-science-pack.png",
        icon_size = 256,
        essential = true,
        effects = { {
            type = "unlock-recipe",
            recipe = "automation-science-pack"
        } },
        prerequisites = { "steam-power", "electronics" },
        research_trigger = {
            type = "craft-item",
            item = "lab"
        }
    },
    ["electric-mining-drill"] = {
        type = "technology",
        name = "electric-mining-drill",
        icon = "__base__/graphics/technology/electric-mining-drill.png",
        icon_size = 256,
        effects = { {
            type = "unlock-recipe",
            recipe = "electric-mining-drill"
        } },
        prerequisites = { "automation-science-pack" },
        unit = {
            count = 25,
            ingredients = { { "automation-science-pack", 1 } },
            time = 10
        }
    },
    ["repair-pack"] = {
        type = "technology",
        name = "repair-pack",
        icon = "__base__/graphics/technology/repair-pack.png",
        icon_size = 256,
        effects = { {
            type = "unlock-recipe",
            recipe = "repair-pack"
        } },
        prerequisites = { "automation-science-pack" },
        unit = {
            count = 25,
            ingredients = { { "automation-science-pack", 1 } },
            time = 10
        }
    },
    radar = {
        type = "technology",
        name = "radar",
        icon = "__base__/graphics/technology/radar.png",
        icon_size = 256,
        effects = { {
            type = "unlock-recipe",
            recipe = "radar"
        } },
        prerequisites = { "automation-science-pack" },
        unit = {
            count = 20,
            ingredients = { { "automation-science-pack", 1 } },
            time = 10
        }
    },
    ["physical-projectile-damage-1"] = {
        type = "technology",
        name = "physical-projectile-damage-1",
        icons = { {
            icon = "__base__/graphics/technology/physical-projectile-damage-1.png",
            icon_size = 256
        }, {
            icon = "__core__/graphics/icons/technology/constants/constant-damage.png",
            icon_size = 128,
            scale = 0.5,
            shift = { 50, 50 },
            floating = true
        } },
        effects = { {
            type = "ammo-damage",
            ammo_category = "bullet",
            modifier = 0.1
        }, {
            type = "turret-attack",
            turret_id = "gun-turret",
            modifier = 0.1
        }, {
            type = "ammo-damage",
            ammo_category = "shotgun-shell",
            modifier = 0.1
        } },
        prerequisites = { "military" },
        unit = {
            count = 100,
            ingredients = { { "automation-science-pack", 1 } },
            time = 30
        },
        upgrade = true
    },
    ["physical-projectile-damage-2"] = {
        type = "technology",
        name = "physical-projectile-damage-2",
        icons = { {
            icon = "__base__/graphics/technology/physical-projectile-damage-1.png",
            icon_size = 256
        }, {
            icon = "__core__/graphics/icons/technology/constants/constant-damage.png",
            icon_size = 128,
            scale = 0.5,
            shift = { 50, 50 },
            floating = true
        } },
        effects = { {
            type = "ammo-damage",
            ammo_category = "bullet",
            modifier = 0.1
        }, {
            type = "turret-attack",
            turret_id = "gun-turret",
            modifier = 0.1
        }, {
            type = "ammo-damage",
            ammo_category = "shotgun-shell",
            modifier = 0.1
        } },
        prerequisites = { "physical-projectile-damage-1", "logistic-science-pack" },
        unit = {
            count = 200,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 } },
            time = 30
        },
        upgrade = true
    },
    ["weapon-shooting-speed-1"] = {
        type = "technology",
        name = "weapon-shooting-speed-1",
        icons = { {
            icon = "__base__/graphics/technology/weapon-shooting-speed-1.png",
            icon_size = 256
        }, {
            icon = "__core__/graphics/icons/technology/constants/constant-speed.png",
            icon_size = 128,
            scale = 0.5,
            shift = { 50, 50 },
            floating = true
        } },
        effects = { {
            type = "gun-speed",
            ammo_category = "bullet",
            modifier = 0.1
        }, {
            type = "gun-speed",
            ammo_category = "shotgun-shell",
            modifier = 0.1
        } },
        prerequisites = { "military" },
        unit = {
            count = 100,
            ingredients = { { "automation-science-pack", 1 } },
            time = 30
        },
        upgrade = true
    },
    ["weapon-shooting-speed-2"] = {
        type = "technology",
        name = "weapon-shooting-speed-2",
        icons = { {
            icon = "__base__/graphics/technology/weapon-shooting-speed-1.png",
            icon_size = 256
        }, {
            icon = "__core__/graphics/icons/technology/constants/constant-speed.png",
            icon_size = 128,
            scale = 0.5,
            shift = { 50, 50 },
            floating = true
        } },
        effects = { {
            type = "gun-speed",
            ammo_category = "bullet",
            modifier = 0.2
        }, {
            type = "gun-speed",
            ammo_category = "shotgun-shell",
            modifier = 0.2
        } },
        prerequisites = { "weapon-shooting-speed-1", "logistic-science-pack" },
        unit = {
            count = 200,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 } },
            time = 30
        },
        upgrade = true
    },
    ["stronger-explosives-1"] = {
        type = "technology",
        name = "stronger-explosives-1",
        icons = { {
            icon = "__base__/graphics/technology/stronger-explosives-1.png",
            icon_size = 256
        }, {
            icon = "__core__/graphics/icons/technology/constants/constant-damage.png",
            icon_size = 128,
            scale = 0.5,
            shift = { 50, 50 },
            floating = true
        } },
        effects = { {
            type = "ammo-damage",
            ammo_category = "grenade",
            modifier = 0.25
        } },
        prerequisites = { "military-2" },
        unit = {
            count = 100,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 } },
            time = 30
        },
        upgrade = true
    },
    ["physical-projectile-damage-3"] = {
        type = "technology",
        name = "physical-projectile-damage-3",
        icons = { {
            icon = "__base__/graphics/technology/physical-projectile-damage-1.png",
            icon_size = 256
        }, {
            icon = "__core__/graphics/icons/technology/constants/constant-damage.png",
            icon_size = 128,
            scale = 0.5,
            shift = { 50, 50 },
            floating = true
        } },
        effects = { {
            type = "ammo-damage",
            ammo_category = "bullet",
            modifier = 0.2
        }, {
            type = "turret-attack",
            turret_id = "gun-turret",
            modifier = 0.2
        }, {
            type = "ammo-damage",
            ammo_category = "shotgun-shell",
            modifier = 0.2
        } },
        prerequisites = { "physical-projectile-damage-2", "military-science-pack" },
        unit = {
            count = 300,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "military-science-pack", 1 } },
            time = 60
        },
        upgrade = true
    },
    ["physical-projectile-damage-4"] = {
        type = "technology",
        name = "physical-projectile-damage-4",
        icons = { {
            icon = "__base__/graphics/technology/physical-projectile-damage-1.png",
            icon_size = 256
        }, {
            icon = "__core__/graphics/icons/technology/constants/constant-damage.png",
            icon_size = 128,
            scale = 0.5,
            shift = { 50, 50 },
            floating = true
        } },
        effects = { {
            type = "ammo-damage",
            ammo_category = "bullet",
            modifier = 0.2
        }, {
            type = "turret-attack",
            turret_id = "gun-turret",
            modifier = 0.2
        }, {
            type = "ammo-damage",
            ammo_category = "shotgun-shell",
            modifier = 0.2
        } },
        prerequisites = { "physical-projectile-damage-3" },
        unit = {
            count = 400,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "military-science-pack", 1 } },
            time = 60
        },
        upgrade = true
    },
    ["physical-projectile-damage-5"] = {
        type = "technology",
        name = "physical-projectile-damage-5",
        icons = { {
            icon = "__base__/graphics/technology/physical-projectile-damage-2.png",
            icon_size = 256
        }, {
            icon = "__core__/graphics/icons/technology/constants/constant-damage.png",
            icon_size = 128,
            scale = 0.5,
            shift = { 50, 50 },
            floating = true
        } },
        effects = { {
            type = "ammo-damage",
            ammo_category = "bullet",
            modifier = 0.2
        }, {
            type = "turret-attack",
            turret_id = "gun-turret",
            modifier = 0.2
        }, {
            type = "ammo-damage",
            ammo_category = "shotgun-shell",
            modifier = 0.2
        }, {
            type = "ammo-damage",
            ammo_category = "cannon-shell",
            modifier = 0.9
        } },
        prerequisites = { "physical-projectile-damage-4", "chemical-science-pack" },
        unit = {
            count = 500,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "chemical-science-pack", 1 }, { "military-science-pack", 1 } },
            time = 60
        },
        upgrade = true
    },
    ["physical-projectile-damage-6"] = {
        type = "technology",
        name = "physical-projectile-damage-6",
        icons = { {
            icon = "__base__/graphics/technology/physical-projectile-damage-2.png",
            icon_size = 256
        }, {
            icon = "__core__/graphics/icons/technology/constants/constant-damage.png",
            icon_size = 128,
            scale = 0.5,
            shift = { 50, 50 },
            floating = true
        } },
        effects = { {
            type = "ammo-damage",
            ammo_category = "bullet",
            modifier = 0.2
        }, {
            type = "turret-attack",
            turret_id = "gun-turret",
            modifier = 0.2
        }, {
            type = "ammo-damage",
            ammo_category = "shotgun-shell",
            modifier = 0.4
        }, {
            type = "ammo-damage",
            ammo_category = "cannon-shell",
            modifier = 1.3
        } },
        prerequisites = { "physical-projectile-damage-5", "utility-science-pack" },
        unit = {
            count = 600,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "chemical-science-pack", 1 }, { "military-science-pack", 1 }, { "utility-science-pack", 1 } },
            time = 60
        },
        upgrade = true
    },
    ["physical-projectile-damage-7"] = {
        type = "technology",
        name = "physical-projectile-damage-7",
        icons = { {
            icon = "__base__/graphics/technology/physical-projectile-damage-2.png",
            icon_size = 256
        }, {
            icon = "__core__/graphics/icons/technology/constants/constant-damage.png",
            icon_size = 128,
            scale = 0.5,
            shift = { 50, 50 },
            floating = true
        } },
        effects = { {
            type = "ammo-damage",
            ammo_category = "bullet",
            modifier = 0.2
        }, {
            type = "turret-attack",
            turret_id = "gun-turret",
            modifier = 0.2
        }, {
            type = "ammo-damage",
            ammo_category = "shotgun-shell",
            modifier = 0.4
        }, {
            type = "ammo-damage",
            ammo_category = "cannon-shell",
            modifier = 1
        } },
        prerequisites = { "physical-projectile-damage-6", "space-science-pack" },
        unit = {
            count_formula = "2^(L-7)*1000",
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "chemical-science-pack", 1 }, { "military-science-pack", 1 }, { "utility-science-pack", 1 }, { "space-science-pack", 1 } },
            time = 60
        },
        max_level = "infinite",
        upgrade = true
    },
    ["stronger-explosives-2"] = {
        type = "technology",
        name = "stronger-explosives-2",
        icons = { {
            icon = "__base__/graphics/technology/stronger-explosives-2.png",
            icon_size = 256
        }, {
            icon = "__core__/graphics/icons/technology/constants/constant-damage.png",
            icon_size = 128,
            scale = 0.5,
            shift = { 50, 50 },
            floating = true
        } },
        effects = { {
            type = "ammo-damage",
            ammo_category = "grenade",
            modifier = 0.2
        }, {
            type = "ammo-damage",
            ammo_category = "landmine",
            modifier = 0.2
        } },
        prerequisites = { "stronger-explosives-1", "military-science-pack" },
        unit = {
            count = 200,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "military-science-pack", 1 } },
            time = 30
        },
        upgrade = true
    },
    ["stronger-explosives-3"] = {
        type = "technology",
        name = "stronger-explosives-3",
        icons = { {
            icon = "__base__/graphics/technology/stronger-explosives-3.png",
            icon_size = 256
        }, {
            icon = "__core__/graphics/icons/technology/constants/constant-damage.png",
            icon_size = 128,
            scale = 0.5,
            shift = { 50, 50 },
            floating = true
        } },
        effects = { {
            type = "ammo-damage",
            ammo_category = "rocket",
            modifier = 0.3
        }, {
            type = "ammo-damage",
            ammo_category = "grenade",
            modifier = 0.2
        }, {
            type = "ammo-damage",
            ammo_category = "landmine",
            modifier = 0.2
        } },
        prerequisites = { "stronger-explosives-2", "chemical-science-pack" },
        unit = {
            count = 300,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "military-science-pack", 1 }, { "chemical-science-pack", 1 } },
            time = 60
        },
        upgrade = true
    },
    ["stronger-explosives-4"] = {
        type = "technology",
        name = "stronger-explosives-4",
        icons = { {
            icon = "__base__/graphics/technology/stronger-explosives-3.png",
            icon_size = 256
        }, {
            icon = "__core__/graphics/icons/technology/constants/constant-damage.png",
            icon_size = 128,
            scale = 0.5,
            shift = { 50, 50 },
            floating = true
        } },
        effects = { {
            type = "ammo-damage",
            ammo_category = "rocket",
            modifier = 0.4
        }, {
            type = "ammo-damage",
            ammo_category = "grenade",
            modifier = 0.2
        }, {
            type = "ammo-damage",
            ammo_category = "landmine",
            modifier = 0.2
        } },
        prerequisites = { "stronger-explosives-3", "utility-science-pack" },
        unit = {
            count = 400,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "military-science-pack", 1 }, { "chemical-science-pack", 1 }, { "utility-science-pack", 1 } },
            time = 60
        },
        upgrade = true
    },
    ["stronger-explosives-5"] = {
        type = "technology",
        name = "stronger-explosives-5",
        icons = { {
            icon = "__base__/graphics/technology/stronger-explosives-3.png",
            icon_size = 256
        }, {
            icon = "__core__/graphics/icons/technology/constants/constant-damage.png",
            icon_size = 128,
            scale = 0.5,
            shift = { 50, 50 },
            floating = true
        } },
        effects = { {
            type = "ammo-damage",
            ammo_category = "rocket",
            modifier = 0.5
        }, {
            type = "ammo-damage",
            ammo_category = "grenade",
            modifier = 0.2
        }, {
            type = "ammo-damage",
            ammo_category = "landmine",
            modifier = 0.2
        } },
        prerequisites = { "stronger-explosives-4", "space-science-pack" },
        unit = {
            count = 500,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "military-science-pack", 1 }, { "chemical-science-pack", 1 }, { "utility-science-pack", 1 }, { "space-science-pack", 1 } },
            time = 60
        },
        upgrade = true
    },
    ["stronger-explosives-6"] = {
        type = "technology",
        name = "stronger-explosives-6",
        icons = { {
            icon = "__base__/graphics/technology/stronger-explosives-3.png",
            icon_size = 256
        }, {
            icon = "__core__/graphics/icons/technology/constants/constant-damage.png",
            icon_size = 128,
            scale = 0.5,
            shift = { 50, 50 },
            floating = true
        } },
        effects = { {
            type = "ammo-damage",
            ammo_category = "rocket",
            modifier = 0.6
        }, {
            type = "ammo-damage",
            ammo_category = "grenade",
            modifier = 0.2
        }, {
            type = "ammo-damage",
            ammo_category = "landmine",
            modifier = 0.2
        } },
        prerequisites = { "stronger-explosives-5" },
        unit = {
            count = 600,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "chemical-science-pack", 1 }, { "military-science-pack", 1 }, { "utility-science-pack", 1 }, { "space-science-pack", 1 } },
            time = 60
        },
        upgrade = true
    },
    ["stronger-explosives-7"] = {
        type = "technology",
        name = "stronger-explosives-7",
        icons = { {
            icon = "__base__/graphics/technology/stronger-explosives-3.png",
            icon_size = 256
        }, {
            icon = "__core__/graphics/icons/technology/constants/constant-damage.png",
            icon_size = 128,
            scale = 0.5,
            shift = { 50, 50 },
            floating = true
        } },
        effects = { {
            type = "ammo-damage",
            ammo_category = "rocket",
            modifier = 0.5
        }, {
            type = "ammo-damage",
            ammo_category = "grenade",
            modifier = 0.2
        }, {
            type = "ammo-damage",
            ammo_category = "landmine",
            modifier = 0.2
        } },
        prerequisites = { "stronger-explosives-6", "agricultural-science-pack" },
        unit = {
            count_formula = "2^(L-7)*1000",
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "chemical-science-pack", 1 }, { "military-science-pack", 1 }, { "utility-science-pack", 1 }, { "space-science-pack", 1 }, { "agricultural-science-pack", 1 } },
            time = 60
        },
        max_level = "infinite",
        upgrade = true
    },
    ["refined-flammables-1"] = {
        type = "technology",
        name = "refined-flammables-1",
        icons = { {
            icon = "__base__/graphics/technology/refined-flammables.png",
            icon_size = 256
        }, {
            icon = "__core__/graphics/icons/technology/constants/constant-damage.png",
            icon_size = 128,
            scale = 0.5,
            shift = { 50, 50 },
            floating = true
        } },
        effects = { {
            type = "ammo-damage",
            ammo_category = "flamethrower",
            modifier = 0.2
        }, {
            type = "turret-attack",
            turret_id = "flamethrower-turret",
            modifier = 0.2
        } },
        prerequisites = { "flamethrower" },
        unit = {
            count = 100,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "military-science-pack", 1 } },
            time = 30
        },
        upgrade = true
    },
    ["refined-flammables-2"] = {
        type = "technology",
        name = "refined-flammables-2",
        icons = { {
            icon = "__base__/graphics/technology/refined-flammables.png",
            icon_size = 256
        }, {
            icon = "__core__/graphics/icons/technology/constants/constant-damage.png",
            icon_size = 128,
            scale = 0.5,
            shift = { 50, 50 },
            floating = true
        } },
        effects = { {
            type = "ammo-damage",
            ammo_category = "flamethrower",
            modifier = 0.2
        }, {
            type = "turret-attack",
            turret_id = "flamethrower-turret",
            modifier = 0.2
        } },
        prerequisites = { "refined-flammables-1" },
        unit = {
            count = 200,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "military-science-pack", 1 } },
            time = 30
        },
        upgrade = true
    },
    ["refined-flammables-3"] = {
        type = "technology",
        name = "refined-flammables-3",
        icons = { {
            icon = "__base__/graphics/technology/refined-flammables.png",
            icon_size = 256
        }, {
            icon = "__core__/graphics/icons/technology/constants/constant-damage.png",
            icon_size = 128,
            scale = 0.5,
            shift = { 50, 50 },
            floating = true
        } },
        effects = { {
            type = "ammo-damage",
            ammo_category = "flamethrower",
            modifier = 0.2
        }, {
            type = "turret-attack",
            turret_id = "flamethrower-turret",
            modifier = 0.2
        } },
        prerequisites = { "refined-flammables-2", "chemical-science-pack" },
        unit = {
            count = 300,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "military-science-pack", 1 }, { "chemical-science-pack", 1 } },
            time = 60
        },
        upgrade = true
    },
    ["refined-flammables-4"] = {
        type = "technology",
        name = "refined-flammables-4",
        icons = { {
            icon = "__base__/graphics/technology/refined-flammables.png",
            icon_size = 256
        }, {
            icon = "__core__/graphics/icons/technology/constants/constant-damage.png",
            icon_size = 128,
            scale = 0.5,
            shift = { 50, 50 },
            floating = true
        } },
        effects = { {
            type = "ammo-damage",
            ammo_category = "flamethrower",
            modifier = 0.3
        }, {
            type = "turret-attack",
            turret_id = "flamethrower-turret",
            modifier = 0.3
        } },
        prerequisites = { "refined-flammables-3", "utility-science-pack" },
        unit = {
            count = 400,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "military-science-pack", 1 }, { "chemical-science-pack", 1 }, { "utility-science-pack", 1 } },
            time = 60
        },
        upgrade = true
    },
    ["refined-flammables-5"] = {
        type = "technology",
        name = "refined-flammables-5",
        icons = { {
            icon = "__base__/graphics/technology/refined-flammables.png",
            icon_size = 256
        }, {
            icon = "__core__/graphics/icons/technology/constants/constant-damage.png",
            icon_size = 128,
            scale = 0.5,
            shift = { 50, 50 },
            floating = true
        } },
        effects = { {
            type = "ammo-damage",
            ammo_category = "flamethrower",
            modifier = 0.3
        }, {
            type = "turret-attack",
            turret_id = "flamethrower-turret",
            modifier = 0.3
        } },
        prerequisites = { "refined-flammables-4" },
        unit = {
            count = 500,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "military-science-pack", 1 }, { "chemical-science-pack", 1 }, { "utility-science-pack", 1 } },
            time = 60
        },
        upgrade = true
    },
    ["refined-flammables-6"] = {
        type = "technology",
        name = "refined-flammables-6",
        icons = { {
            icon = "__base__/graphics/technology/refined-flammables.png",
            icon_size = 256
        }, {
            icon = "__core__/graphics/icons/technology/constants/constant-damage.png",
            icon_size = 128,
            scale = 0.5,
            shift = { 50, 50 },
            floating = true
        } },
        effects = { {
            type = "ammo-damage",
            ammo_category = "flamethrower",
            modifier = 0.4
        }, {
            type = "turret-attack",
            turret_id = "flamethrower-turret",
            modifier = 0.4
        } },
        prerequisites = { "refined-flammables-5", "space-science-pack" },
        unit = {
            count = 600,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "chemical-science-pack", 1 }, { "military-science-pack", 1 }, { "utility-science-pack", 1 }, { "space-science-pack", 1 } },
            time = 60
        },
        upgrade = true
    },
    ["refined-flammables-7"] = {
        type = "technology",
        name = "refined-flammables-7",
        icons = { {
            icon = "__base__/graphics/technology/refined-flammables.png",
            icon_size = 256
        }, {
            icon = "__core__/graphics/icons/technology/constants/constant-damage.png",
            icon_size = 128,
            scale = 0.5,
            shift = { 50, 50 },
            floating = true
        } },
        effects = { {
            type = "ammo-damage",
            ammo_category = "flamethrower",
            modifier = 0.2
        }, {
            type = "turret-attack",
            turret_id = "flamethrower-turret",
            modifier = 0.2
        } },
        prerequisites = { "refined-flammables-6", "agricultural-science-pack" },
        unit = {
            count_formula = "2^(L-7)*1000",
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "chemical-science-pack", 1 }, { "military-science-pack", 1 }, { "utility-science-pack", 1 }, { "space-science-pack", 1 }, { "agricultural-science-pack", 1 } },
            time = 60
        },
        max_level = "infinite",
        upgrade = true
    },
    ["laser-weapons-damage-1"] = {
        type = "technology",
        name = "laser-weapons-damage-1",
        icons = { {
            icon = "__base__/graphics/technology/laser-weapons-damage.png",
            icon_size = 256
        }, {
            icon = "__core__/graphics/icons/technology/constants/constant-damage.png",
            icon_size = 128,
            scale = 0.5,
            shift = { 50, 50 },
            floating = true
        } },
        effects = { {
            type = "ammo-damage",
            ammo_category = "laser",
            modifier = 0.2
        } },
        prerequisites = { "laser", "military-science-pack" },
        unit = {
            count = 100,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "military-science-pack", 1 }, { "chemical-science-pack", 1 } },
            time = 30
        },
        upgrade = true
    },
    ["laser-weapons-damage-2"] = {
        type = "technology",
        name = "laser-weapons-damage-2",
        icons = { {
            icon = "__base__/graphics/technology/laser-weapons-damage.png",
            icon_size = 256
        }, {
            icon = "__core__/graphics/icons/technology/constants/constant-damage.png",
            icon_size = 128,
            scale = 0.5,
            shift = { 50, 50 },
            floating = true
        } },
        effects = { {
            type = "ammo-damage",
            ammo_category = "laser",
            modifier = 0.2
        } },
        prerequisites = { "laser-weapons-damage-1" },
        unit = {
            count = 200,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "military-science-pack", 1 }, { "chemical-science-pack", 1 } },
            time = 30
        },
        upgrade = true
    },
    ["laser-weapons-damage-3"] = {
        type = "technology",
        name = "laser-weapons-damage-3",
        icons = { {
            icon = "__base__/graphics/technology/laser-weapons-damage.png",
            icon_size = 256
        }, {
            icon = "__core__/graphics/icons/technology/constants/constant-damage.png",
            icon_size = 128,
            scale = 0.5,
            shift = { 50, 50 },
            floating = true
        } },
        effects = { {
            type = "ammo-damage",
            ammo_category = "laser",
            modifier = 0.3
        } },
        prerequisites = { "laser-weapons-damage-2" },
        unit = {
            count = 300,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "military-science-pack", 1 }, { "chemical-science-pack", 1 } },
            time = 60
        },
        upgrade = true
    },
    ["laser-weapons-damage-4"] = {
        type = "technology",
        name = "laser-weapons-damage-4",
        icons = { {
            icon = "__base__/graphics/technology/laser-weapons-damage.png",
            icon_size = 256
        }, {
            icon = "__core__/graphics/icons/technology/constants/constant-damage.png",
            icon_size = 128,
            scale = 0.5,
            shift = { 50, 50 },
            floating = true
        } },
        effects = { {
            type = "ammo-damage",
            ammo_category = "laser",
            modifier = 0.4
        } },
        prerequisites = { "laser-weapons-damage-3" },
        unit = {
            count = 400,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "military-science-pack", 1 }, { "chemical-science-pack", 1 } },
            time = 60
        },
        upgrade = true
    },
    ["laser-weapons-damage-5"] = {
        type = "technology",
        name = "laser-weapons-damage-5",
        icons = { {
            icon = "__base__/graphics/technology/laser-weapons-damage.png",
            icon_size = 256
        }, {
            icon = "__core__/graphics/icons/technology/constants/constant-damage.png",
            icon_size = 128,
            scale = 0.5,
            shift = { 50, 50 },
            floating = true
        } },
        effects = { {
            ammo_category = "laser",
            modifier = 0.5,
            type = "ammo-damage"
        } },
        prerequisites = { "laser-weapons-damage-4", "utility-science-pack" },
        unit = {
            count = 500,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "chemical-science-pack", 1 }, { "military-science-pack", 1 }, { "utility-science-pack", 1 } },
            time = 60
        },
        upgrade = true
    },
    ["laser-weapons-damage-6"] = {
        type = "technology",
        name = "laser-weapons-damage-6",
        icons = { {
            icon = "__base__/graphics/technology/laser-weapons-damage.png",
            icon_size = 256
        }, {
            icon = "__core__/graphics/icons/technology/constants/constant-damage.png",
            icon_size = 128,
            scale = 0.5,
            shift = { 50, 50 },
            floating = true
        } },
        effects = { {
            ammo_category = "laser",
            modifier = 0.7,
            type = "ammo-damage"
        } },
        prerequisites = { "laser-weapons-damage-5" },
        unit = {
            count = 600,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "chemical-science-pack", 1 }, { "military-science-pack", 1 }, { "utility-science-pack", 1 } },
            time = 60
        },
        upgrade = true
    },
    ["laser-weapons-damage-7"] = {
        type = "technology",
        name = "laser-weapons-damage-7",
        icons = { {
            icon = "__base__/graphics/technology/laser-weapons-damage.png",
            icon_size = 256
        }, {
            icon = "__core__/graphics/icons/technology/constants/constant-damage.png",
            icon_size = 128,
            scale = 0.5,
            shift = { 50, 50 },
            floating = true
        } },
        effects = { {
            ammo_category = "laser",
            modifier = 0.7,
            type = "ammo-damage"
        } },
        prerequisites = { "laser-weapons-damage-6", "space-science-pack" },
        unit = {
            count_formula = "2^(L-7)*1000",
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "chemical-science-pack", 1 }, { "military-science-pack", 1 }, { "utility-science-pack", 1 }, { "space-science-pack", 1 } },
            time = 60
        },
        max_level = "infinite",
        upgrade = true
    },
    ["weapon-shooting-speed-3"] = {
        type = "technology",
        name = "weapon-shooting-speed-3",
        icons = { {
            icon = "__base__/graphics/technology/weapon-shooting-speed-2.png",
            icon_size = 256
        }, {
            icon = "__core__/graphics/icons/technology/constants/constant-speed.png",
            icon_size = 128,
            scale = 0.5,
            shift = { 50, 50 },
            floating = true
        } },
        effects = { {
            type = "gun-speed",
            ammo_category = "bullet",
            modifier = 0.2
        }, {
            type = "gun-speed",
            ammo_category = "shotgun-shell",
            modifier = 0.2
        }, {
            type = "gun-speed",
            ammo_category = "rocket",
            modifier = 0.5
        } },
        prerequisites = { "weapon-shooting-speed-2", "military-science-pack" },
        unit = {
            count = 300,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "military-science-pack", 1 } },
            time = 60
        },
        upgrade = true
    },
    ["weapon-shooting-speed-4"] = {
        type = "technology",
        name = "weapon-shooting-speed-4",
        icons = { {
            icon = "__base__/graphics/technology/weapon-shooting-speed-2.png",
            icon_size = 256
        }, {
            icon = "__core__/graphics/icons/technology/constants/constant-speed.png",
            icon_size = 128,
            scale = 0.5,
            shift = { 50, 50 },
            floating = true
        } },
        effects = { {
            type = "gun-speed",
            ammo_category = "bullet",
            modifier = 0.3
        }, {
            type = "gun-speed",
            ammo_category = "shotgun-shell",
            modifier = 0.3
        }, {
            type = "gun-speed",
            ammo_category = "rocket",
            modifier = 0.7
        } },
        prerequisites = { "weapon-shooting-speed-3" },
        unit = {
            count = 400,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "military-science-pack", 1 } },
            time = 60
        },
        upgrade = true
    },
    ["weapon-shooting-speed-5"] = {
        type = "technology",
        name = "weapon-shooting-speed-5",
        icons = { {
            icon = "__base__/graphics/technology/weapon-shooting-speed-3.png",
            icon_size = 256
        }, {
            icon = "__core__/graphics/icons/technology/constants/constant-speed.png",
            icon_size = 128,
            scale = 0.5,
            shift = { 50, 50 },
            floating = true
        } },
        effects = { {
            type = "gun-speed",
            ammo_category = "bullet",
            modifier = 0.3
        }, {
            type = "gun-speed",
            ammo_category = "shotgun-shell",
            modifier = 0.4
        }, {
            type = "gun-speed",
            ammo_category = "cannon-shell",
            modifier = 0.8
        }, {
            type = "gun-speed",
            ammo_category = "rocket",
            modifier = 0.9
        } },
        prerequisites = { "weapon-shooting-speed-4", "chemical-science-pack" },
        unit = {
            count = 500,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "chemical-science-pack", 1 }, { "military-science-pack", 1 } },
            time = 60
        },
        upgrade = true
    },
    ["weapon-shooting-speed-6"] = {
        type = "technology",
        name = "weapon-shooting-speed-6",
        icons = { {
            icon = "__base__/graphics/technology/weapon-shooting-speed-3.png",
            icon_size = 256
        }, {
            icon = "__core__/graphics/icons/technology/constants/constant-speed.png",
            icon_size = 128,
            scale = 0.5,
            shift = { 50, 50 },
            floating = true
        } },
        effects = { {
            type = "gun-speed",
            ammo_category = "bullet",
            modifier = 0.4
        }, {
            type = "gun-speed",
            ammo_category = "shotgun-shell",
            modifier = 0.4
        }, {
            type = "gun-speed",
            ammo_category = "cannon-shell",
            modifier = 1.5
        }, {
            type = "gun-speed",
            ammo_category = "rocket",
            modifier = 1.3
        } },
        prerequisites = { "weapon-shooting-speed-5", "utility-science-pack" },
        unit = {
            count = 600,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "chemical-science-pack", 1 }, { "military-science-pack", 1 }, { "utility-science-pack", 1 } },
            time = 60
        },
        upgrade = true
    },
    ["laser-shooting-speed-1"] = {
        type = "technology",
        name = "laser-shooting-speed-1",
        icons = { {
            icon = "__base__/graphics/technology/laser-shooting-speed.png",
            icon_size = 256
        }, {
            icon = "__core__/graphics/icons/technology/constants/constant-speed.png",
            icon_size = 128,
            scale = 0.5,
            shift = { 50, 50 },
            floating = true
        } },
        effects = { {
            type = "gun-speed",
            ammo_category = "laser",
            modifier = 0.1
        } },
        prerequisites = { "laser", "military-science-pack" },
        unit = {
            count = 50,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "military-science-pack", 1 }, { "chemical-science-pack", 1 } },
            time = 30
        },
        upgrade = true
    },
    ["laser-shooting-speed-2"] = {
        type = "technology",
        name = "laser-shooting-speed-2",
        icons = { {
            icon = "__base__/graphics/technology/laser-shooting-speed.png",
            icon_size = 256
        }, {
            icon = "__core__/graphics/icons/technology/constants/constant-speed.png",
            icon_size = 128,
            scale = 0.5,
            shift = { 50, 50 },
            floating = true
        } },
        effects = { {
            type = "gun-speed",
            ammo_category = "laser",
            modifier = 0.2
        } },
        prerequisites = { "laser-shooting-speed-1" },
        unit = {
            count = 100,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "military-science-pack", 1 }, { "chemical-science-pack", 1 } },
            time = 30
        },
        upgrade = true
    },
    ["laser-shooting-speed-3"] = {
        type = "technology",
        name = "laser-shooting-speed-3",
        icons = { {
            icon = "__base__/graphics/technology/laser-shooting-speed.png",
            icon_size = 256
        }, {
            icon = "__core__/graphics/icons/technology/constants/constant-speed.png",
            icon_size = 128,
            scale = 0.5,
            shift = { 50, 50 },
            floating = true
        } },
        effects = { {
            type = "gun-speed",
            ammo_category = "laser",
            modifier = 0.3
        } },
        prerequisites = { "laser-shooting-speed-2" },
        unit = {
            count = 200,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "chemical-science-pack", 1 }, { "military-science-pack", 1 } },
            time = 60
        },
        upgrade = true
    },
    ["laser-shooting-speed-4"] = {
        type = "technology",
        name = "laser-shooting-speed-4",
        icons = { {
            icon = "__base__/graphics/technology/laser-shooting-speed.png",
            icon_size = 256
        }, {
            icon = "__core__/graphics/icons/technology/constants/constant-speed.png",
            icon_size = 128,
            scale = 0.5,
            shift = { 50, 50 },
            floating = true
        } },
        effects = { {
            type = "gun-speed",
            ammo_category = "laser",
            modifier = 0.3
        } },
        prerequisites = { "laser-shooting-speed-3" },
        unit = {
            count = 200,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "chemical-science-pack", 1 }, { "military-science-pack", 1 } },
            time = 60
        },
        upgrade = true
    },
    ["laser-shooting-speed-5"] = {
        type = "technology",
        name = "laser-shooting-speed-5",
        icons = { {
            icon = "__base__/graphics/technology/laser-shooting-speed.png",
            icon_size = 256
        }, {
            icon = "__core__/graphics/icons/technology/constants/constant-speed.png",
            icon_size = 128,
            scale = 0.5,
            shift = { 50, 50 },
            floating = true
        } },
        effects = { {
            type = "gun-speed",
            ammo_category = "laser",
            modifier = 0.4
        } },
        prerequisites = { "laser-shooting-speed-4", "utility-science-pack" },
        unit = {
            count = 200,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "chemical-science-pack", 1 }, { "military-science-pack", 1 }, { "utility-science-pack", 1 } },
            time = 60
        },
        upgrade = true
    },
    ["laser-shooting-speed-6"] = {
        type = "technology",
        name = "laser-shooting-speed-6",
        icons = { {
            icon = "__base__/graphics/technology/laser-shooting-speed.png",
            icon_size = 256
        }, {
            icon = "__core__/graphics/icons/technology/constants/constant-speed.png",
            icon_size = 128,
            scale = 0.5,
            shift = { 50, 50 },
            floating = true
        } },
        effects = { {
            type = "gun-speed",
            ammo_category = "laser",
            modifier = 0.4
        } },
        prerequisites = { "laser-shooting-speed-5" },
        unit = {
            count = 350,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "chemical-science-pack", 1 }, { "military-science-pack", 1 }, { "utility-science-pack", 1 } },
            time = 60
        },
        upgrade = true
    },
    ["laser-shooting-speed-7"] = {
        type = "technology",
        name = "laser-shooting-speed-7",
        icons = { {
            icon = "__base__/graphics/technology/laser-shooting-speed.png",
            icon_size = 256
        }, {
            icon = "__core__/graphics/icons/technology/constants/constant-speed.png",
            icon_size = 128,
            scale = 0.5,
            shift = { 50, 50 },
            floating = true
        } },
        effects = { {
            type = "gun-speed",
            ammo_category = "laser",
            modifier = 0.5
        } },
        prerequisites = { "laser-shooting-speed-6" },
        unit = {
            count = 450,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "chemical-science-pack", 1 }, { "military-science-pack", 1 }, { "utility-science-pack", 1 } },
            time = 60
        },
        upgrade = true
    },
    ["artillery-shell-range-1"] = {
        type = "technology",
        name = "artillery-shell-range-1",
        icons = { {
            icon = "__base__/graphics/technology/artillery-range.png",
            icon_size = 256
        }, {
            icon = "__core__/graphics/icons/technology/constants/constant-range.png",
            icon_size = 128,
            scale = 0.5,
            shift = { 50, 50 },
            floating = true
        } },
        effects = { {
            type = "artillery-range",
            modifier = 0.3
        } },
        prerequisites = { "artillery" },
        unit = {
            count_formula = "2^(L-1)*1000",
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "chemical-science-pack", 1 }, { "military-science-pack", 1 }, { "utility-science-pack", 1 }, { "space-science-pack", 1 }, { "metallurgic-science-pack", 1 } },
            time = 60
        },
        max_level = "infinite"
    },
    ["artillery-shell-speed-1"] = {
        type = "technology",
        name = "artillery-shell-speed-1",
        icons = { {
            icon = "__base__/graphics/technology/artillery-speed.png",
            icon_size = 256
        }, {
            icon = "__core__/graphics/icons/technology/constants/constant-speed.png",
            icon_size = 128,
            scale = 0.5,
            shift = { 50, 50 },
            floating = true
        } },
        effects = { {
            type = "gun-speed",
            ammo_category = "artillery-shell",
            icon = "__base__/graphics/icons/artillery-shell.png",
            modifier = 1
        } },
        prerequisites = { "artillery" },
        unit = {
            count_formula = "2^(L-1)*1000",
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "chemical-science-pack", 1 }, { "military-science-pack", 1 }, { "utility-science-pack", 1 }, { "space-science-pack", 1 }, { "metallurgic-science-pack", 1 } },
            time = 60
        },
        max_level = "infinite"
    },
    ["follower-robot-count-1"] = {
        type = "technology",
        name = "follower-robot-count-1",
        icons = { {
            icon = "__base__/graphics/technology/follower-robots.png",
            icon_size = 256
        }, {
            icon = "__core__/graphics/icons/technology/constants/constant-count.png",
            icon_size = 128,
            scale = 0.5,
            shift = { 50, 50 },
            floating = true
        } },
        effects = { {
            type = "maximum-following-robots-count",
            modifier = 5
        } },
        prerequisites = { "defender" },
        unit = {
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "military-science-pack", 1 } },
            time = 30,
            count = 100
        },
        upgrade = true
    },
    ["follower-robot-count-2"] = {
        type = "technology",
        name = "follower-robot-count-2",
        icons = { {
            icon = "__base__/graphics/technology/follower-robots.png",
            icon_size = 256
        }, {
            icon = "__core__/graphics/icons/technology/constants/constant-count.png",
            icon_size = 128,
            scale = 0.5,
            shift = { 50, 50 },
            floating = true
        } },
        effects = { {
            type = "maximum-following-robots-count",
            modifier = 10
        } },
        prerequisites = { "follower-robot-count-1" },
        unit = {
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "military-science-pack", 1 } },
            time = 30,
            count = 200
        },
        upgrade = true
    },
    ["follower-robot-count-3"] = {
        type = "technology",
        name = "follower-robot-count-3",
        icons = { {
            icon = "__base__/graphics/technology/follower-robots.png",
            icon_size = 256
        }, {
            icon = "__core__/graphics/icons/technology/constants/constant-count.png",
            icon_size = 128,
            scale = 0.5,
            shift = { 50, 50 },
            floating = true
        } },
        effects = { {
            type = "maximum-following-robots-count",
            modifier = 10
        } },
        prerequisites = { "follower-robot-count-2", "chemical-science-pack" },
        unit = {
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "chemical-science-pack", 1 }, { "military-science-pack", 1 } },
            time = 30,
            count = 300
        },
        upgrade = true
    },
    ["follower-robot-count-4"] = {
        type = "technology",
        name = "follower-robot-count-4",
        icons = { {
            icon = "__base__/graphics/technology/follower-robots.png",
            icon_size = 256
        }, {
            icon = "__core__/graphics/icons/technology/constants/constant-count.png",
            icon_size = 128,
            scale = 0.5,
            shift = { 50, 50 },
            floating = true
        } },
        effects = { {
            type = "maximum-following-robots-count",
            modifier = 20
        } },
        prerequisites = { "follower-robot-count-3", "destroyer" },
        unit = {
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "chemical-science-pack", 1 }, { "military-science-pack", 1 }, { "utility-science-pack", 1 } },
            time = 30,
            count = 400
        },
        upgrade = true
    },
    ["follower-robot-count-5"] = {
        type = "technology",
        name = "follower-robot-count-5",
        icons = { {
            icon = "__base__/graphics/technology/follower-robots.png",
            icon_size = 256
        }, {
            icon = "__core__/graphics/icons/technology/constants/constant-count.png",
            icon_size = 128,
            scale = 0.5,
            shift = { 50, 50 },
            floating = true
        } },
        effects = { {
            type = "maximum-following-robots-count",
            modifier = 25
        } },
        prerequisites = { "follower-robot-count-4", "space-science-pack", "production-science-pack" },
        unit = {
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "chemical-science-pack", 1 }, { "military-science-pack", 1 }, { "production-science-pack", 1 }, { "utility-science-pack", 1 }, { "space-science-pack", 1 } },
            time = 30,
            count_formula = "1000*(L-4)"
        },
        max_level = "infinite",
        upgrade = true
    },
    ["bulk-inserter"] = {
        type = "technology",
        name = "bulk-inserter",
        icon = "__base__/graphics/technology/bulk-inserter.png",
        icon_size = 256,
        effects = { {
            type = "unlock-recipe",
            recipe = "bulk-inserter"
        }, {
            type = "bulk-inserter-capacity-bonus",
            modifier = 1
        } },
        prerequisites = { "fast-inserter", "logistics-2", "advanced-circuit" },
        unit = {
            count = 150,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 } },
            time = 30
        }
    },
    ["inserter-capacity-bonus-1"] = {
        type = "technology",
        name = "inserter-capacity-bonus-1",
        icons = { {
            icon = "__base__/graphics/technology/inserter-capacity.png",
            icon_size = 256
        }, {
            icon = "__core__/graphics/icons/technology/constants/constant-capacity.png",
            icon_size = 128,
            scale = 0.5,
            shift = { 50, 50 },
            floating = true
        } },
        effects = { {
            type = "bulk-inserter-capacity-bonus",
            modifier = 1
        } },
        prerequisites = { "bulk-inserter" },
        unit = {
            count = 200,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 } },
            time = 30
        },
        upgrade = true
    },
    ["inserter-capacity-bonus-2"] = {
        type = "technology",
        name = "inserter-capacity-bonus-2",
        icons = { {
            icon = "__base__/graphics/technology/inserter-capacity.png",
            icon_size = 256
        }, {
            icon = "__core__/graphics/icons/technology/constants/constant-capacity.png",
            icon_size = 128,
            scale = 0.5,
            shift = { 50, 50 },
            floating = true
        } },
        effects = { {
            type = "inserter-stack-size-bonus",
            modifier = 1
        }, {
            type = "bulk-inserter-capacity-bonus",
            modifier = 1
        } },
        prerequisites = { "inserter-capacity-bonus-1" },
        unit = {
            count = 250,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 } },
            time = 30
        },
        upgrade = true
    },
    ["inserter-capacity-bonus-3"] = {
        type = "technology",
        name = "inserter-capacity-bonus-3",
        icons = { {
            icon = "__base__/graphics/technology/inserter-capacity.png",
            icon_size = 256
        }, {
            icon = "__core__/graphics/icons/technology/constants/constant-capacity.png",
            icon_size = 128,
            scale = 0.5,
            shift = { 50, 50 },
            floating = true
        } },
        effects = { {
            type = "bulk-inserter-capacity-bonus",
            modifier = 1
        } },
        prerequisites = { "inserter-capacity-bonus-2", "chemical-science-pack" },
        unit = {
            count = 250,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "chemical-science-pack", 1 } },
            time = 30
        },
        upgrade = true
    },
    ["inserter-capacity-bonus-4"] = {
        type = "technology",
        name = "inserter-capacity-bonus-4",
        icons = { {
            icon = "__base__/graphics/technology/inserter-capacity.png",
            icon_size = 256
        }, {
            icon = "__core__/graphics/icons/technology/constants/constant-capacity.png",
            icon_size = 128,
            scale = 0.5,
            shift = { 50, 50 },
            floating = true
        } },
        effects = { {
            type = "bulk-inserter-capacity-bonus",
            modifier = 1
        } },
        prerequisites = { "inserter-capacity-bonus-3", "production-science-pack" },
        unit = {
            count = 250,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "chemical-science-pack", 1 }, { "production-science-pack", 1 } },
            time = 30
        },
        upgrade = true
    },
    ["inserter-capacity-bonus-5"] = {
        type = "technology",
        name = "inserter-capacity-bonus-5",
        icons = { {
            icon = "__base__/graphics/technology/inserter-capacity.png",
            icon_size = 256
        }, {
            icon = "__core__/graphics/icons/technology/constants/constant-capacity.png",
            icon_size = 128,
            scale = 0.5,
            shift = { 50, 50 },
            floating = true
        } },
        effects = { {
            type = "bulk-inserter-capacity-bonus",
            modifier = 2
        } },
        prerequisites = { "inserter-capacity-bonus-4" },
        unit = {
            count = 300,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "chemical-science-pack", 1 }, { "production-science-pack", 1 } },
            time = 30
        },
        upgrade = true
    },
    ["inserter-capacity-bonus-6"] = {
        type = "technology",
        name = "inserter-capacity-bonus-6",
        icons = { {
            icon = "__base__/graphics/technology/inserter-capacity.png",
            icon_size = 256
        }, {
            icon = "__core__/graphics/icons/technology/constants/constant-capacity.png",
            icon_size = 128,
            scale = 0.5,
            shift = { 50, 50 },
            floating = true
        } },
        effects = { {
            type = "bulk-inserter-capacity-bonus",
            modifier = 2
        } },
        prerequisites = { "inserter-capacity-bonus-5" },
        unit = {
            count = 400,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "chemical-science-pack", 1 }, { "production-science-pack", 1 } },
            time = 30
        },
        upgrade = true
    },
    ["inserter-capacity-bonus-7"] = {
        type = "technology",
        name = "inserter-capacity-bonus-7",
        icons = { {
            icon = "__base__/graphics/technology/inserter-capacity.png",
            icon_size = 256
        }, {
            icon = "__core__/graphics/icons/technology/constants/constant-capacity.png",
            icon_size = 128,
            scale = 0.5,
            shift = { 50, 50 },
            floating = true
        } },
        effects = { {
            type = "inserter-stack-size-bonus",
            modifier = 1
        }, {
            type = "bulk-inserter-capacity-bonus",
            modifier = 2
        } },
        prerequisites = { "inserter-capacity-bonus-6", "utility-science-pack" },
        unit = {
            count = 600,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "chemical-science-pack", 1 }, { "production-science-pack", 1 }, { "utility-science-pack", 1 } },
            time = 30
        },
        upgrade = true
    },
    automation = {
        type = "technology",
        name = "automation",
        icon = "__base__/graphics/technology/automation-1.png",
        icon_size = 256,
        effects = { {
            type = "unlock-recipe",
            recipe = "assembling-machine-1"
        }, {
            type = "unlock-recipe",
            recipe = "long-handed-inserter"
        } },
        prerequisites = { "automation-science-pack" },
        unit = {
            count = 10,
            ingredients = { { "automation-science-pack", 1 } },
            time = 10
        },
        ignore_tech_cost_multiplier = true
    },
    ["automation-2"] = {
        type = "technology",
        name = "automation-2",
        icon = "__base__/graphics/technology/automation-2.png",
        icon_size = 256,
        localised_description = { "technology-description.automation-2" },
        effects = { {
            type = "unlock-recipe",
            recipe = "assembling-machine-2"
        } },
        prerequisites = { "automation", "steel-processing", "logistic-science-pack" },
        unit = {
            count = 40,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 } },
            time = 15
        }
    },
    ["logistic-science-pack"] = {
        type = "technology",
        name = "logistic-science-pack",
        localised_name = { "technology-name.logistic-science-pack" },
        localised_description = { "technology-description.logistic-science-pack" },
        icon = "__base__/graphics/technology/logistic-science-pack.png",
        icon_size = 256,
        essential = true,
        effects = { {
            type = "unlock-recipe",
            recipe = "logistic-science-pack"
        } },
        prerequisites = { "automation-science-pack" },
        unit = {
            count = 75,
            ingredients = { { "automation-science-pack", 1 } },
            time = 5
        }
    },
    ["steel-processing"] = {
        type = "technology",
        name = "steel-processing",
        icon = "__base__/graphics/technology/steel-processing.png",
        icon_size = 256,
        effects = { {
            type = "unlock-recipe",
            recipe = "steel-plate"
        }, {
            type = "unlock-recipe",
            recipe = "steel-chest"
        } },
        prerequisites = { "automation-science-pack" },
        unit = {
            count = 50,
            ingredients = { { "automation-science-pack", 1 } },
            time = 5
        }
    },
    ["steel-axe"] = {
        type = "technology",
        name = "steel-axe",
        icon = "__base__/graphics/technology/steel-axe.png",
        icon_size = 256,
        effects = { {
            type = "character-mining-speed",
            modifier = 1
        } },
        prerequisites = { "steel-processing" },
        research_trigger = {
            type = "craft-item",
            item = "steel-plate",
            count = 50
        }
    },
    military = {
        type = "technology",
        name = "military",
        icon = "__base__/graphics/technology/military.png",
        icon_size = 256,
        effects = { {
            type = "unlock-recipe",
            recipe = "submachine-gun"
        }, {
            type = "unlock-recipe",
            recipe = "shotgun"
        }, {
            type = "unlock-recipe",
            recipe = "shotgun-shell"
        } },
        prerequisites = { "automation-science-pack" },
        unit = {
            count = 10,
            ingredients = { { "automation-science-pack", 1 } },
            time = 15
        }
    },
    ["military-2"] = {
        type = "technology",
        name = "military-2",
        icon = "__base__/graphics/technology/military.png",
        icon_size = 256,
        effects = { {
            type = "unlock-recipe",
            recipe = "piercing-rounds-magazine"
        }, {
            type = "unlock-recipe",
            recipe = "grenade"
        } },
        prerequisites = { "military", "steel-processing", "logistic-science-pack" },
        unit = {
            count = 20,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 } },
            time = 15
        }
    },
    ["fast-inserter"] = {
        type = "technology",
        name = "fast-inserter",
        icon = "__base__/graphics/technology/fast-inserter.png",
        icon_size = 256,
        effects = { {
            type = "unlock-recipe",
            recipe = "fast-inserter"
        } },
        prerequisites = { "automation-science-pack" },
        unit = {
            count = 30,
            ingredients = { { "automation-science-pack", 1 } },
            time = 15
        }
    },
    logistics = {
        type = "technology",
        name = "logistics",
        icon = "__base__/graphics/technology/logistics-1.png",
        icon_size = 256,
        effects = { {
            type = "unlock-recipe",
            recipe = "underground-belt"
        }, {
            type = "unlock-recipe",
            recipe = "splitter"
        } },
        prerequisites = { "automation-science-pack" },
        unit = {
            count = 20,
            ingredients = { { "automation-science-pack", 1 } },
            time = 15
        }
    },
    railway = {
        type = "technology",
        name = "railway",
        icon = "__base__/graphics/technology/railway.png",
        icon_size = 256,
        effects = { {
            type = "unlock-recipe",
            recipe = "rail"
        }, {
            type = "unlock-recipe",
            recipe = "locomotive"
        }, {
            type = "unlock-recipe",
            recipe = "cargo-wagon"
        }, {
            type = "unlock-recipe",
            recipe = "iron-stick"
        } },
        prerequisites = { "logistics-2", "engine" },
        unit = {
            count = 75,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 } },
            time = 30
        }
    },
    ["automated-rail-transportation"] = {
        type = "technology",
        name = "automated-rail-transportation",
        icon = "__base__/graphics/technology/automated-rail-transportation.png",
        icon_size = 256,
        effects = { {
            type = "unlock-recipe",
            recipe = "train-stop"
        }, {
            type = "unlock-recipe",
            recipe = "rail-signal"
        }, {
            type = "unlock-recipe",
            recipe = "rail-chain-signal"
        } },
        prerequisites = { "railway" },
        unit = {
            count = 200,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 } },
            time = 30
        }
    },
    automobilism = {
        type = "technology",
        name = "automobilism",
        icon = "__base__/graphics/technology/automobilism.png",
        icon_size = 256,
        effects = { {
            type = "unlock-recipe",
            recipe = "car"
        } },
        prerequisites = { "logistics-2", "engine" },
        unit = {
            count = 100,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 } },
            time = 30
        }
    },
    lamp = {
        type = "technology",
        name = "lamp",
        icon = "__base__/graphics/technology/lamp.png",
        icon_size = 256,
        effects = { {
            type = "unlock-recipe",
            recipe = "small-lamp"
        } },
        prerequisites = { "automation-science-pack" },
        unit = {
            count = 10,
            ingredients = { { "automation-science-pack", 1 } },
            time = 15
        }
    },
    ["solar-energy"] = {
        type = "technology",
        name = "solar-energy",
        icon = "__base__/graphics/technology/solar-energy.png",
        icon_size = 256,
        effects = { {
            type = "unlock-recipe",
            recipe = "solar-panel"
        } },
        prerequisites = { "steel-processing", "logistic-science-pack" },
        unit = {
            count = 250,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 } },
            time = 30
        }
    },
    ["heavy-armor"] = {
        type = "technology",
        name = "heavy-armor",
        icon = "__base__/graphics/technology/heavy-armor.png",
        icon_size = 256,
        effects = { {
            type = "unlock-recipe",
            recipe = "heavy-armor"
        } },
        prerequisites = { "military", "steel-processing" },
        unit = {
            count = 30,
            ingredients = { { "automation-science-pack", 1 } },
            time = 30
        }
    },
    ["gun-turret"] = {
        type = "technology",
        name = "gun-turret",
        icon = "__base__/graphics/technology/gun-turret.png",
        icon_size = 256,
        effects = { {
            type = "unlock-recipe",
            recipe = "gun-turret"
        } },
        prerequisites = { "automation-science-pack" },
        unit = {
            count = 10,
            ingredients = { { "automation-science-pack", 1 } },
            time = 10
        }
    },
    ["research-speed-1"] = {
        type = "technology",
        name = "research-speed-1",
        icons = { {
            icon = "__base__/graphics/technology/research-speed.png",
            icon_size = 256
        }, {
            icon = "__core__/graphics/icons/technology/constants/constant-speed.png",
            icon_size = 128,
            scale = 0.5,
            shift = { 50, 50 },
            floating = true
        } },
        effects = { {
            type = "laboratory-speed",
            modifier = 0.2
        } },
        prerequisites = { "automation-2" },
        unit = {
            count = 100,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 } },
            time = 30
        },
        upgrade = true
    },
    ["research-speed-2"] = {
        type = "technology",
        name = "research-speed-2",
        icons = { {
            icon = "__base__/graphics/technology/research-speed.png",
            icon_size = 256
        }, {
            icon = "__core__/graphics/icons/technology/constants/constant-speed.png",
            icon_size = 128,
            scale = 0.5,
            shift = { 50, 50 },
            floating = true
        } },
        effects = { {
            type = "laboratory-speed",
            modifier = 0.3
        } },
        prerequisites = { "research-speed-1" },
        unit = {
            count = 200,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 } },
            time = 30
        },
        upgrade = true
    },
    ["electric-energy-distribution-1"] = {
        type = "technology",
        name = "electric-energy-distribution-1",
        icon = "__base__/graphics/technology/electric-energy-distribution-1.png",
        icon_size = 256,
        effects = { {
            type = "unlock-recipe",
            recipe = "medium-electric-pole"
        }, {
            type = "unlock-recipe",
            recipe = "big-electric-pole"
        }, {
            type = "unlock-recipe",
            recipe = "iron-stick"
        } },
        prerequisites = { "steel-processing", "logistic-science-pack" },
        unit = {
            count = 120,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 } },
            time = 30
        }
    },
    ["advanced-material-processing"] = {
        type = "technology",
        name = "advanced-material-processing",
        icon = "__base__/graphics/technology/advanced-material-processing.png",
        icon_size = 256,
        effects = { {
            type = "unlock-recipe",
            recipe = "steel-furnace"
        } },
        prerequisites = { "steel-processing", "logistic-science-pack" },
        unit = {
            count = 75,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 } },
            time = 30
        }
    },
    concrete = {
        type = "technology",
        name = "concrete",
        icon = "__base__/graphics/technology/concrete.png",
        icon_size = 256,
        prerequisites = { "advanced-material-processing", "automation-2" },
        unit = {
            count = 250,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 } },
            time = 30
        },
        effects = { {
            type = "unlock-recipe",
            recipe = "concrete"
        }, {
            type = "unlock-recipe",
            recipe = "hazard-concrete"
        }, {
            type = "unlock-recipe",
            recipe = "refined-concrete"
        }, {
            type = "unlock-recipe",
            recipe = "refined-hazard-concrete"
        }, {
            type = "unlock-recipe",
            recipe = "iron-stick"
        } }
    },
    engine = {
        type = "technology",
        name = "engine",
        icon = "__base__/graphics/technology/engine.png",
        icon_size = 256,
        prerequisites = { "steel-processing", "logistic-science-pack" },
        unit = {
            count = 100,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 } },
            time = 15
        },
        effects = { {
            type = "unlock-recipe",
            recipe = "engine-unit"
        } }
    },
    landfill = {
        type = "technology",
        name = "landfill",
        icon = "__base__/graphics/technology/landfill.png",
        icon_size = 256,
        prerequisites = { "logistic-science-pack" },
        unit = {
            count = 50,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 } },
            time = 30
        },
        effects = { {
            type = "unlock-recipe",
            recipe = "landfill"
        } }
    },
    ["logistics-2"] = {
        type = "technology",
        name = "logistics-2",
        icon = "__base__/graphics/technology/logistics-2.png",
        icon_size = 256,
        effects = { {
            type = "unlock-recipe",
            recipe = "fast-transport-belt"
        }, {
            type = "unlock-recipe",
            recipe = "fast-underground-belt"
        }, {
            type = "unlock-recipe",
            recipe = "fast-splitter"
        } },
        prerequisites = { "logistics", "logistic-science-pack" },
        unit = {
            count = 200,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 } },
            time = 30
        }
    },
    toolbelt = {
        type = "technology",
        name = "toolbelt",
        icons = { {
            icon = "__base__/graphics/technology/toolbelt.png",
            icon_size = 256
        }, {
            icon = "__core__/graphics/icons/technology/constants/constant-capacity.png",
            icon_size = 128,
            scale = 0.5,
            shift = { 50, 50 },
            floating = true
        } },
        prerequisites = { "logistic-science-pack" },
        effects = { {
            type = "character-inventory-slots-bonus",
            modifier = 10
        } },
        unit = {
            count = 100,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 } },
            time = 30
        }
    },
    ["stone-wall"] = {
        type = "technology",
        name = "stone-wall",
        icon = "__base__/graphics/technology/stone-wall.png",
        icon_size = 256,
        effects = { {
            type = "unlock-recipe",
            recipe = "stone-wall"
        } },
        prerequisites = { "automation-science-pack" },
        unit = {
            count = 10,
            ingredients = { { "automation-science-pack", 1 } },
            time = 10
        }
    },
    gate = {
        type = "technology",
        name = "gate",
        localised_description = { "technology-description.gates" },
        icon = "__base__/graphics/technology/gate.png",
        icon_size = 256,
        effects = { {
            type = "unlock-recipe",
            recipe = "gate"
        } },
        prerequisites = { "stone-wall", "military-2" },
        unit = {
            count = 100,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 } },
            time = 30
        }
    },
    ["chemical-science-pack"] = {
        type = "technology",
        name = "chemical-science-pack",
        localised_name = { "technology-name.chemical-science-pack" },
        localised_description = { "technology-description.chemical-science-pack" },
        icon = "__base__/graphics/technology/chemical-science-pack.png",
        icon_size = 256,
        essential = true,
        effects = { {
            type = "unlock-recipe",
            recipe = "chemical-science-pack"
        } },
        unit = {
            count = 75,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 } },
            time = 10
        },
        prerequisites = { "advanced-circuit", "sulfur-processing" }
    },
    ["military-science-pack"] = {
        type = "technology",
        name = "military-science-pack",
        icon = "__base__/graphics/technology/military-science-pack.png",
        icon_size = 256,
        essential = true,
        effects = { {
            type = "unlock-recipe",
            recipe = "military-science-pack"
        } },
        unit = {
            count = 30,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 } },
            time = 15
        },
        prerequisites = { "military-2", "stone-wall" }
    },
    ["production-science-pack"] = {
        type = "technology",
        name = "production-science-pack",
        icon = "__base__/graphics/technology/production-science-pack.png",
        icon_size = 256,
        essential = true,
        effects = { {
            type = "unlock-recipe",
            recipe = "production-science-pack"
        } },
        unit = {
            count = 100,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "chemical-science-pack", 1 } },
            time = 30
        },
        prerequisites = { "productivity-module", "advanced-material-processing-2", "railway" }
    },
    ["utility-science-pack"] = {
        type = "technology",
        name = "utility-science-pack",
        icon = "__base__/graphics/technology/utility-science-pack.png",
        icon_size = 256,
        essential = true,
        effects = { {
            type = "unlock-recipe",
            recipe = "utility-science-pack"
        } },
        unit = {
            count = 100,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "chemical-science-pack", 1 } },
            time = 30
        },
        prerequisites = { "robotics", "processing-unit", "low-density-structure" }
    },
    ["space-science-pack"] = {
        type = "technology",
        name = "space-science-pack",
        icon = "__base__/graphics/technology/space-science-pack.png",
        icon_size = 256,
        essential = true,
        effects = { {
            type = "unlock-recipe",
            recipe = "space-science-pack"
        } },
        research_trigger = {
            type = "build-entity",
            entity = "asteroid-collector"
        },
        prerequisites = { "space-platform" },
        localised_description = { "technology-description.space-science-pack-space-age" }
    },
    ["military-3"] = {
        type = "technology",
        name = "military-3",
        icon = "__base__/graphics/technology/military.png",
        icon_size = 256,
        effects = { {
            type = "unlock-recipe",
            recipe = "poison-capsule"
        }, {
            type = "unlock-recipe",
            recipe = "slowdown-capsule"
        }, {
            type = "unlock-recipe",
            recipe = "combat-shotgun"
        } },
        prerequisites = { "chemical-science-pack", "military-science-pack" },
        unit = {
            count = 100,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "chemical-science-pack", 1 }, { "military-science-pack", 1 } },
            time = 30
        }
    },
    ["military-4"] = {
        type = "technology",
        name = "military-4",
        icon = "__base__/graphics/technology/military.png",
        icon_size = 256,
        effects = { {
            type = "unlock-recipe",
            recipe = "piercing-shotgun-shell"
        }, {
            type = "unlock-recipe",
            recipe = "cluster-grenade"
        } },
        prerequisites = { "military-3", "utility-science-pack", "explosives" },
        unit = {
            count = 150,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "chemical-science-pack", 1 }, { "military-science-pack", 1 }, { "utility-science-pack", 1 } },
            time = 45
        }
    },
    ["uranium-ammo"] = {
        type = "technology",
        name = "uranium-ammo",
        icon = "__base__/graphics/technology/uranium-ammo.png",
        icon_size = 256,
        effects = { {
            type = "unlock-recipe",
            recipe = "uranium-rounds-magazine"
        }, {
            type = "unlock-recipe",
            recipe = "uranium-cannon-shell"
        }, {
            type = "unlock-recipe",
            recipe = "explosive-uranium-cannon-shell"
        } },
        prerequisites = { "uranium-processing", "military-4", "tank" },
        unit = {
            count = 1000,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "chemical-science-pack", 1 }, { "military-science-pack", 1 }, { "utility-science-pack", 1 } },
            time = 45
        }
    },
    ["atomic-bomb"] = {
        type = "technology",
        name = "atomic-bomb",
        icon = "__base__/graphics/technology/atomic-bomb.png",
        icon_size = 256,
        effects = { {
            type = "unlock-recipe",
            recipe = "atomic-bomb"
        } },
        prerequisites = { "military-4", "kovarex-enrichment-process", "rocketry" },
        unit = {
            count = 5000,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "chemical-science-pack", 1 }, { "military-science-pack", 1 }, { "utility-science-pack", 1 }, { "space-science-pack", 1 } },
            time = 45
        }
    },
    ["automation-3"] = {
        type = "technology",
        name = "automation-3",
        icon = "__base__/graphics/technology/automation-3.png",
        icon_size = 256,
        localised_description = { "technology-description.automation-3" },
        effects = { {
            type = "unlock-recipe",
            recipe = "assembling-machine-3"
        } },
        prerequisites = { "speed-module", "production-science-pack", "electric-engine" },
        unit = {
            count = 500,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "chemical-science-pack", 1 }, { "production-science-pack", 1 } },
            time = 60
        }
    },
    explosives = {
        type = "technology",
        name = "explosives",
        icon = "__base__/graphics/technology/explosives.png",
        icon_size = 256,
        prerequisites = { "sulfur-processing" },
        unit = {
            count = 100,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 } },
            time = 15
        },
        effects = { {
            type = "unlock-recipe",
            recipe = "explosives"
        } }
    },
    ["cliff-explosives"] = {
        type = "technology",
        name = "cliff-explosives",
        icon = "__base__/graphics/technology/cliff-explosives.png",
        icon_size = 256,
        prerequisites = { "explosives", "military-science-pack", "metallurgic-science-pack" },
        unit = {
            count = 500,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "chemical-science-pack", 1 }, { "space-science-pack", 1 }, { "metallurgic-science-pack", 1 } },
            time = 30
        },
        effects = { {
            type = "unlock-recipe",
            recipe = "cliff-explosives"
        }, {
            type = "cliff-deconstruction-enabled",
            modifier = true
        } }
    },
    flammables = {
        type = "technology",
        name = "flammables",
        icon = "__base__/graphics/technology/flammables.png",
        icon_size = 256,
        prerequisites = { "oil-processing" },
        unit = {
            count = 50,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 } },
            time = 30
        }
    },
    ["land-mine"] = {
        type = "technology",
        name = "land-mine",
        icon = "__base__/graphics/technology/land-mine.png",
        icon_size = 256,
        localised_description = { "technology-description.land-mine" },
        effects = { {
            type = "unlock-recipe",
            recipe = "land-mine"
        } },
        prerequisites = { "explosives", "military-science-pack" },
        unit = {
            count = 100,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "military-science-pack", 1 } },
            time = 30
        }
    },
    flamethrower = {
        type = "technology",
        name = "flamethrower",
        icon = "__base__/graphics/technology/flamethrower.png",
        icon_size = 256,
        effects = { {
            type = "unlock-recipe",
            recipe = "flamethrower"
        }, {
            type = "unlock-recipe",
            recipe = "flamethrower-ammo"
        }, {
            type = "unlock-recipe",
            recipe = "flamethrower-turret"
        } },
        prerequisites = { "flammables", "military-science-pack" },
        unit = {
            count = 50,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "military-science-pack", 1 } },
            time = 30
        }
    },
    ["advanced-circuit"] = {
        type = "technology",
        name = "advanced-circuit",
        icon = "__base__/graphics/technology/advanced-circuit.png",
        icon_size = 256,
        effects = { {
            type = "unlock-recipe",
            recipe = "advanced-circuit"
        } },
        prerequisites = { "plastics" },
        unit = {
            count = 200,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 } },
            time = 15
        }
    },
    ["processing-unit"] = {
        type = "technology",
        name = "processing-unit",
        icon = "__base__/graphics/technology/processing-unit.png",
        icon_size = 256,
        prerequisites = { "chemical-science-pack" },
        effects = { {
            type = "unlock-recipe",
            recipe = "processing-unit"
        } },
        unit = {
            count = 300,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "chemical-science-pack", 1 } },
            time = 30
        }
    },
    ["fluid-wagon"] = {
        type = "technology",
        name = "fluid-wagon",
        icon = "__base__/graphics/technology/fluid-wagon.png",
        icon_size = 256,
        effects = { {
            type = "unlock-recipe",
            recipe = "fluid-wagon"
        } },
        prerequisites = { "railway", "fluid-handling" },
        unit = {
            count = 200,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 } },
            time = 30
        }
    },
    ["braking-force-1"] = {
        type = "technology",
        name = "braking-force-1",
        icons = { {
            icon = "__base__/graphics/technology/braking-force.png",
            icon_size = 256
        }, {
            icon = "__core__/graphics/icons/technology/constants/constant-braking-force.png",
            icon_size = 128,
            scale = 0.5,
            shift = { 50, 50 },
            floating = true
        } },
        effects = { {
            type = "train-braking-force-bonus",
            modifier = 0.1
        } },
        prerequisites = { "railway", "chemical-science-pack" },
        unit = {
            count = 100,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "chemical-science-pack", 1 } },
            time = 30
        },
        upgrade = true
    },
    ["braking-force-2"] = {
        type = "technology",
        name = "braking-force-2",
        icons = { {
            icon = "__base__/graphics/technology/braking-force.png",
            icon_size = 256
        }, {
            icon = "__core__/graphics/icons/technology/constants/constant-braking-force.png",
            icon_size = 128,
            scale = 0.5,
            shift = { 50, 50 },
            floating = true
        } },
        effects = { {
            type = "train-braking-force-bonus",
            modifier = 0.15
        } },
        prerequisites = { "braking-force-1" },
        unit = {
            count = 200,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "chemical-science-pack", 1 } },
            time = 30
        },
        upgrade = true
    },
    ["braking-force-3"] = {
        type = "technology",
        name = "braking-force-3",
        icons = { {
            icon = "__base__/graphics/technology/braking-force.png",
            icon_size = 256
        }, {
            icon = "__core__/graphics/icons/technology/constants/constant-braking-force.png",
            icon_size = 128,
            scale = 0.5,
            shift = { 50, 50 },
            floating = true
        } },
        effects = { {
            type = "train-braking-force-bonus",
            modifier = 0.15
        } },
        prerequisites = { "braking-force-2", "production-science-pack" },
        unit = {
            count = 250,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "chemical-science-pack", 1 }, { "production-science-pack", 1 } },
            time = 30
        },
        upgrade = true
    },
    ["braking-force-4"] = {
        type = "technology",
        name = "braking-force-4",
        icons = { {
            icon = "__base__/graphics/technology/braking-force.png",
            icon_size = 256
        }, {
            icon = "__core__/graphics/icons/technology/constants/constant-braking-force.png",
            icon_size = 128,
            scale = 0.5,
            shift = { 50, 50 },
            floating = true
        } },
        effects = { {
            type = "train-braking-force-bonus",
            modifier = 0.15
        } },
        prerequisites = { "braking-force-3" },
        unit = {
            count = 350,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "chemical-science-pack", 1 }, { "production-science-pack", 1 } },
            time = 30
        },
        upgrade = true
    },
    ["braking-force-5"] = {
        type = "technology",
        name = "braking-force-5",
        icons = { {
            icon = "__base__/graphics/technology/braking-force.png",
            icon_size = 256
        }, {
            icon = "__core__/graphics/icons/technology/constants/constant-braking-force.png",
            icon_size = 128,
            scale = 0.5,
            shift = { 50, 50 },
            floating = true
        } },
        effects = { {
            type = "train-braking-force-bonus",
            modifier = 0.15
        } },
        prerequisites = { "braking-force-4" },
        unit = {
            count = 450,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "chemical-science-pack", 1 }, { "production-science-pack", 1 } },
            time = 35
        },
        upgrade = true
    },
    ["braking-force-6"] = {
        type = "technology",
        name = "braking-force-6",
        icons = { {
            icon = "__base__/graphics/technology/braking-force.png",
            icon_size = 256
        }, {
            icon = "__core__/graphics/icons/technology/constants/constant-braking-force.png",
            icon_size = 128,
            scale = 0.5,
            shift = { 50, 50 },
            floating = true
        } },
        effects = { {
            type = "train-braking-force-bonus",
            modifier = 0.15
        } },
        prerequisites = { "braking-force-5", "utility-science-pack" },
        unit = {
            count = 550,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "chemical-science-pack", 1 }, { "production-science-pack", 1 }, { "utility-science-pack", 1 } },
            time = 45
        },
        upgrade = true
    },
    ["braking-force-7"] = {
        type = "technology",
        name = "braking-force-7",
        icons = { {
            icon = "__base__/graphics/technology/braking-force.png",
            icon_size = 256
        }, {
            icon = "__core__/graphics/icons/technology/constants/constant-braking-force.png",
            icon_size = 128,
            scale = 0.5,
            shift = { 50, 50 },
            floating = true
        } },
        effects = { {
            type = "train-braking-force-bonus",
            modifier = 0.15
        } },
        prerequisites = { "braking-force-6" },
        unit = {
            count = 650,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "chemical-science-pack", 1 }, { "production-science-pack", 1 }, { "utility-science-pack", 1 } },
            time = 60
        },
        upgrade = true
    },
    tank = {
        type = "technology",
        name = "tank",
        icon = "__base__/graphics/technology/tank.png",
        icon_size = 256,
        effects = { {
            type = "unlock-recipe",
            recipe = "tank"
        }, {
            type = "unlock-recipe",
            recipe = "cannon-shell"
        }, {
            type = "unlock-recipe",
            recipe = "explosive-cannon-shell"
        } },
        prerequisites = { "automobilism", "military-3", "explosives" },
        unit = {
            count = 250,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "chemical-science-pack", 1 }, { "military-science-pack", 1 } },
            time = 30
        }
    },
    ["logistics-3"] = {
        type = "technology",
        name = "logistics-3",
        icon = "__base__/graphics/technology/logistics-3.png",
        icon_size = 256,
        effects = { {
            type = "unlock-recipe",
            recipe = "express-transport-belt"
        }, {
            type = "unlock-recipe",
            recipe = "express-underground-belt"
        }, {
            type = "unlock-recipe",
            recipe = "express-splitter"
        } },
        prerequisites = { "production-science-pack", "lubricant" },
        unit = {
            count = 300,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "chemical-science-pack", 1 }, { "production-science-pack", 1 } },
            time = 15
        }
    },
    laser = {
        type = "technology",
        name = "laser",
        icon = "__base__/graphics/technology/laser.png",
        icon_size = 256,
        prerequisites = { "battery", "chemical-science-pack" },
        unit = {
            count = 100,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "chemical-science-pack", 1 } },
            time = 30
        }
    },
    rocketry = {
        type = "technology",
        name = "rocketry",
        icon = "__base__/graphics/technology/rocketry.png",
        icon_size = 256,
        effects = { {
            type = "unlock-recipe",
            recipe = "rocket-launcher"
        }, {
            type = "unlock-recipe",
            recipe = "rocket"
        } },
        prerequisites = { "explosives", "flammables", "military-science-pack" },
        unit = {
            count = 120,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "military-science-pack", 1 } },
            time = 15
        }
    },
    ["explosive-rocketry"] = {
        type = "technology",
        name = "explosive-rocketry",
        icon = "__base__/graphics/technology/explosive-rocketry.png",
        icon_size = 256,
        effects = { {
            type = "unlock-recipe",
            recipe = "explosive-rocket"
        } },
        prerequisites = { "rocketry", "military-3" },
        unit = {
            count = 100,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "chemical-science-pack", 1 }, { "military-science-pack", 1 } },
            time = 30
        }
    },
    ["modular-armor"] = {
        type = "technology",
        name = "modular-armor",
        icon = "__base__/graphics/technology/armor-making.png",
        icon_size = 256,
        effects = { {
            type = "unlock-recipe",
            recipe = "modular-armor"
        } },
        prerequisites = { "heavy-armor", "advanced-circuit" },
        unit = {
            count = 100,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 } },
            time = 30
        }
    },
    ["power-armor"] = {
        type = "technology",
        name = "power-armor",
        icon = "__base__/graphics/technology/power-armor.png",
        icon_size = 256,
        effects = { {
            type = "unlock-recipe",
            recipe = "power-armor"
        } },
        prerequisites = { "modular-armor", "electric-engine", "processing-unit" },
        unit = {
            count = 200,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "chemical-science-pack", 1 } },
            time = 30
        }
    },
    ["power-armor-mk2"] = {
        type = "technology",
        name = "power-armor-mk2",
        icon = "__base__/graphics/technology/power-armor-mk2.png",
        icon_size = 256,
        effects = { {
            type = "unlock-recipe",
            recipe = "power-armor-mk2"
        } },
        prerequisites = { "power-armor", "military-4", "speed-module", "efficiency-module" },
        unit = {
            count = 400,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "chemical-science-pack", 1 }, { "military-science-pack", 1 }, { "utility-science-pack", 1 } },
            time = 30
        }
    },
    ["laser-turret"] = {
        type = "technology",
        name = "laser-turret",
        icon = "__base__/graphics/technology/laser-turret.png",
        icon_size = 256,
        effects = { {
            type = "unlock-recipe",
            recipe = "laser-turret"
        } },
        prerequisites = { "laser", "military-science-pack" },
        unit = {
            count = 150,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "military-science-pack", 1 }, { "chemical-science-pack", 1 } },
            time = 30
        }
    },
    robotics = {
        type = "technology",
        name = "robotics",
        icon = "__base__/graphics/technology/robotics.png",
        icon_size = 256,
        prerequisites = { "electric-engine", "battery" },
        unit = {
            count = 75,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "chemical-science-pack", 1 } },
            time = 30
        },
        effects = { {
            type = "unlock-recipe",
            recipe = "flying-robot-frame"
        } }
    },
    ["rocket-fuel"] = {
        type = "technology",
        name = "rocket-fuel",
        icon = "__base__/graphics/technology/rocket-fuel.png",
        icon_size = 256,
        effects = { {
            type = "unlock-recipe",
            recipe = "rocket-fuel"
        } },
        prerequisites = { "flammables", "advanced-oil-processing" },
        unit = {
            count = 300,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "chemical-science-pack", 1 } },
            time = 45
        }
    },
    ["low-density-structure"] = {
        type = "technology",
        name = "low-density-structure",
        icon = "__base__/graphics/technology/low-density-structure.png",
        icon_size = 256,
        effects = { {
            type = "unlock-recipe",
            recipe = "low-density-structure"
        } },
        prerequisites = { "advanced-material-processing", "chemical-science-pack" },
        unit = {
            count = 300,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "chemical-science-pack", 1 } },
            time = 45
        }
    },
    ["rocket-silo"] = {
        type = "technology",
        name = "rocket-silo",
        icon = "__base__/graphics/technology/rocket-silo.png",
        icon_size = 256,
        essential = true,
        effects = { {
            type = "unlock-recipe",
            recipe = "rocket-silo"
        }, {
            type = "unlock-recipe",
            recipe = "rocket-part"
        }, {
            type = "unlock-recipe",
            recipe = "cargo-landing-pad"
        }, {
            type = "unlock-space-platforms",
            modifier = true,
            hidden = true
        }, {
            type = "unlock-recipe",
            recipe = "space-platform-starter-pack"
        }, {
            type = "unlock-recipe",
            recipe = "space-platform-foundation"
        } },
        prerequisites = { "concrete", "rocket-fuel", "processing-unit", "logistic-robotics", "low-density-structure", "advanced-material-processing-2" },
        unit = {
            count = 1000,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "chemical-science-pack", 1 } },
            time = 60
        }
    },
    ["research-speed-3"] = {
        type = "technology",
        name = "research-speed-3",
        icons = { {
            icon = "__base__/graphics/technology/research-speed.png",
            icon_size = 256
        }, {
            icon = "__core__/graphics/icons/technology/constants/constant-speed.png",
            icon_size = 128,
            scale = 0.5,
            shift = { 50, 50 },
            floating = true
        } },
        effects = { {
            type = "laboratory-speed",
            modifier = 0.4
        } },
        prerequisites = { "research-speed-2", "chemical-science-pack" },
        unit = {
            count = 250,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "chemical-science-pack", 1 } },
            time = 30
        },
        upgrade = true
    },
    ["research-speed-4"] = {
        type = "technology",
        name = "research-speed-4",
        icons = { {
            icon = "__base__/graphics/technology/research-speed.png",
            icon_size = 256
        }, {
            icon = "__core__/graphics/icons/technology/constants/constant-speed.png",
            icon_size = 128,
            scale = 0.5,
            shift = { 50, 50 },
            floating = true
        } },
        effects = { {
            type = "laboratory-speed",
            modifier = 0.5
        } },
        prerequisites = { "research-speed-3" },
        unit = {
            count = 500,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "chemical-science-pack", 1 } },
            time = 30
        },
        upgrade = true
    },
    ["research-speed-5"] = {
        type = "technology",
        name = "research-speed-5",
        icons = { {
            icon = "__base__/graphics/technology/research-speed.png",
            icon_size = 256
        }, {
            icon = "__core__/graphics/icons/technology/constants/constant-speed.png",
            icon_size = 128,
            scale = 0.5,
            shift = { 50, 50 },
            floating = true
        } },
        effects = { {
            type = "laboratory-speed",
            modifier = 0.5
        } },
        prerequisites = { "research-speed-4", "production-science-pack" },
        unit = {
            count = 500,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "chemical-science-pack", 1 }, { "production-science-pack", 1 } },
            time = 30
        },
        upgrade = true
    },
    ["research-speed-6"] = {
        type = "technology",
        name = "research-speed-6",
        icons = { {
            icon = "__base__/graphics/technology/research-speed.png",
            icon_size = 256
        }, {
            icon = "__core__/graphics/icons/technology/constants/constant-speed.png",
            icon_size = 128,
            scale = 0.5,
            shift = { 50, 50 },
            floating = true
        } },
        effects = { {
            type = "laboratory-speed",
            modifier = 0.6
        } },
        prerequisites = { "research-speed-5", "utility-science-pack" },
        unit = {
            count = 500,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "chemical-science-pack", 1 }, { "production-science-pack", 1 }, { "utility-science-pack", 1 } },
            time = 30
        },
        upgrade = true
    },
    ["electric-energy-distribution-2"] = {
        type = "technology",
        name = "electric-energy-distribution-2",
        icon = "__base__/graphics/technology/electric-energy-distribution-2.png",
        icon_size = 256,
        effects = { {
            type = "unlock-recipe",
            recipe = "substation"
        } },
        prerequisites = { "electric-energy-distribution-1", "chemical-science-pack" },
        unit = {
            count = 100,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "chemical-science-pack", 1 } },
            time = 45
        }
    },
    ["electric-energy-accumulators"] = {
        type = "technology",
        name = "electric-energy-accumulators",
        icon = "__base__/graphics/technology/electric-energy-acumulators.png",
        icon_size = 256,
        localised_name = { "technology-name.electric-energy-accumulators-1" },
        effects = { {
            type = "unlock-recipe",
            recipe = "accumulator"
        } },
        prerequisites = { "electric-energy-distribution-1", "battery" },
        unit = {
            count = 150,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 } },
            time = 30
        }
    },
    ["advanced-material-processing-2"] = {
        type = "technology",
        name = "advanced-material-processing-2",
        icon = "__base__/graphics/technology/advanced-material-processing-2.png",
        icon_size = 256,
        effects = { {
            type = "unlock-recipe",
            recipe = "electric-furnace"
        } },
        prerequisites = { "advanced-material-processing", "chemical-science-pack" },
        unit = {
            count = 250,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "chemical-science-pack", 1 } },
            time = 30
        }
    },
    ["effect-transmission"] = {
        type = "technology",
        name = "effect-transmission",
        icon = "__base__/graphics/technology/effect-transmission.png",
        icon_size = 256,
        effects = { {
            type = "unlock-recipe",
            recipe = "beacon"
        } },
        prerequisites = { "processing-unit", "production-science-pack" },
        unit = {
            count = 75,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "chemical-science-pack", 1 }, { "production-science-pack", 1 } },
            time = 30
        }
    },
    lubricant = {
        type = "technology",
        name = "lubricant",
        icon = "__base__/graphics/technology/lubricant.png",
        icon_size = 256,
        prerequisites = { "advanced-oil-processing" },
        unit = {
            count = 50,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "chemical-science-pack", 1 } },
            time = 30
        },
        effects = { {
            type = "unlock-recipe",
            recipe = "lubricant"
        } }
    },
    ["electric-engine"] = {
        type = "technology",
        name = "electric-engine",
        icon = "__base__/graphics/technology/electric-engine.png",
        icon_size = 256,
        prerequisites = { "lubricant" },
        unit = {
            count = 50,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "chemical-science-pack", 1 } },
            time = 30
        },
        effects = { {
            type = "unlock-recipe",
            recipe = "electric-engine-unit"
        } }
    },
    battery = {
        type = "technology",
        name = "battery",
        icon = "__base__/graphics/technology/battery.png",
        icon_size = 256,
        prerequisites = { "sulfur-processing" },
        unit = {
            count = 150,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 } },
            time = 30
        },
        effects = { {
            type = "unlock-recipe",
            recipe = "battery"
        } }
    },
    ["construction-robotics"] = {
        type = "technology",
        name = "construction-robotics",
        icon = "__base__/graphics/technology/construction-robotics.png",
        icon_size = 256,
        effects = { {
            type = "unlock-recipe",
            recipe = "roboport"
        }, {
            type = "unlock-recipe",
            recipe = "passive-provider-chest"
        }, {
            type = "unlock-recipe",
            recipe = "storage-chest"
        }, {
            type = "unlock-recipe",
            recipe = "construction-robot"
        }, {
            type = "create-ghost-on-entity-death",
            modifier = true
        } },
        prerequisites = { "robotics" },
        unit = {
            count = 100,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "chemical-science-pack", 1 } },
            time = 30
        }
    },
    ["logistic-robotics"] = {
        type = "technology",
        name = "logistic-robotics",
        icon = "__base__/graphics/technology/logistic-robotics.png",
        icon_size = 256,
        effects = { {
            type = "unlock-recipe",
            recipe = "roboport"
        }, {
            type = "unlock-recipe",
            recipe = "passive-provider-chest"
        }, {
            type = "unlock-recipe",
            recipe = "storage-chest"
        }, {
            type = "unlock-recipe",
            recipe = "logistic-robot"
        }, {
            type = "character-logistic-requests",
            modifier = true
        }, {
            type = "character-logistic-trash-slots",
            modifier = 30
        } },
        prerequisites = { "robotics" },
        unit = {
            count = 250,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "chemical-science-pack", 1 } },
            time = 30
        }
    },
    ["logistic-system"] = {
        type = "technology",
        name = "logistic-system",
        icon = "__base__/graphics/technology/logistic-system.png",
        icon_size = 256,
        effects = { {
            type = "unlock-recipe",
            recipe = "active-provider-chest"
        }, {
            type = "unlock-recipe",
            recipe = "requester-chest"
        }, {
            type = "unlock-recipe",
            recipe = "buffer-chest"
        }, {
            type = "vehicle-logistics",
            modifier = true
        } },
        prerequisites = { "space-science-pack" },
        unit = {
            count = 500,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "chemical-science-pack", 1 }, { "space-science-pack", 1 } },
            time = 30
        }
    },
    ["worker-robots-speed-1"] = {
        type = "technology",
        name = "worker-robots-speed-1",
        icons = { {
            icon = "__base__/graphics/technology/worker-robots-speed.png",
            icon_size = 256
        }, {
            icon = "__core__/graphics/icons/technology/constants/constant-movement-speed.png",
            icon_size = 128,
            scale = 0.5,
            shift = { 50, 50 },
            floating = true
        } },
        effects = { {
            type = "worker-robot-speed",
            modifier = 0.35
        } },
        prerequisites = { "robotics" },
        unit = {
            count = 50,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "chemical-science-pack", 1 } },
            time = 30
        },
        upgrade = true
    },
    ["worker-robots-speed-2"] = {
        type = "technology",
        name = "worker-robots-speed-2",
        icons = { {
            icon = "__base__/graphics/technology/worker-robots-speed.png",
            icon_size = 256
        }, {
            icon = "__core__/graphics/icons/technology/constants/constant-movement-speed.png",
            icon_size = 128,
            scale = 0.5,
            shift = { 50, 50 },
            floating = true
        } },
        effects = { {
            type = "worker-robot-speed",
            modifier = 0.4
        } },
        prerequisites = { "worker-robots-speed-1" },
        unit = {
            count = 100,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "chemical-science-pack", 1 } },
            time = 30
        },
        upgrade = true
    },
    ["worker-robots-speed-3"] = {
        type = "technology",
        name = "worker-robots-speed-3",
        icons = { {
            icon = "__base__/graphics/technology/worker-robots-speed.png",
            icon_size = 256
        }, {
            icon = "__core__/graphics/icons/technology/constants/constant-movement-speed.png",
            icon_size = 128,
            scale = 0.5,
            shift = { 50, 50 },
            floating = true
        } },
        effects = { {
            type = "worker-robot-speed",
            modifier = 0.45
        } },
        prerequisites = { "worker-robots-speed-2", "utility-science-pack" },
        unit = {
            count = 150,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "chemical-science-pack", 1 }, { "utility-science-pack", 1 } },
            time = 60
        },
        upgrade = true
    },
    ["worker-robots-speed-4"] = {
        type = "technology",
        name = "worker-robots-speed-4",
        icons = { {
            icon = "__base__/graphics/technology/worker-robots-speed.png",
            icon_size = 256
        }, {
            icon = "__core__/graphics/icons/technology/constants/constant-movement-speed.png",
            icon_size = 128,
            scale = 0.5,
            shift = { 50, 50 },
            floating = true
        } },
        effects = { {
            type = "worker-robot-speed",
            modifier = 0.55
        } },
        prerequisites = { "worker-robots-speed-3" },
        unit = {
            count = 250,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "chemical-science-pack", 1 }, { "utility-science-pack", 1 } },
            time = 60
        },
        upgrade = true
    },
    ["worker-robots-speed-5"] = {
        type = "technology",
        name = "worker-robots-speed-5",
        icons = { {
            icon = "__base__/graphics/technology/worker-robots-speed.png",
            icon_size = 256
        }, {
            icon = "__core__/graphics/icons/technology/constants/constant-movement-speed.png",
            icon_size = 128,
            scale = 0.5,
            shift = { 50, 50 },
            floating = true
        } },
        effects = { {
            type = "worker-robot-speed",
            modifier = 0.65
        } },
        prerequisites = { "worker-robots-speed-4", "production-science-pack" },
        unit = {
            count = 500,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "chemical-science-pack", 1 }, { "production-science-pack", 1 }, { "utility-science-pack", 1 } },
            time = 60
        },
        upgrade = true
    },
    ["worker-robots-speed-6"] = {
        type = "technology",
        name = "worker-robots-speed-6",
        icons = { {
            icon = "__base__/graphics/technology/worker-robots-speed.png",
            icon_size = 256
        }, {
            icon = "__core__/graphics/icons/technology/constants/constant-movement-speed.png",
            icon_size = 128,
            scale = 0.5,
            shift = { 50, 50 },
            floating = true
        } },
        effects = { {
            type = "worker-robot-speed",
            modifier = 0.65
        } },
        prerequisites = { "worker-robots-speed-5", "space-science-pack" },
        unit = {
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "chemical-science-pack", 1 }, { "production-science-pack", 1 }, { "utility-science-pack", 1 }, { "space-science-pack", 1 } },
            time = 60,
            count = 1000
        },
        upgrade = true,
        order = "c-k-f-f"
    },
    ["worker-robots-storage-1"] = {
        type = "technology",
        name = "worker-robots-storage-1",
        icons = { {
            icon = "__base__/graphics/technology/worker-robots-storage.png",
            icon_size = 256
        }, {
            icon = "__core__/graphics/icons/technology/constants/constant-capacity.png",
            icon_size = 128,
            scale = 0.5,
            shift = { 50, 50 },
            floating = true
        } },
        effects = { {
            type = "worker-robot-storage",
            modifier = 1
        } },
        prerequisites = { "robotics" },
        unit = {
            count = 200,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "chemical-science-pack", 1 } },
            time = 30
        },
        upgrade = true
    },
    ["worker-robots-storage-2"] = {
        type = "technology",
        name = "worker-robots-storage-2",
        icons = { {
            icon = "__base__/graphics/technology/worker-robots-storage.png",
            icon_size = 256
        }, {
            icon = "__core__/graphics/icons/technology/constants/constant-capacity.png",
            icon_size = 128,
            scale = 0.5,
            shift = { 50, 50 },
            floating = true
        } },
        effects = { {
            type = "worker-robot-storage",
            modifier = 1
        } },
        prerequisites = { "worker-robots-storage-1", "production-science-pack" },
        unit = {
            count = 300,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "chemical-science-pack", 1 }, { "production-science-pack", 1 } },
            time = 60
        },
        upgrade = true
    },
    ["worker-robots-storage-3"] = {
        type = "technology",
        name = "worker-robots-storage-3",
        icons = { {
            icon = "__base__/graphics/technology/worker-robots-storage.png",
            icon_size = 256
        }, {
            icon = "__core__/graphics/icons/technology/constants/constant-capacity.png",
            icon_size = 128,
            scale = 0.5,
            shift = { 50, 50 },
            floating = true
        } },
        effects = { {
            type = "worker-robot-storage",
            modifier = 1
        } },
        prerequisites = { "worker-robots-storage-2", "utility-science-pack" },
        unit = {
            count = 450,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "chemical-science-pack", 1 }, { "production-science-pack", 1 }, { "utility-science-pack", 1 } },
            time = 60
        },
        upgrade = true
    },
    ["energy-shield-equipment"] = {
        type = "technology",
        name = "energy-shield-equipment",
        icons = { {
            icon = "__base__/graphics/technology/energy-shield-equipment.png",
            icon_size = 256
        }, {
            icon = "__core__/graphics/icons/technology/constants/constant-equipment.png",
            icon_size = 128,
            scale = 0.5,
            shift = { 50, 50 },
            floating = true
        } },
        prerequisites = { "solar-panel-equipment", "military-science-pack" },
        effects = { {
            type = "unlock-recipe",
            recipe = "energy-shield-equipment"
        } },
        unit = {
            count = 150,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "military-science-pack", 1 } },
            time = 15
        }
    },
    ["night-vision-equipment"] = {
        type = "technology",
        name = "night-vision-equipment",
        icons = { {
            icon = "__base__/graphics/technology/night-vision-equipment.png",
            icon_size = 256
        }, {
            icon = "__core__/graphics/icons/technology/constants/constant-equipment.png",
            icon_size = 128,
            scale = 0.5,
            shift = { 50, 50 },
            floating = true
        } },
        prerequisites = { "solar-panel-equipment" },
        effects = { {
            type = "unlock-recipe",
            recipe = "night-vision-equipment"
        } },
        unit = {
            count = 50,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 } },
            time = 15
        }
    },
    ["belt-immunity-equipment"] = {
        type = "technology",
        name = "belt-immunity-equipment",
        icons = { {
            icon = "__base__/graphics/technology/belt-immunity-equipment.png",
            icon_size = 256
        }, {
            icon = "__core__/graphics/icons/technology/constants/constant-equipment.png",
            icon_size = 128,
            scale = 0.5,
            shift = { 50, 50 },
            floating = true
        } },
        prerequisites = { "solar-panel-equipment" },
        effects = { {
            type = "unlock-recipe",
            recipe = "belt-immunity-equipment"
        } },
        unit = {
            count = 50,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 } },
            time = 15
        }
    },
    ["energy-shield-mk2-equipment"] = {
        type = "technology",
        name = "energy-shield-mk2-equipment",
        icons = { {
            icon = "__base__/graphics/technology/energy-shield-mk2-equipment.png",
            icon_size = 256
        }, {
            icon = "__core__/graphics/icons/technology/constants/constant-equipment.png",
            icon_size = 128,
            scale = 0.5,
            shift = { 50, 50 },
            floating = true
        } },
        prerequisites = { "energy-shield-equipment", "military-4", "electromagnetic-science-pack", "power-armor" },
        effects = { {
            type = "unlock-recipe",
            recipe = "energy-shield-mk2-equipment"
        } },
        unit = {
            count = 750,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "chemical-science-pack", 1 }, { "military-science-pack", 1 }, { "space-science-pack", 1 }, { "utility-science-pack", 1 }, { "electromagnetic-science-pack", 1 } },
            time = 30
        }
    },
    ["battery-equipment"] = {
        type = "technology",
        name = "battery-equipment",
        icons = { {
            icon = "__base__/graphics/technology/battery-equipment.png",
            icon_size = 256
        }, {
            icon = "__core__/graphics/icons/technology/constants/constant-equipment.png",
            icon_size = 128,
            scale = 0.5,
            shift = { 50, 50 },
            floating = true
        } },
        prerequisites = { "battery", "solar-panel-equipment" },
        effects = { {
            type = "unlock-recipe",
            recipe = "battery-equipment"
        } },
        unit = {
            count = 50,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 } },
            time = 15
        }
    },
    ["battery-mk2-equipment"] = {
        type = "technology",
        name = "battery-mk2-equipment",
        icons = { {
            icon = "__base__/graphics/technology/battery-mk2-equipment.png",
            icon_size = 256
        }, {
            icon = "__core__/graphics/icons/technology/constants/constant-equipment.png",
            icon_size = 128,
            scale = 0.5,
            shift = { 50, 50 },
            floating = true
        } },
        prerequisites = { "battery-equipment", "power-armor", "utility-science-pack" },
        effects = { {
            type = "unlock-recipe",
            recipe = "battery-mk2-equipment"
        } },
        unit = {
            count = 100,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "chemical-science-pack", 1 }, { "utility-science-pack", 1 } },
            time = 30
        }
    },
    ["solar-panel-equipment"] = {
        type = "technology",
        name = "solar-panel-equipment",
        icons = { {
            icon = "__base__/graphics/technology/solar-panel-equipment.png",
            icon_size = 256
        }, {
            icon = "__core__/graphics/icons/technology/constants/constant-equipment.png",
            icon_size = 128,
            scale = 0.5,
            shift = { 50, 50 },
            floating = true
        } },
        prerequisites = { "modular-armor", "solar-energy" },
        effects = { {
            type = "unlock-recipe",
            recipe = "solar-panel-equipment"
        } },
        unit = {
            count = 100,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 } },
            time = 15
        }
    },
    ["personal-laser-defense-equipment"] = {
        type = "technology",
        name = "personal-laser-defense-equipment",
        icons = { {
            icon = "__base__/graphics/technology/personal-laser-defense-equipment.png",
            icon_size = 256
        }, {
            icon = "__core__/graphics/icons/technology/constants/constant-equipment.png",
            icon_size = 128,
            scale = 0.5,
            shift = { 50, 50 },
            floating = true
        } },
        prerequisites = { "laser-turret", "military-3", "low-density-structure", "power-armor", "solar-panel-equipment" },
        effects = { {
            type = "unlock-recipe",
            recipe = "personal-laser-defense-equipment"
        } },
        unit = {
            count = 100,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "chemical-science-pack", 1 }, { "military-science-pack", 1 } },
            time = 30
        }
    },
    ["discharge-defense-equipment"] = {
        type = "technology",
        name = "discharge-defense-equipment",
        icons = { {
            icon = "__base__/graphics/technology/discharge-defense-equipment.png",
            icon_size = 256
        }, {
            icon = "__core__/graphics/icons/technology/constants/constant-equipment.png",
            icon_size = 128,
            scale = 0.5,
            shift = { 50, 50 },
            floating = true
        } },
        prerequisites = { "laser-turret", "military-3", "power-armor", "solar-panel-equipment" },
        effects = { {
            type = "unlock-recipe",
            recipe = "discharge-defense-equipment"
        } },
        unit = {
            count = 100,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "chemical-science-pack", 1 }, { "military-science-pack", 1 } },
            time = 30
        }
    },
    ["fission-reactor-equipment"] = {
        type = "technology",
        name = "fission-reactor-equipment",
        icons = { {
            icon = "__base__/graphics/technology/fission-reactor-equipment.png",
            icon_size = 256
        }, {
            icon = "__core__/graphics/icons/technology/constants/constant-equipment.png",
            icon_size = 128,
            scale = 0.5,
            shift = { 50, 50 },
            floating = true
        } },
        prerequisites = { "utility-science-pack", "power-armor", "military-science-pack", "nuclear-power" },
        effects = { {
            type = "unlock-recipe",
            recipe = "fission-reactor-equipment"
        } },
        unit = {
            count = 200,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "chemical-science-pack", 1 }, { "military-science-pack", 1 }, { "utility-science-pack", 1 } },
            time = 30
        }
    },
    ["exoskeleton-equipment"] = {
        type = "technology",
        name = "exoskeleton-equipment",
        icons = { {
            icon = "__base__/graphics/technology/exoskeleton-equipment.png",
            icon_size = 256
        }, {
            icon = "__core__/graphics/icons/technology/constants/constant-equipment.png",
            icon_size = 128,
            scale = 0.5,
            shift = { 50, 50 },
            floating = true
        } },
        prerequisites = { "processing-unit", "electric-engine", "solar-panel-equipment" },
        effects = { {
            type = "unlock-recipe",
            recipe = "exoskeleton-equipment"
        } },
        unit = {
            count = 50,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "chemical-science-pack", 1 } },
            time = 30
        }
    },
    ["personal-roboport-equipment"] = {
        type = "technology",
        name = "personal-roboport-equipment",
        icons = { {
            icon = "__base__/graphics/technology/personal-roboport-equipment.png",
            icon_size = 256
        }, {
            icon = "__core__/graphics/icons/technology/constants/constant-equipment.png",
            icon_size = 128,
            scale = 0.5,
            shift = { 50, 50 },
            floating = true
        } },
        effects = { {
            type = "unlock-recipe",
            recipe = "personal-roboport-equipment"
        } },
        prerequisites = { "construction-robotics", "solar-panel-equipment" },
        unit = {
            count = 50,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "chemical-science-pack", 1 } },
            time = 30
        }
    },
    ["personal-roboport-mk2-equipment"] = {
        type = "technology",
        name = "personal-roboport-mk2-equipment",
        icons = { {
            icon = "__base__/graphics/technology/personal-roboport-mk2-equipment.png",
            icon_size = 256
        }, {
            icon = "__core__/graphics/icons/technology/constants/constant-equipment.png",
            icon_size = 128,
            scale = 0.5,
            shift = { 50, 50 },
            floating = true
        } },
        effects = { {
            type = "unlock-recipe",
            recipe = "personal-roboport-mk2-equipment"
        } },
        prerequisites = { "personal-roboport-equipment", "electromagnetic-science-pack", "utility-science-pack" },
        unit = {
            count = 750,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "chemical-science-pack", 1 }, { "utility-science-pack", 1 }, { "space-science-pack", 1 }, { "electromagnetic-science-pack", 1 } },
            time = 30
        }
    },
    ["fluid-handling"] = {
        type = "technology",
        name = "fluid-handling",
        icon = "__base__/graphics/technology/fluid-handling.png",
        icon_size = 256,
        prerequisites = { "automation-2", "engine" },
        effects = { {
            type = "unlock-recipe",
            recipe = "storage-tank"
        }, {
            type = "unlock-recipe",
            recipe = "pump"
        }, {
            type = "unlock-recipe",
            recipe = "barrel"
        }, {
            type = "unlock-recipe",
            recipe = "water-barrel"
        }, {
            type = "unlock-recipe",
            recipe = "empty-water-barrel"
        }, {
            type = "unlock-recipe",
            recipe = "sulfuric-acid-barrel"
        }, {
            type = "unlock-recipe",
            recipe = "empty-sulfuric-acid-barrel"
        }, {
            type = "unlock-recipe",
            recipe = "crude-oil-barrel"
        }, {
            type = "unlock-recipe",
            recipe = "empty-crude-oil-barrel"
        }, {
            type = "unlock-recipe",
            recipe = "heavy-oil-barrel"
        }, {
            type = "unlock-recipe",
            recipe = "empty-heavy-oil-barrel"
        }, {
            type = "unlock-recipe",
            recipe = "light-oil-barrel"
        }, {
            type = "unlock-recipe",
            recipe = "empty-light-oil-barrel"
        }, {
            type = "unlock-recipe",
            recipe = "petroleum-gas-barrel"
        }, {
            type = "unlock-recipe",
            recipe = "empty-petroleum-gas-barrel"
        }, {
            type = "unlock-recipe",
            recipe = "lubricant-barrel"
        }, {
            type = "unlock-recipe",
            recipe = "empty-lubricant-barrel"
        }, {
            type = "unlock-recipe",
            recipe = "fluoroketone-cold-barrel"
        }, {
            type = "unlock-recipe",
            recipe = "empty-fluoroketone-cold-barrel"
        }, {
            type = "unlock-recipe",
            recipe = "fluoroketone-hot-barrel"
        }, {
            type = "unlock-recipe",
            recipe = "empty-fluoroketone-hot-barrel"
        } },
        unit = {
            count = 50,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 } },
            time = 15
        }
    },
    ["oil-gathering"] = {
        type = "technology",
        name = "oil-gathering",
        icon = "__base__/graphics/technology/oil-gathering.png",
        icon_size = 256,
        prerequisites = { "fluid-handling" },
        effects = { {
            type = "unlock-recipe",
            recipe = "pumpjack"
        } },
        unit = {
            count = 100,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 } },
            time = 30
        }
    },
    ["oil-processing"] = {
        type = "technology",
        name = "oil-processing",
        icon = "__base__/graphics/technology/oil-processing.png",
        icon_size = 256,
        prerequisites = { "oil-gathering" },
        effects = { {
            type = "unlock-recipe",
            recipe = "oil-refinery"
        }, {
            type = "unlock-recipe",
            recipe = "chemical-plant"
        }, {
            type = "unlock-recipe",
            recipe = "basic-oil-processing"
        }, {
            type = "unlock-recipe",
            recipe = "solid-fuel-from-petroleum-gas"
        } },
        research_trigger = {
            type = "mine-entity",
            entity = "crude-oil"
        }
    },
    ["advanced-oil-processing"] = {
        type = "technology",
        name = "advanced-oil-processing",
        icon = "__base__/graphics/technology/advanced-oil-processing.png",
        icon_size = 256,
        prerequisites = { "chemical-science-pack" },
        effects = { {
            type = "unlock-recipe",
            recipe = "advanced-oil-processing"
        }, {
            type = "unlock-recipe",
            recipe = "heavy-oil-cracking"
        }, {
            type = "unlock-recipe",
            recipe = "light-oil-cracking"
        }, {
            type = "unlock-recipe",
            recipe = "solid-fuel-from-heavy-oil"
        }, {
            type = "unlock-recipe",
            recipe = "solid-fuel-from-light-oil"
        } },
        unit = {
            count = 75,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "chemical-science-pack", 1 } },
            time = 30
        }
    },
    ["coal-liquefaction"] = {
        type = "technology",
        name = "coal-liquefaction",
        icon = "__base__/graphics/technology/coal-liquefaction.png",
        icon_size = 256,
        prerequisites = { "metallurgic-science-pack" },
        effects = { {
            type = "unlock-recipe",
            recipe = "coal-liquefaction"
        } },
        unit = {
            count = 500,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "chemical-science-pack", 1 }, { "space-science-pack", 1 }, { "metallurgic-science-pack", 1 } },
            time = 30
        }
    },
    ["sulfur-processing"] = {
        type = "technology",
        name = "sulfur-processing",
        icon = "__base__/graphics/technology/sulfur-processing.png",
        icon_size = 256,
        prerequisites = { "oil-processing" },
        effects = { {
            type = "unlock-recipe",
            recipe = "sulfuric-acid"
        }, {
            type = "unlock-recipe",
            recipe = "sulfur"
        } },
        unit = {
            count = 150,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 } },
            time = 30
        }
    },
    plastics = {
        type = "technology",
        name = "plastics",
        icon = "__base__/graphics/technology/plastics.png",
        icon_size = 256,
        prerequisites = { "oil-processing" },
        effects = { {
            type = "unlock-recipe",
            recipe = "plastic-bar"
        } },
        unit = {
            count = 200,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 } },
            time = 30
        }
    },
    modules = {
        type = "technology",
        name = "modules",
        icon = "__quality__/graphics/technology/module.png",
        icon_size = 256,
        prerequisites = { "advanced-circuit" },
        unit = {
            count = 100,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 } },
            time = 30
        }
    },
    ["speed-module"] = {
        type = "technology",
        name = "speed-module",
        icon = "__base__/graphics/technology/speed-module-1.png",
        icon_size = 256,
        effects = { {
            type = "unlock-recipe",
            recipe = "speed-module"
        } },
        prerequisites = { "modules" },
        unit = {
            count = 50,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 } },
            time = 30
        },
        upgrade = true
    },
    ["speed-module-2"] = {
        type = "technology",
        name = "speed-module-2",
        icon = "__base__/graphics/technology/speed-module-2.png",
        icon_size = 256,
        effects = { {
            type = "unlock-recipe",
            recipe = "speed-module-2"
        } },
        prerequisites = { "speed-module", "space-science-pack" },
        unit = {
            count = 200,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "chemical-science-pack", 1 }, { "space-science-pack", 1 } },
            time = 30
        },
        upgrade = true
    },
    ["speed-module-3"] = {
        type = "technology",
        name = "speed-module-3",
        icon = "__base__/graphics/technology/speed-module-3.png",
        icon_size = 256,
        effects = { {
            type = "unlock-recipe",
            recipe = "speed-module-3"
        } },
        prerequisites = { "speed-module-2", "metallurgic-science-pack" },
        unit = {
            count = 2000,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "chemical-science-pack", 1 }, { "space-science-pack", 1 }, { "metallurgic-science-pack", 1 } },
            time = 60
        },
        upgrade = true
    },
    ["productivity-module"] = {
        type = "technology",
        name = "productivity-module",
        icon = "__base__/graphics/technology/productivity-module-1.png",
        icon_size = 256,
        effects = { {
            type = "unlock-recipe",
            recipe = "productivity-module"
        } },
        prerequisites = { "modules" },
        unit = {
            count = 50,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 } },
            time = 30
        },
        upgrade = true
    },
    ["productivity-module-2"] = {
        type = "technology",
        name = "productivity-module-2",
        icon = "__base__/graphics/technology/productivity-module-2.png",
        icon_size = 256,
        effects = { {
            type = "unlock-recipe",
            recipe = "productivity-module-2"
        } },
        prerequisites = { "productivity-module", "space-science-pack" },
        unit = {
            count = 200,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "chemical-science-pack", 1 }, { "space-science-pack", 1 } },
            time = 30
        },
        upgrade = true
    },
    ["productivity-module-3"] = {
        type = "technology",
        name = "productivity-module-3",
        icon = "__base__/graphics/technology/productivity-module-3.png",
        icon_size = 256,
        effects = { {
            type = "unlock-recipe",
            recipe = "productivity-module-3"
        } },
        prerequisites = { "productivity-module-2", "biter-egg-handling" },
        unit = {
            count = 300,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "chemical-science-pack", 1 }, { "space-science-pack", 1 }, { "agricultural-science-pack", 1 } },
            time = 60
        },
        upgrade = true
    },
    ["efficiency-module"] = {
        type = "technology",
        name = "efficiency-module",
        icon = "__base__/graphics/technology/efficiency-module-1.png",
        icon_size = 256,
        effects = { {
            type = "unlock-recipe",
            recipe = "efficiency-module"
        } },
        prerequisites = { "modules" },
        unit = {
            count = 50,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 } },
            time = 30
        },
        upgrade = true
    },
    ["efficiency-module-2"] = {
        type = "technology",
        name = "efficiency-module-2",
        icon = "__base__/graphics/technology/efficiency-module-2.png",
        icon_size = 256,
        effects = { {
            type = "unlock-recipe",
            recipe = "efficiency-module-2"
        } },
        prerequisites = { "efficiency-module", "space-science-pack" },
        unit = {
            count = 200,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "chemical-science-pack", 1 }, { "space-science-pack", 1 } },
            time = 30
        },
        upgrade = true
    },
    ["efficiency-module-3"] = {
        type = "technology",
        name = "efficiency-module-3",
        icon = "__base__/graphics/technology/efficiency-module-3.png",
        icon_size = 256,
        effects = { {
            type = "unlock-recipe",
            recipe = "efficiency-module-3"
        } },
        prerequisites = { "efficiency-module-2", "agricultural-science-pack" },
        unit = {
            count = 300,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "chemical-science-pack", 1 }, { "space-science-pack", 1 }, { "agricultural-science-pack", 1 } },
            time = 60
        },
        upgrade = true
    },
    defender = {
        type = "technology",
        name = "defender",
        icon = "__base__/graphics/technology/defender.png",
        icon_size = 256,
        effects = { {
            type = "unlock-recipe",
            recipe = "defender-capsule"
        }, {
            type = "maximum-following-robots-count",
            modifier = 4
        } },
        prerequisites = { "military-science-pack" },
        unit = {
            count = 100,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "military-science-pack", 1 } },
            time = 30
        }
    },
    distractor = {
        type = "technology",
        name = "distractor",
        icon = "__base__/graphics/technology/distractor.png",
        icon_size = 256,
        effects = { {
            type = "unlock-recipe",
            recipe = "distractor-capsule"
        } },
        prerequisites = { "defender", "military-3", "laser" },
        unit = {
            count = 200,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "chemical-science-pack", 1 }, { "military-science-pack", 1 } },
            time = 30
        }
    },
    destroyer = {
        type = "technology",
        name = "destroyer",
        icon = "__base__/graphics/technology/destroyer.png",
        icon_size = 256,
        effects = { {
            type = "unlock-recipe",
            recipe = "destroyer-capsule"
        } },
        prerequisites = { "military-4", "distractor", "speed-module" },
        unit = {
            count = 300,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "chemical-science-pack", 1 }, { "military-science-pack", 1 }, { "utility-science-pack", 1 } },
            time = 30
        }
    },
    ["uranium-mining"] = {
        type = "technology",
        name = "uranium-mining",
        icon = "__base__/graphics/technology/uranium-mining.png",
        icon_size = 256,
        effects = { {
            type = "mining-with-fluid",
            modifier = true
        } },
        prerequisites = { "chemical-science-pack", "concrete" },
        unit = {
            count = 100,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "chemical-science-pack", 1 } },
            time = 30
        }
    },
    ["uranium-processing"] = {
        type = "technology",
        name = "uranium-processing",
        icon = "__base__/graphics/technology/uranium-processing.png",
        icon_size = 256,
        effects = { {
            type = "unlock-recipe",
            recipe = "centrifuge"
        }, {
            type = "unlock-recipe",
            recipe = "uranium-processing"
        } },
        prerequisites = { "uranium-mining" },
        research_trigger = {
            type = "mine-entity",
            entity = "uranium-ore"
        }
    },
    ["nuclear-power"] = {
        type = "technology",
        name = "nuclear-power",
        icon = "__base__/graphics/technology/nuclear-power.png",
        icon_size = 256,
        effects = { {
            type = "unlock-recipe",
            recipe = "nuclear-reactor"
        }, {
            type = "unlock-recipe",
            recipe = "heat-exchanger"
        }, {
            type = "unlock-recipe",
            recipe = "heat-pipe"
        }, {
            type = "unlock-recipe",
            recipe = "steam-turbine"
        }, {
            type = "unlock-recipe",
            recipe = "uranium-fuel-cell"
        } },
        prerequisites = { "uranium-processing" },
        unit = {
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "chemical-science-pack", 1 } },
            time = 30,
            count = 800
        }
    },
    ["kovarex-enrichment-process"] = {
        type = "technology",
        name = "kovarex-enrichment-process",
        icon = "__base__/graphics/technology/kovarex-enrichment-process.png",
        icon_size = 256,
        effects = { {
            type = "unlock-recipe",
            recipe = "kovarex-enrichment-process"
        }, {
            type = "unlock-recipe",
            recipe = "nuclear-fuel"
        } },
        prerequisites = { "uranium-processing", "space-science-pack" },
        unit = {
            count = 1000,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "chemical-science-pack", 1 }, { "space-science-pack", 1 } },
            time = 30
        }
    },
    ["nuclear-fuel-reprocessing"] = {
        type = "technology",
        name = "nuclear-fuel-reprocessing",
        icon = "__base__/graphics/technology/nuclear-fuel-reprocessing.png",
        icon_size = 256,
        effects = { {
            type = "unlock-recipe",
            recipe = "nuclear-fuel-reprocessing"
        } },
        prerequisites = { "nuclear-power", "production-science-pack" },
        unit = {
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "chemical-science-pack", 1 }, { "production-science-pack", 1 } },
            time = 30,
            count = 50
        }
    },
    ["mining-productivity-1"] = {
        type = "technology",
        name = "mining-productivity-1",
        icons = { {
            icon = "__base__/graphics/technology/mining-productivity.png",
            icon_size = 256
        }, {
            icon = "__core__/graphics/icons/technology/constants/constant-mining-productivity.png",
            icon_size = 128,
            scale = 0.5,
            shift = { 50, 50 },
            floating = true
        } },
        effects = { {
            type = "mining-drill-productivity-bonus",
            modifier = 0.1
        } },
        prerequisites = { "advanced-circuit" },
        unit = {
            count = 250,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 } },
            time = 60
        },
        upgrade = true
    },
    ["mining-productivity-2"] = {
        type = "technology",
        name = "mining-productivity-2",
        icons = { {
            icon = "__base__/graphics/technology/mining-productivity.png",
            icon_size = 256
        }, {
            icon = "__core__/graphics/icons/technology/constants/constant-mining-productivity.png",
            icon_size = 128,
            scale = 0.5,
            shift = { 50, 50 },
            floating = true
        } },
        effects = { {
            type = "mining-drill-productivity-bonus",
            modifier = 0.1
        } },
        prerequisites = { "mining-productivity-1", "chemical-science-pack" },
        unit = {
            count = 500,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "chemical-science-pack", 1 } },
            time = 60
        },
        upgrade = true
    },
    ["mining-productivity-3"] = {
        type = "technology",
        name = "mining-productivity-3",
        icons = { {
            icon = "__base__/graphics/technology/mining-productivity.png",
            icon_size = 256
        }, {
            icon = "__core__/graphics/icons/technology/constants/constant-mining-productivity.png",
            icon_size = 128,
            scale = 0.5,
            shift = { 50, 50 },
            floating = true
        } },
        effects = { {
            type = "mining-drill-productivity-bonus",
            modifier = 0.1
        } },
        prerequisites = { "mining-productivity-2", "production-science-pack" },
        unit = {
            count_formula = "1000*(L - 2)",
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "chemical-science-pack", 1 }, { "production-science-pack", 1 } },
            time = 60
        },
        upgrade = true,
        max_level = "infinite"
    },
    artillery = {
        type = "technology",
        name = "artillery",
        icon = "__base__/graphics/technology/artillery.png",
        icon_size = 256,
        effects = { {
            type = "unlock-recipe",
            recipe = "artillery-wagon"
        }, {
            type = "unlock-recipe",
            recipe = "artillery-turret"
        }, {
            type = "unlock-recipe",
            recipe = "artillery-shell"
        } },
        prerequisites = { "military-4", "metallurgic-science-pack", "radar" },
        unit = {
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "chemical-science-pack", 1 }, { "military-science-pack", 1 }, { "utility-science-pack", 1 }, { "space-science-pack", 1 }, { "metallurgic-science-pack", 1 } },
            time = 30,
            count = 1500
        }
    },
    spidertron = {
        type = "technology",
        name = "spidertron",
        icon = "__base__/graphics/technology/spidertron.png",
        icon_size = 256,
        effects = { {
            type = "unlock-recipe",
            recipe = "spidertron"
        } },
        prerequisites = { "rocket-turret", "exoskeleton-equipment", "fission-reactor-equipment", "military-4", "production-science-pack", "radar" },
        unit = {
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "military-science-pack", 1 }, { "chemical-science-pack", 1 }, { "production-science-pack", 1 }, { "utility-science-pack", 1 }, { "space-science-pack", 1 }, { "agricultural-science-pack", 1 } },
            time = 30,
            count = 2500
        },
        order = "d-e-h"
    },
    ["circuit-network"] = {
        type = "technology",
        name = "circuit-network",
        icon = "__base__/graphics/technology/circuit-network.png",
        icon_size = 256,
        effects = { {
            type = "unlock-circuit-network",
            modifier = true
        }, {
            type = "unlock-recipe",
            recipe = "arithmetic-combinator"
        }, {
            type = "unlock-recipe",
            recipe = "decider-combinator"
        }, {
            type = "unlock-recipe",
            recipe = "constant-combinator"
        }, {
            type = "unlock-recipe",
            recipe = "power-switch"
        }, {
            type = "unlock-recipe",
            recipe = "programmable-speaker"
        }, {
            type = "unlock-recipe",
            recipe = "display-panel"
        }, {
            type = "unlock-recipe",
            recipe = "iron-stick"
        } },
        prerequisites = { "logistic-science-pack" },
        unit = {
            count = 100,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 } },
            time = 15
        }
    },
    ["advanced-combinators"] = {
        type = "technology",
        name = "advanced-combinators",
        icon = "__base__/graphics/technology/advanced-combinators.png",
        icon_size = 256,
        effects = { {
            type = "unlock-recipe",
            recipe = "selector-combinator"
        } },
        prerequisites = { "circuit-network", "chemical-science-pack" },
        unit = {
            count = 50,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "chemical-science-pack", 1 } },
            time = 30
        }
    },
    ["elevated-rail"] = {
        type = "technology",
        name = "elevated-rail",
        icon = "__elevated-rails__/graphics/technology/elevated-rail.png",
        icon_size = 256,
        effects = { {
            type = "unlock-recipe",
            recipe = "rail-support"
        }, {
            type = "unlock-recipe",
            recipe = "rail-ramp"
        }, {
            type = "rail-planner-allow-elevated-rails",
            modifier = true
        } },
        prerequisites = { "concrete", "production-science-pack" },
        unit = {
            count = 100,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "chemical-science-pack", 1 }, { "production-science-pack", 1 } },
            time = 30
        }
    },
    ["quality-module"] = {
        type = "technology",
        name = "quality-module",
        icon = "__quality__/graphics/technology/quality-module-1.png",
        icon_size = 256,
        effects = { {
            type = "unlock-recipe",
            recipe = "quality-module"
        }, {
            type = "unlock-quality",
            quality = "uncommon"
        }, {
            type = "unlock-quality",
            quality = "rare"
        } },
        prerequisites = { "modules" },
        unit = {
            count = 500,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 } },
            time = 30
        },
        upgrade = true
    },
    ["quality-module-2"] = {
        type = "technology",
        name = "quality-module-2",
        icon = "__quality__/graphics/technology/quality-module-2.png",
        icon_size = 256,
        effects = { {
            type = "unlock-recipe",
            recipe = "quality-module-2"
        } },
        prerequisites = { "quality-module", "space-science-pack" },
        unit = {
            count = 500,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "chemical-science-pack", 1 }, { "space-science-pack", 1 } },
            time = 30
        },
        upgrade = true
    },
    ["quality-module-3"] = {
        type = "technology",
        name = "quality-module-3",
        icon = "__quality__/graphics/technology/quality-module-3.png",
        icon_size = 256,
        effects = { {
            type = "unlock-recipe",
            recipe = "quality-module-3"
        } },
        prerequisites = { "quality-module-2", "electromagnetic-science-pack" },
        unit = {
            count = 2000,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "chemical-science-pack", 1 }, { "space-science-pack", 1 }, { "electromagnetic-science-pack", 1 } },
            time = 60
        },
        upgrade = true
    },
    ["epic-quality"] = {
        type = "technology",
        name = "epic-quality",
        icon_size = 256,
        icon = "__quality__/graphics/technology/epic-quality.png",
        effects = { {
            type = "unlock-quality",
            quality = "epic"
        } },
        prerequisites = { "agricultural-science-pack", "utility-science-pack", "quality-module" },
        unit = {
            count = 5000,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "chemical-science-pack", 1 }, { "utility-science-pack", 1 }, { "space-science-pack", 1 }, { "agricultural-science-pack", 1 } },
            time = 60
        }
    },
    ["legendary-quality"] = {
        type = "technology",
        name = "legendary-quality",
        icon_size = 256,
        icon = "__quality__/graphics/technology/legendary-quality.png",
        effects = { {
            type = "unlock-quality",
            quality = "legendary"
        } },
        prerequisites = { "cryogenic-science-pack", "epic-quality" },
        unit = {
            count = 5000,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "chemical-science-pack", 1 }, { "production-science-pack", 1 }, { "utility-science-pack", 1 }, { "space-science-pack", 1 }, { "metallurgic-science-pack", 1 }, { "agricultural-science-pack", 1 }, { "electromagnetic-science-pack", 1 }, { "cryogenic-science-pack", 1 } },
            time = 60
        }
    },
    recycling = {
        type = "technology",
        name = "recycling",
        icon = "__quality__/graphics/technology/recycling.png",
        icon_size = 256,
        effects = { {
            type = "unlock-recipe",
            recipe = "recycler"
        }, {
            type = "unlock-recipe",
            recipe = "scrap-recycling"
        } },
        prerequisites = { "planet-discovery-fulgora" },
        research_trigger = {
            type = "mine-entity",
            entity = "fulgoran-ruin-vault"
        }
    },
    ["space-platform"] = {
        type = "technology",
        name = "space-platform",
        icon = "__space-age__/graphics/technology/space-platform.png",
        icon_size = 256,
        effects = { {
            type = "unlock-recipe",
            recipe = "asteroid-collector"
        }, {
            type = "unlock-recipe",
            recipe = "crusher"
        }, {
            type = "unlock-recipe",
            recipe = "metallic-asteroid-crushing"
        }, {
            type = "unlock-recipe",
            recipe = "carbonic-asteroid-crushing"
        }, {
            type = "unlock-recipe",
            recipe = "oxide-asteroid-crushing"
        }, {
            type = "unlock-recipe",
            recipe = "cargo-bay"
        } },
        prerequisites = { "rocket-silo" },
        research_trigger = {
            type = "create-space-platform"
        }
    },
    ["electric-weapons-damage-1"] = {
        type = "technology",
        name = "electric-weapons-damage-1",
        icons = { {
            icon = "__space-age__/graphics/technology/electric-weapons-damage.png",
            icon_size = 256
        }, {
            icon = "__core__/graphics/icons/technology/constants/constant-damage.png",
            icon_size = 128,
            scale = 0.5,
            shift = { 50, 50 },
            floating = true
        } },
        effects = { {
            type = "ammo-damage",
            ammo_category = "beam",
            modifier = 0.3
        } },
        prerequisites = { "destroyer" },
        unit = {
            count = 250,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "military-science-pack", 1 }, { "chemical-science-pack", 1 }, { "utility-science-pack", 1 } },
            time = 30
        },
        upgrade = true
    },
    ["electric-weapons-damage-2"] = {
        type = "technology",
        name = "electric-weapons-damage-2",
        icons = { {
            icon = "__space-age__/graphics/technology/electric-weapons-damage.png",
            icon_size = 256
        }, {
            icon = "__core__/graphics/icons/technology/constants/constant-damage.png",
            icon_size = 128,
            scale = 0.5,
            shift = { 50, 50 },
            floating = true
        } },
        effects = { {
            type = "ammo-damage",
            ammo_category = "beam",
            modifier = 0.4
        } },
        prerequisites = { "electric-weapons-damage-1", "space-science-pack" },
        unit = {
            count = 500,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "chemical-science-pack", 1 }, { "military-science-pack", 1 }, { "utility-science-pack", 1 }, { "space-science-pack", 1 } },
            time = 60
        },
        upgrade = true
    },
    ["electric-weapons-damage-3"] = {
        type = "technology",
        name = "electric-weapons-damage-3",
        icons = { {
            icon = "__space-age__/graphics/technology/electric-weapons-damage.png",
            icon_size = 256
        }, {
            icon = "__core__/graphics/icons/technology/constants/constant-damage.png",
            icon_size = 128,
            scale = 0.5,
            shift = { 50, 50 },
            floating = true
        } },
        effects = { {
            type = "ammo-damage",
            ammo_category = "tesla",
            modifier = 0.7
        }, {
            type = "ammo-damage",
            ammo_category = "electric",
            modifier = 0.7
        }, {
            type = "ammo-damage",
            ammo_category = "beam",
            modifier = 0.6
        } },
        prerequisites = { "electric-weapons-damage-2", "tesla-weapons" },
        unit = {
            count = 1000,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "chemical-science-pack", 1 }, { "military-science-pack", 1 }, { "utility-science-pack", 1 }, { "space-science-pack", 1 }, { "electromagnetic-science-pack", 1 } },
            time = 60
        },
        upgrade = true
    },
    ["electric-weapons-damage-4"] = {
        type = "technology",
        name = "electric-weapons-damage-4",
        icons = { {
            icon = "__space-age__/graphics/technology/electric-weapons-damage.png",
            icon_size = 256
        }, {
            icon = "__core__/graphics/icons/technology/constants/constant-damage.png",
            icon_size = 128,
            scale = 0.5,
            shift = { 50, 50 },
            floating = true
        } },
        effects = { {
            type = "ammo-damage",
            ammo_category = "tesla",
            modifier = 0.7
        }, {
            type = "ammo-damage",
            ammo_category = "electric",
            modifier = 0.7
        }, {
            type = "ammo-damage",
            ammo_category = "beam",
            modifier = 0.3
        } },
        prerequisites = { "electric-weapons-damage-3" },
        unit = {
            count_formula = "2^(L-3)*1000",
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "chemical-science-pack", 1 }, { "military-science-pack", 1 }, { "utility-science-pack", 1 }, { "space-science-pack", 1 }, { "electromagnetic-science-pack", 1 } },
            time = 60
        },
        max_level = "infinite",
        upgrade = true
    },
    ["artillery-shell-damage-1"] = {
        type = "technology",
        name = "artillery-shell-damage-1",
        icons = { {
            icon = "__space-age__/graphics/technology/artillery-damage.png",
            icon_size = 256
        }, {
            icon = "__core__/graphics/icons/technology/constants/constant-damage.png",
            icon_size = 128,
            scale = 0.5,
            shift = { 50, 50 },
            floating = true
        } },
        effects = { {
            type = "ammo-damage",
            ammo_category = "artillery-shell",
            modifier = 0.1
        } },
        prerequisites = { "artillery" },
        unit = {
            count_formula = "2^(L-1)*1000",
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "chemical-science-pack", 1 }, { "military-science-pack", 1 }, { "utility-science-pack", 1 }, { "space-science-pack", 1 }, { "metallurgic-science-pack", 1 } },
            time = 60
        },
        max_level = "infinite"
    },
    ["railgun-shooting-speed-1"] = {
        type = "technology",
        name = "railgun-shooting-speed-1",
        icons = { {
            icon = "__space-age__/graphics/technology/railgun-shooting-speed.png",
            icon_size = 256
        }, {
            icon = "__core__/graphics/icons/technology/constants/constant-speed.png",
            icon_size = 128,
            scale = 0.5,
            shift = { 50, 50 },
            floating = true
        } },
        effects = { {
            type = "gun-speed",
            ammo_category = "railgun",
            icon = "__space-age__/graphics/icons/railgun-ammo.png",
            icon_size = 64,
            modifier = 0.15
        } },
        prerequisites = { "railgun" },
        unit = {
            count_formula = "2^(L-1)*1000",
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "chemical-science-pack", 1 }, { "military-science-pack", 1 }, { "utility-science-pack", 1 }, { "space-science-pack", 1 }, { "electromagnetic-science-pack", 1 }, { "cryogenic-science-pack", 1 } },
            time = 60
        },
        max_level = "infinite"
    },
    ["railgun-damage-1"] = {
        type = "technology",
        name = "railgun-damage-1",
        icons = { {
            icon = "__space-age__/graphics/technology/railgun-damage.png",
            icon_size = 256
        }, {
            icon = "__core__/graphics/icons/technology/constants/constant-damage.png",
            icon_size = 128,
            scale = 0.5,
            shift = { 50, 50 },
            floating = true
        } },
        effects = { {
            type = "ammo-damage",
            ammo_category = "railgun",
            modifier = 0.4
        } },
        prerequisites = { "railgun" },
        unit = {
            count_formula = "2^(L-1)*1000",
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "chemical-science-pack", 1 }, { "military-science-pack", 1 }, { "utility-science-pack", 1 }, { "space-science-pack", 1 }, { "metallurgic-science-pack", 1 }, { "agricultural-science-pack", 1 } },
            time = 60
        },
        max_level = "infinite"
    },
    ["space-platform-thruster"] = {
        type = "technology",
        name = "space-platform-thruster",
        icon = "__space-age__/graphics/technology/space-platform-thruster.png",
        icon_size = 256,
        effects = { {
            type = "unlock-recipe",
            recipe = "thruster"
        }, {
            type = "unlock-recipe",
            recipe = "ice-melting"
        }, {
            type = "unlock-recipe",
            recipe = "thruster-fuel"
        }, {
            type = "unlock-recipe",
            recipe = "thruster-oxidizer"
        } },
        prerequisites = { "space-science-pack" },
        unit = {
            count = 500,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "chemical-science-pack", 1 }, { "space-science-pack", 1 } },
            time = 60
        }
    },
    ["planet-discovery-vulcanus"] = {
        type = "technology",
        name = "planet-discovery-vulcanus",
        icons = { {
            icon = "__space-age__/graphics/technology/vulcanus.png",
            icon_size = 256
        }, {
            icon = "__core__/graphics/icons/technology/constants/constant-planet.png",
            icon_size = 128,
            scale = 0.5,
            shift = { 50, 50 },
            floating = true
        } },
        icon_size = 256,
        essential = true,
        effects = { {
            type = "unlock-space-location",
            space_location = "vulcanus",
            use_icon_overlay_constant = true
        } },
        prerequisites = { "space-platform-thruster" },
        unit = {
            count = 1000,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "chemical-science-pack", 1 }, { "space-science-pack", 1 } },
            time = 60
        }
    },
    ["planet-discovery-gleba"] = {
        type = "technology",
        name = "planet-discovery-gleba",
        icons = { {
            icon = "__space-age__/graphics/technology/gleba.png",
            icon_size = 256
        }, {
            icon = "__core__/graphics/icons/technology/constants/constant-planet.png",
            icon_size = 128,
            scale = 0.5,
            shift = { 50, 50 },
            floating = true
        } },
        icon_size = 256,
        essential = true,
        effects = { {
            type = "unlock-space-location",
            space_location = "gleba",
            use_icon_overlay_constant = true
        } },
        prerequisites = { "space-platform-thruster", "landfill" },
        unit = {
            count = 1000,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "chemical-science-pack", 1 }, { "space-science-pack", 1 } },
            time = 60
        }
    },
    ["planet-discovery-fulgora"] = {
        type = "technology",
        name = "planet-discovery-fulgora",
        icons = { {
            icon = "__space-age__/graphics/technology/fulgora.png",
            icon_size = 256
        }, {
            icon = "__core__/graphics/icons/technology/constants/constant-planet.png",
            icon_size = 128,
            scale = 0.5,
            shift = { 50, 50 },
            floating = true
        } },
        icon_size = 256,
        essential = true,
        effects = { {
            type = "unlock-space-location",
            space_location = "fulgora",
            use_icon_overlay_constant = true
        }, {
            type = "unlock-recipe",
            recipe = "lightning-rod"
        } },
        prerequisites = { "space-platform-thruster", "electric-energy-accumulators" },
        unit = {
            count = 1000,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "chemical-science-pack", 1 }, { "space-science-pack", 1 } },
            time = 60
        }
    },
    ["planet-discovery-aquilo"] = {
        type = "technology",
        name = "planet-discovery-aquilo",
        icons = { {
            icon = "__space-age__/graphics/technology/aquilo.png",
            icon_size = 256
        }, {
            icon = "__core__/graphics/icons/technology/constants/constant-planet.png",
            icon_size = 128,
            scale = 0.5,
            shift = { 50, 50 },
            floating = true
        } },
        icon_size = 256,
        essential = true,
        effects = { {
            type = "unlock-space-location",
            space_location = "aquilo",
            use_icon_overlay_constant = true
        }, {
            type = "unlock-recipe",
            recipe = "ammoniacal-solution-separation"
        }, {
            type = "unlock-recipe",
            recipe = "solid-fuel-from-ammonia"
        }, {
            type = "unlock-recipe",
            recipe = "ammonia-rocket-fuel"
        }, {
            type = "unlock-recipe",
            recipe = "ice-platform"
        } },
        prerequisites = { "rocket-turret", "advanced-asteroid-processing", "heating-tower", "asteroid-reprocessing", "electromagnetic-science-pack" },
        unit = {
            count = 3000,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "chemical-science-pack", 1 }, { "production-science-pack", 1 }, { "utility-science-pack", 1 }, { "space-science-pack", 1 }, { "metallurgic-science-pack", 1 }, { "agricultural-science-pack", 1 }, { "electromagnetic-science-pack", 1 } },
            time = 60
        }
    },
    ["worker-robots-speed-7"] = {
        type = "technology",
        name = "worker-robots-speed-7",
        icons = { {
            icon = "__base__/graphics/technology/worker-robots-speed.png",
            icon_size = 256
        }, {
            icon = "__core__/graphics/icons/technology/constants/constant-movement-speed.png",
            icon_size = 128,
            scale = 0.5,
            shift = { 50, 50 },
            floating = true
        } },
        effects = { {
            type = "worker-robot-speed",
            modifier = 0.65
        } },
        prerequisites = { "worker-robots-speed-6", "electromagnetic-science-pack" },
        unit = {
            count_formula = "2^(L-6)*1000",
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "chemical-science-pack", 1 }, { "production-science-pack", 1 }, { "utility-science-pack", 1 }, { "space-science-pack", 1 }, { "electromagnetic-science-pack", 1 } },
            time = 60
        },
        max_level = "infinite",
        upgrade = true
    },
    ["battery-mk3-equipment"] = {
        type = "technology",
        name = "battery-mk3-equipment",
        icons = { {
            icon = "__space-age__/graphics/technology/battery-mk3-equipment.png",
            icon_size = 256
        }, {
            icon = "__core__/graphics/icons/technology/constants/constant-equipment.png",
            icon_size = 128,
            scale = 0.5,
            shift = { 50, 50 },
            floating = true
        } },
        prerequisites = { "battery-mk2-equipment", "electromagnetic-science-pack" },
        effects = { {
            type = "unlock-recipe",
            recipe = "battery-mk3-equipment"
        } },
        unit = {
            count = 500,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "chemical-science-pack", 1 }, { "utility-science-pack", 1 }, { "space-science-pack", 1 }, { "electromagnetic-science-pack", 1 } },
            time = 60
        }
    },
    ["rocket-turret"] = {
        type = "technology",
        name = "rocket-turret",
        icon = "__space-age__/graphics/technology/rocket-turret.png",
        icon_size = 256,
        effects = { {
            type = "unlock-recipe",
            recipe = "rocket-turret"
        }, {
            type = "unlock-recipe",
            recipe = "coal-synthesis"
        } },
        prerequisites = { "rocketry", "carbon-fiber", "stronger-explosives-2" },
        unit = {
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "military-science-pack", 1 }, { "chemical-science-pack", 1 }, { "space-science-pack", 1 }, { "agricultural-science-pack", 1 } },
            time = 30,
            count = 1000
        }
    },
    ["toolbelt-equipment"] = {
        type = "technology",
        name = "toolbelt-equipment",
        icons = { {
            icon = "__space-age__/graphics/technology/toolbelt-equipment.png",
            icon_size = 256
        }, {
            icon = "__core__/graphics/icons/technology/constants/constant-equipment.png",
            icon_size = 128,
            scale = 0.5,
            shift = { 50, 50 },
            floating = true
        } },
        prerequisites = { "power-armor", "toolbelt", "carbon-fiber" },
        effects = { {
            type = "unlock-recipe",
            recipe = "toolbelt-equipment"
        } },
        unit = {
            count = 300,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "chemical-science-pack", 1 }, { "space-science-pack", 1 }, { "agricultural-science-pack", 1 } },
            time = 30
        }
    },
    ["calcite-processing"] = {
        type = "technology",
        name = "calcite-processing",
        icon = "__space-age__/graphics/technology/calcite-processing.png",
        icon_size = 256,
        effects = { {
            type = "unlock-recipe",
            recipe = "acid-neutralisation"
        }, {
            type = "unlock-recipe",
            recipe = "steam-condensation"
        }, {
            type = "unlock-recipe",
            recipe = "simple-coal-liquefaction"
        } },
        prerequisites = { "planet-discovery-vulcanus" },
        research_trigger = {
            type = "mine-entity",
            entity = "calcite"
        }
    },
    ["tungsten-carbide"] = {
        type = "technology",
        name = "tungsten-carbide",
        icon = "__space-age__/graphics/technology/tungsten-carbide.png",
        icon_size = 256,
        effects = { {
            type = "unlock-recipe",
            recipe = "carbon"
        }, {
            type = "unlock-recipe",
            recipe = "tungsten-carbide"
        } },
        prerequisites = { "planet-discovery-vulcanus" },
        research_trigger = {
            type = "mine-entity",
            entity = "big-volcanic-rock"
        }
    },
    ["big-mining-drill"] = {
        type = "technology",
        name = "big-mining-drill",
        icon = "__space-age__/graphics/technology/big-mining-drill.png",
        icon_size = 256,
        effects = { {
            type = "unlock-recipe",
            recipe = "big-mining-drill"
        } },
        prerequisites = { "foundry", "electric-mining-drill" },
        research_trigger = {
            type = "craft-item",
            item = "foundry"
        }
    },
    foundry = {
        type = "technology",
        name = "foundry",
        icon = "__space-age__/graphics/technology/foundry.png",
        icon_size = 256,
        effects = { {
            type = "unlock-recipe",
            recipe = "foundry"
        }, {
            type = "unlock-recipe",
            recipe = "molten-iron-from-lava"
        }, {
            type = "unlock-recipe",
            recipe = "molten-copper-from-lava"
        }, {
            type = "unlock-recipe",
            recipe = "concrete-from-molten-iron"
        }, {
            type = "unlock-recipe",
            recipe = "casting-low-density-structure"
        }, {
            type = "unlock-recipe",
            recipe = "molten-iron"
        }, {
            type = "unlock-recipe",
            recipe = "molten-copper"
        }, {
            type = "unlock-recipe",
            recipe = "casting-iron"
        }, {
            type = "unlock-recipe",
            recipe = "casting-steel"
        }, {
            type = "unlock-recipe",
            recipe = "casting-copper"
        }, {
            type = "unlock-recipe",
            recipe = "casting-iron-gear-wheel"
        }, {
            type = "unlock-recipe",
            recipe = "casting-iron-stick"
        }, {
            type = "unlock-recipe",
            recipe = "casting-pipe"
        }, {
            type = "unlock-recipe",
            recipe = "casting-pipe-to-ground"
        }, {
            type = "unlock-recipe",
            recipe = "casting-copper-cable"
        } },
        prerequisites = { "calcite-processing", "tungsten-carbide" },
        research_trigger = {
            type = "craft-item",
            item = "tungsten-carbide"
        }
    },
    ["tungsten-steel"] = {
        type = "technology",
        name = "tungsten-steel",
        icon = "__space-age__/graphics/technology/tungsten-steel.png",
        icon_size = 256,
        effects = { {
            type = "unlock-recipe",
            recipe = "tungsten-plate"
        } },
        prerequisites = { "big-mining-drill" },
        research_trigger = {
            type = "craft-item",
            item = "big-mining-drill"
        }
    },
    ["turbo-transport-belt"] = {
        type = "technology",
        name = "turbo-transport-belt",
        icon = "__space-age__/graphics/technology/turbo-transport-belt.png",
        icon_size = 256,
        effects = { {
            type = "unlock-recipe",
            recipe = "turbo-transport-belt"
        }, {
            type = "unlock-recipe",
            recipe = "turbo-underground-belt"
        }, {
            type = "unlock-recipe",
            recipe = "turbo-splitter"
        } },
        prerequisites = { "metallurgic-science-pack", "logistics-3" },
        unit = {
            count = 500,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "chemical-science-pack", 1 }, { "production-science-pack", 1 }, { "space-science-pack", 1 }, { "metallurgic-science-pack", 1 } },
            time = 60
        }
    },
    ["metallurgic-science-pack"] = {
        type = "technology",
        name = "metallurgic-science-pack",
        icon = "__space-age__/graphics/technology/metallurgic-science-pack.png",
        icon_size = 256,
        essential = true,
        effects = { {
            type = "unlock-recipe",
            recipe = "metallurgic-science-pack"
        } },
        prerequisites = { "tungsten-steel" },
        research_trigger = {
            type = "craft-item",
            item = "tungsten-plate"
        }
    },
    railgun = {
        type = "technology",
        name = "railgun",
        icon = "__space-age__/graphics/technology/railgun.png",
        icon_size = 256,
        effects = { {
            type = "unlock-recipe",
            recipe = "railgun"
        }, {
            type = "unlock-recipe",
            recipe = "railgun-turret"
        }, {
            type = "unlock-recipe",
            recipe = "railgun-ammo"
        } },
        prerequisites = { "quantum-processor" },
        unit = {
            count = 2000,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "chemical-science-pack", 1 }, { "military-science-pack", 1 }, { "utility-science-pack", 1 }, { "space-science-pack", 1 }, { "metallurgic-science-pack", 1 }, { "electromagnetic-science-pack", 1 }, { "agricultural-science-pack", 1 }, { "cryogenic-science-pack", 1 } },
            time = 60
        }
    },
    ["mech-armor"] = {
        type = "technology",
        name = "mech-armor",
        icon = "__space-age__/graphics/technology/mech-armor.png",
        icon_size = 256,
        effects = { {
            type = "unlock-recipe",
            recipe = "mech-armor"
        } },
        prerequisites = { "electromagnetic-science-pack", "power-armor-mk2" },
        unit = {
            count = 5000,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "chemical-science-pack", 1 }, { "military-science-pack", 1 }, { "utility-science-pack", 1 }, { "space-science-pack", 1 }, { "electromagnetic-science-pack", 1 } },
            time = 60
        }
    },
    agriculture = {
        type = "technology",
        name = "agriculture",
        icon = "__space-age__/graphics/technology/agriculture.png",
        icon_size = 256,
        effects = { {
            type = "unlock-recipe",
            recipe = "agricultural-tower"
        }, {
            type = "unlock-recipe",
            recipe = "nutrients-from-spoilage"
        } },
        prerequisites = { "planet-discovery-gleba" },
        research_trigger = {
            type = "mine-entity",
            entity = "iron-stromatolite"
        }
    },
    yumako = {
        type = "technology",
        name = "yumako",
        icon = "__space-age__/graphics/technology/yumako.png",
        icon_size = 256,
        effects = { {
            type = "unlock-recipe",
            recipe = "yumako-processing"
        }, {
            type = "unlock-recipe",
            recipe = "copper-bacteria"
        } },
        prerequisites = { "agriculture" },
        research_trigger = {
            type = "mine-entity",
            entity = "yumako-tree"
        }
    },
    biochamber = {
        type = "technology",
        name = "biochamber",
        icon = "__space-age__/graphics/technology/biochamber.png",
        icon_size = 256,
        effects = { {
            type = "unlock-recipe",
            recipe = "biochamber"
        }, {
            type = "unlock-recipe",
            recipe = "nutrients-from-yumako-mash"
        }, {
            type = "unlock-recipe",
            recipe = "burnt-spoilage"
        }, {
            type = "unlock-recipe",
            recipe = "pentapod-egg"
        } },
        prerequisites = { "yumako", "jellynut" },
        research_trigger = {
            type = "craft-item",
            item = "nutrients",
            count = 10
        }
    },
    jellynut = {
        type = "technology",
        name = "jellynut",
        icon = "__space-age__/graphics/technology/jellynut.png",
        icon_size = 256,
        effects = { {
            type = "unlock-recipe",
            recipe = "jellynut-processing"
        }, {
            type = "unlock-recipe",
            recipe = "iron-bacteria"
        } },
        prerequisites = { "agriculture" },
        research_trigger = {
            type = "mine-entity",
            entity = "jellystem"
        }
    },
    bioflux = {
        type = "technology",
        name = "bioflux",
        icon = "__space-age__/graphics/technology/bioflux.png",
        icon_size = 256,
        effects = { {
            type = "unlock-recipe",
            recipe = "bioflux"
        }, {
            type = "unlock-recipe",
            recipe = "nutrients-from-bioflux"
        } },
        prerequisites = { "biochamber" },
        research_trigger = {
            type = "craft-item",
            item = "biochamber"
        }
    },
    ["artificial-soil"] = {
        type = "technology",
        name = "artificial-soil",
        icon = "__space-age__/graphics/technology/artificial-soil.png",
        icon_size = 256,
        effects = { {
            type = "unlock-recipe",
            recipe = "artificial-yumako-soil"
        }, {
            type = "unlock-recipe",
            recipe = "artificial-jellynut-soil"
        } },
        research_trigger = {
            type = "craft-item",
            item = "nutrients",
            count = 500
        },
        prerequisites = { "yumako", "jellynut" }
    },
    ["bacteria-cultivation"] = {
        type = "technology",
        name = "bacteria-cultivation",
        icon = "__space-age__/graphics/technology/bacteria-cultivation.png",
        icon_size = 256,
        effects = { {
            type = "unlock-recipe",
            recipe = "copper-bacteria-cultivation"
        }, {
            type = "unlock-recipe",
            recipe = "iron-bacteria-cultivation"
        } },
        prerequisites = { "bioflux" },
        research_trigger = {
            type = "craft-item",
            item = "bioflux"
        }
    },
    ["bioflux-processing"] = {
        type = "technology",
        name = "bioflux-processing",
        icon = "__space-age__/graphics/technology/bioflux-processing.png",
        icon_size = 256,
        effects = { {
            type = "unlock-recipe",
            recipe = "bioplastic"
        }, {
            type = "unlock-recipe",
            recipe = "rocket-fuel-from-jelly"
        }, {
            type = "unlock-recipe",
            recipe = "biosulfur"
        }, {
            type = "unlock-recipe",
            recipe = "biolubricant"
        } },
        prerequisites = { "bioflux" },
        research_trigger = {
            type = "craft-item",
            item = "bioflux",
            count = 25
        }
    },
    ["agricultural-science-pack"] = {
        type = "technology",
        name = "agricultural-science-pack",
        icon = "__space-age__/graphics/technology/agricultural-science-pack.png",
        icon_size = 256,
        essential = true,
        effects = { {
            type = "unlock-recipe",
            recipe = "agricultural-science-pack"
        } },
        prerequisites = { "bioflux-processing", "bacteria-cultivation", "artificial-soil" },
        research_trigger = {
            type = "craft-item",
            item = "bioflux",
            count = 100
        }
    },
    ["tree-seeding"] = {
        type = "technology",
        name = "tree-seeding",
        icon = "__space-age__/graphics/technology/tree-seeding.png",
        icon_size = 256,
        effects = { {
            type = "unlock-recipe",
            recipe = "wood-processing"
        } },
        prerequisites = { "agricultural-science-pack" },
        unit = {
            count = 50,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "chemical-science-pack", 1 }, { "space-science-pack", 1 }, { "agricultural-science-pack", 1 } },
            time = 60
        }
    },
    ["stack-inserter"] = {
        type = "technology",
        name = "stack-inserter",
        icon = "__space-age__/graphics/technology/stack-inserter.png",
        icon_size = 256,
        effects = { {
            type = "unlock-recipe",
            recipe = "stack-inserter"
        }, {
            type = "belt-stack-size-bonus",
            modifier = 1
        } },
        prerequisites = { "carbon-fiber", "production-science-pack", "utility-science-pack", "bulk-inserter" },
        unit = {
            count = 1000,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "chemical-science-pack", 1 }, { "production-science-pack", 1 }, { "utility-science-pack", 1 }, { "space-science-pack", 1 }, { "agricultural-science-pack", 1 } },
            time = 60
        }
    },
    ["transport-belt-capacity-1"] = {
        type = "technology",
        name = "transport-belt-capacity-1",
        localised_description = { "technology-description.belt-capacity" },
        icons = { {
            icon = "__space-age__/graphics/technology/transport-belt-capacity.png",
            icon_size = 256
        }, {
            icon = "__core__/graphics/icons/technology/constants/constant-capacity.png",
            icon_size = 128,
            scale = 0.5,
            shift = { 50, 50 },
            floating = true
        } },
        effects = { {
            type = "belt-stack-size-bonus",
            modifier = 1
        } },
        prerequisites = { "stack-inserter" },
        unit = {
            count = 2000,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "chemical-science-pack", 1 }, { "production-science-pack", 1 }, { "utility-science-pack", 1 }, { "space-science-pack", 1 }, { "agricultural-science-pack", 1 } },
            time = 60
        },
        upgrade = true
    },
    ["transport-belt-capacity-2"] = {
        type = "technology",
        name = "transport-belt-capacity-2",
        localised_description = { "technology-description.belt-capacity" },
        icons = { {
            icon = "__space-age__/graphics/technology/transport-belt-capacity.png",
            icon_size = 256
        }, {
            icon = "__core__/graphics/icons/technology/constants/constant-capacity.png",
            icon_size = 128,
            scale = 0.5,
            shift = { 50, 50 },
            floating = true
        } },
        effects = { {
            type = "belt-stack-size-bonus",
            modifier = 1
        }, {
            type = "inserter-stack-size-bonus",
            modifier = 1
        } },
        prerequisites = { "transport-belt-capacity-1" },
        unit = {
            count = 3000,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "chemical-science-pack", 1 }, { "production-science-pack", 1 }, { "utility-science-pack", 1 }, { "space-science-pack", 1 }, { "agricultural-science-pack", 1 } },
            time = 60
        },
        upgrade = true
    },
    captivity = {
        type = "technology",
        name = "captivity",
        icon = "__space-age__/graphics/technology/captivity.png",
        icon_size = 256,
        effects = { {
            type = "unlock-recipe",
            recipe = "capture-robot-rocket"
        }, {
            type = "unlock-recipe",
            recipe = "biter-egg"
        }, {
            type = "unlock-recipe",
            recipe = "nutrients-from-biter-egg"
        } },
        prerequisites = { "agricultural-science-pack", "military-3", "rocketry" },
        unit = {
            count = 1000,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "chemical-science-pack", 1 }, { "military-science-pack", 1 }, { "space-science-pack", 1 }, { "agricultural-science-pack", 1 } },
            time = 60
        }
    },
    biolab = {
        type = "technology",
        name = "biolab",
        icon = "__space-age__/graphics/technology/biolab.png",
        icon_size = 256,
        effects = { {
            type = "unlock-recipe",
            recipe = "biolab"
        } },
        prerequisites = { "biter-egg-handling", "production-science-pack", "utility-science-pack", "uranium-processing" },
        unit = {
            count = 1000,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "chemical-science-pack", 1 }, { "military-science-pack", 1 }, { "production-science-pack", 1 }, { "utility-science-pack", 1 }, { "space-science-pack", 1 }, { "agricultural-science-pack", 1 } },
            time = 60
        }
    },
    ["biter-egg-handling"] = {
        type = "technology",
        name = "biter-egg-handling",
        icon = "__space-age__/graphics/technology/biter-egg-handling.png",
        icon_size = 256,
        prerequisites = { "captivity" },
        research_trigger = {
            type = "capture-spawner"
        }
    },
    ["overgrowth-soil"] = {
        type = "technology",
        name = "overgrowth-soil",
        icon = "__space-age__/graphics/technology/overgrowth-soil.png",
        icon_size = 256,
        effects = { {
            type = "unlock-recipe",
            recipe = "overgrowth-yumako-soil"
        }, {
            type = "unlock-recipe",
            recipe = "overgrowth-jellynut-soil"
        } },
        prerequisites = { "biter-egg-handling", "production-science-pack", "utility-science-pack" },
        unit = {
            count = 2000,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "chemical-science-pack", 1 }, { "production-science-pack", 1 }, { "utility-science-pack", 1 }, { "space-science-pack", 1 }, { "agricultural-science-pack", 1 } },
            time = 60
        }
    },
    ["carbon-fiber"] = {
        type = "technology",
        name = "carbon-fiber",
        icon = "__space-age__/graphics/technology/carbon-fiber.png",
        icon_size = 256,
        effects = { {
            type = "unlock-recipe",
            recipe = "carbon-fiber"
        } },
        prerequisites = { "agricultural-science-pack" },
        unit = {
            count = 500,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "chemical-science-pack", 1 }, { "space-science-pack", 1 }, { "agricultural-science-pack", 1 } },
            time = 60
        }
    },
    health = {
        type = "technology",
        name = "health",
        icon = "__space-age__/graphics/technology/health.png",
        icon_size = 256,
        effects = { {
            type = "character-health-bonus",
            modifier = 50
        } },
        prerequisites = { "agricultural-science-pack", "utility-science-pack", "military-science-pack" },
        unit = {
            count_formula = "2^L*50",
            ingredients = { { "military-science-pack", 1 }, { "utility-science-pack", 1 }, { "agricultural-science-pack", 1 } },
            time = 60
        },
        max_level = "infinite"
    },
    ["fish-breeding"] = {
        type = "technology",
        name = "fish-breeding",
        icon = "__space-age__/graphics/technology/fish-breeding.png",
        icon_size = 256,
        effects = { {
            type = "unlock-recipe",
            recipe = "fish-breeding"
        }, {
            type = "unlock-recipe",
            recipe = "nutrients-from-fish"
        } },
        prerequisites = { "tree-seeding" },
        unit = {
            count_formula = "500",
            ingredients = { { "space-science-pack", 1 }, { "agricultural-science-pack", 1 } },
            time = 60
        }
    },
    ["holmium-processing"] = {
        type = "technology",
        name = "holmium-processing",
        icon = "__space-age__/graphics/technology/holmium-processing.png",
        icon_size = 256,
        effects = { {
            type = "unlock-recipe",
            recipe = "holmium-solution"
        }, {
            type = "unlock-recipe",
            recipe = "holmium-plate"
        } },
        prerequisites = { "recycling" },
        research_trigger = {
            type = "craft-item",
            item = "holmium-ore"
        }
    },
    ["electromagnetic-plant"] = {
        type = "technology",
        name = "electromagnetic-plant",
        icon = "__space-age__/graphics/technology/electromagnetic-plant.png",
        icon_size = 256,
        effects = { {
            type = "unlock-recipe",
            recipe = "electromagnetic-plant"
        }, {
            type = "unlock-recipe",
            recipe = "superconductor"
        }, {
            type = "unlock-recipe",
            recipe = "supercapacitor"
        }, {
            type = "unlock-recipe",
            recipe = "electrolyte"
        } },
        prerequisites = { "holmium-processing" },
        research_trigger = {
            type = "craft-item",
            item = "holmium-plate",
            count = 50
        }
    },
    ["electromagnetic-science-pack"] = {
        type = "technology",
        name = "electromagnetic-science-pack",
        icon = "__space-age__/graphics/technology/electromagnetic-science-pack.png",
        icon_size = 256,
        essential = true,
        effects = { {
            type = "unlock-recipe",
            recipe = "electromagnetic-science-pack"
        } },
        prerequisites = { "electromagnetic-plant" },
        research_trigger = {
            type = "craft-item",
            item = "supercapacitor"
        }
    },
    ["lightning-collector"] = {
        type = "technology",
        name = "lightning-collector",
        icon = "__space-age__/graphics/technology/lightning-collector.png",
        icon_size = 256,
        effects = { {
            type = "unlock-recipe",
            recipe = "lightning-collector"
        } },
        prerequisites = { "electromagnetic-science-pack" },
        unit = {
            count = 1000,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "chemical-science-pack", 1 }, { "space-science-pack", 1 }, { "electromagnetic-science-pack", 1 } },
            time = 60
        }
    },
    ["rail-support-foundations"] = {
        type = "technology",
        name = "rail-support-foundations",
        icon = "__space-age__/graphics/technology/rail-support-foundations.png",
        icon_size = 256,
        effects = { {
            type = "rail-support-on-deep-oil-ocean",
            modifier = true
        } },
        prerequisites = { "electromagnetic-science-pack", "utility-science-pack", "metallurgic-science-pack", "elevated-rail" },
        unit = {
            count = 2000,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "chemical-science-pack", 1 }, { "production-science-pack", 1 }, { "utility-science-pack", 1 }, { "space-science-pack", 1 }, { "metallurgic-science-pack", 1 }, { "electromagnetic-science-pack", 1 } },
            time = 30
        }
    },
    ["tesla-weapons"] = {
        type = "technology",
        name = "tesla-weapons",
        icon = "__space-age__/graphics/technology/tesla-weapons.png",
        icon_size = 256,
        effects = { {
            type = "unlock-recipe",
            recipe = "teslagun"
        }, {
            type = "unlock-recipe",
            recipe = "tesla-turret"
        }, {
            type = "unlock-recipe",
            recipe = "tesla-ammo"
        } },
        prerequisites = { "electromagnetic-science-pack", "military-4" },
        unit = {
            count = 1500,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "chemical-science-pack", 1 }, { "military-science-pack", 1 }, { "utility-science-pack", 1 }, { "space-science-pack", 1 }, { "electromagnetic-science-pack", 1 } },
            time = 60
        }
    },
    ["heating-tower"] = {
        type = "technology",
        name = "heating-tower",
        icon = "__space-age__/graphics/technology/heating-tower.png",
        icon_size = 256,
        effects = { {
            type = "unlock-recipe",
            recipe = "heating-tower"
        }, {
            type = "unlock-recipe",
            recipe = "heat-pipe"
        }, {
            type = "unlock-recipe",
            recipe = "heat-exchanger"
        }, {
            type = "unlock-recipe",
            recipe = "steam-turbine"
        } },
        prerequisites = { "planet-discovery-gleba" },
        research_trigger = {
            type = "mine-entity",
            entity = "copper-stromatolite"
        }
    },
    ["lithium-processing"] = {
        type = "technology",
        name = "lithium-processing",
        icon = "__space-age__/graphics/technology/lithium-processing.png",
        icon_size = 256,
        effects = { {
            type = "unlock-recipe",
            recipe = "lithium"
        }, {
            type = "unlock-recipe",
            recipe = "lithium-plate"
        } },
        prerequisites = { "planet-discovery-aquilo" },
        research_trigger = {
            type = "mine-entity",
            entity = "lithium-iceberg-big"
        }
    },
    ["cryogenic-plant"] = {
        type = "technology",
        name = "cryogenic-plant",
        icon = "__space-age__/graphics/technology/cryogenic-plant.png",
        icon_size = 256,
        effects = { {
            type = "unlock-recipe",
            recipe = "cryogenic-plant"
        }, {
            type = "unlock-recipe",
            recipe = "fluoroketone"
        }, {
            type = "unlock-recipe",
            recipe = "fluoroketone-cooling"
        } },
        prerequisites = { "lithium-processing" },
        research_trigger = {
            type = "craft-item",
            item = "lithium-plate"
        }
    },
    ["asteroid-reprocessing"] = {
        type = "technology",
        name = "asteroid-reprocessing",
        icon = "__space-age__/graphics/technology/asteroid-reprocessing.png",
        icon_size = 256,
        effects = { {
            type = "unlock-recipe",
            recipe = "metallic-asteroid-reprocessing"
        }, {
            type = "unlock-recipe",
            recipe = "oxide-asteroid-reprocessing"
        }, {
            type = "unlock-recipe",
            recipe = "carbonic-asteroid-reprocessing"
        } },
        prerequisites = { "metallurgic-science-pack" },
        unit = {
            count = 500,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "chemical-science-pack", 1 }, { "space-science-pack", 1 }, { "metallurgic-science-pack", 1 } },
            time = 60
        }
    },
    ["advanced-asteroid-processing"] = {
        type = "technology",
        name = "advanced-asteroid-processing",
        icon = "__space-age__/graphics/technology/advanced-asteroid-processing.png",
        icon_size = 256,
        effects = { {
            type = "unlock-recipe",
            recipe = "advanced-metallic-asteroid-crushing"
        }, {
            type = "unlock-recipe",
            recipe = "advanced-carbonic-asteroid-crushing"
        }, {
            type = "unlock-recipe",
            recipe = "advanced-oxide-asteroid-crushing"
        }, {
            type = "unlock-recipe",
            recipe = "advanced-thruster-fuel"
        }, {
            type = "unlock-recipe",
            recipe = "advanced-thruster-oxidizer"
        } },
        prerequisites = { "agricultural-science-pack", "production-science-pack", "utility-science-pack" },
        unit = {
            count = 2000,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "chemical-science-pack", 1 }, { "production-science-pack", 1 }, { "utility-science-pack", 1 }, { "space-science-pack", 1 }, { "agricultural-science-pack", 1 } },
            time = 60
        }
    },
    ["quantum-processor"] = {
        type = "technology",
        name = "quantum-processor",
        icon = "__space-age__/graphics/technology/quantum-processor.png",
        icon_size = 256,
        effects = { {
            type = "unlock-recipe",
            recipe = "quantum-processor"
        } },
        prerequisites = { "cryogenic-science-pack" },
        unit = {
            count = 500,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "chemical-science-pack", 1 }, { "production-science-pack", 1 }, { "utility-science-pack", 1 }, { "space-science-pack", 1 }, { "metallurgic-science-pack", 1 }, { "agricultural-science-pack", 1 }, { "electromagnetic-science-pack", 1 }, { "cryogenic-science-pack", 1 } },
            time = 60
        }
    },
    ["cryogenic-science-pack"] = {
        type = "technology",
        name = "cryogenic-science-pack",
        icon = "__space-age__/graphics/technology/cryogenic-science-pack.png",
        icon_size = 256,
        essential = true,
        effects = { {
            type = "unlock-recipe",
            recipe = "cryogenic-science-pack"
        } },
        prerequisites = { "cryogenic-plant" },
        research_trigger = {
            type = "craft-item",
            item = "cryogenic-plant"
        }
    },
    ["fusion-reactor"] = {
        type = "technology",
        name = "fusion-reactor",
        icon = "__space-age__/graphics/technology/fusion-reactor.png",
        icon_size = 256,
        effects = { {
            type = "unlock-recipe",
            recipe = "fusion-reactor"
        }, {
            type = "unlock-recipe",
            recipe = "fusion-generator"
        }, {
            type = "unlock-recipe",
            recipe = "fusion-power-cell"
        } },
        prerequisites = { "quantum-processor" },
        unit = {
            count = 2000,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "chemical-science-pack", 1 }, { "production-science-pack", 1 }, { "utility-science-pack", 1 }, { "space-science-pack", 1 }, { "metallurgic-science-pack", 1 }, { "agricultural-science-pack", 1 }, { "electromagnetic-science-pack", 1 }, { "cryogenic-science-pack", 1 } },
            time = 60
        }
    },
    ["fusion-reactor-equipment"] = {
        type = "technology",
        name = "fusion-reactor-equipment",
        icons = { {
            icon = "__space-age__/graphics/technology/fusion-reactor-equipment.png",
            icon_size = 256
        }, {
            icon = "__core__/graphics/icons/technology/constants/constant-equipment.png",
            icon_size = 128,
            scale = 0.5,
            shift = { 50, 50 },
            floating = true
        } },
        icon_size = 256,
        effects = { {
            type = "unlock-recipe",
            recipe = "fusion-reactor-equipment"
        } },
        prerequisites = { "fusion-reactor", "fission-reactor-equipment" },
        unit = {
            count = 1000,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "chemical-science-pack", 1 }, { "production-science-pack", 1 }, { "utility-science-pack", 1 }, { "space-science-pack", 1 }, { "metallurgic-science-pack", 1 }, { "agricultural-science-pack", 1 }, { "electromagnetic-science-pack", 1 }, { "cryogenic-science-pack", 1 } },
            time = 60
        }
    },
    ["captive-biter-spawner"] = {
        type = "technology",
        name = "captive-biter-spawner",
        icon = "__space-age__/graphics/technology/captive-biter-spawner.png",
        icon_size = 256,
        effects = { {
            type = "unlock-recipe",
            recipe = "captive-biter-spawner"
        } },
        prerequisites = { "cryogenic-science-pack", "biter-egg-handling", "kovarex-enrichment-process" },
        unit = {
            count = 3000,
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "chemical-science-pack", 1 }, { "military-science-pack", 1 }, { "production-science-pack", 1 }, { "utility-science-pack", 1 }, { "space-science-pack", 1 }, { "metallurgic-science-pack", 1 }, { "agricultural-science-pack", 1 }, { "electromagnetic-science-pack", 1 }, { "cryogenic-science-pack", 1 } },
            time = 60
        }
    },
    ["promethium-science-pack"] = {
        type = "technology",
        name = "promethium-science-pack",
        icon = "__space-age__/graphics/technology/promethium-science-pack.png",
        icon_size = 256,
        essential = true,
        effects = { {
            type = "unlock-space-location",
            space_location = "solar-system-edge"
        }, {
            type = "unlock-space-location",
            space_location = "shattered-planet"
        }, {
            type = "unlock-recipe",
            recipe = "promethium-science-pack"
        } },
        prerequisites = { "biter-egg-handling", "fusion-reactor" },
        unit = {
            count_formula = "2000",
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "chemical-science-pack", 1 }, { "production-science-pack", 1 }, { "utility-science-pack", 1 }, { "space-science-pack", 1 }, { "metallurgic-science-pack", 1 }, { "agricultural-science-pack", 1 }, { "electromagnetic-science-pack", 1 }, { "cryogenic-science-pack", 1 } },
            time = 60
        }
    },
    foundation = {
        type = "technology",
        name = "foundation",
        icon = "__space-age__/graphics/technology/foundation.png",
        icon_size = 256,
        effects = { {
            type = "unlock-recipe",
            recipe = "foundation"
        } },
        prerequisites = { "cryogenic-science-pack" },
        unit = {
            count_formula = "2000",
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "chemical-science-pack", 1 }, { "production-science-pack", 1 }, { "utility-science-pack", 1 }, { "space-science-pack", 1 }, { "metallurgic-science-pack", 1 }, { "agricultural-science-pack", 1 }, { "electromagnetic-science-pack", 1 }, { "cryogenic-science-pack", 1 } },
            time = 60
        }
    },
    ["asteroid-productivity"] = {
        type = "technology",
        name = "asteroid-productivity",
        icons = { {
            icon = "__space-age__/graphics/technology/asteroid-productivity.png",
            icon_size = 256
        }, {
            icon = "__core__/graphics/icons/technology/constants/constant-mining-productivity.png",
            icon_size = 128,
            scale = 0.5,
            shift = { 50, 50 },
            floating = true
        } },
        effects = { {
            type = "change-recipe-productivity",
            recipe = "carbonic-asteroid-crushing",
            change = 0.1
        }, {
            type = "change-recipe-productivity",
            recipe = "oxide-asteroid-crushing",
            change = 0.1
        }, {
            type = "change-recipe-productivity",
            recipe = "metallic-asteroid-crushing",
            change = 0.1
        }, {
            type = "change-recipe-productivity",
            recipe = "advanced-carbonic-asteroid-crushing",
            change = 0.1
        }, {
            type = "change-recipe-productivity",
            recipe = "advanced-oxide-asteroid-crushing",
            change = 0.1
        }, {
            type = "change-recipe-productivity",
            recipe = "advanced-metallic-asteroid-crushing",
            change = 0.1
        } },
        prerequisites = { "advanced-asteroid-processing" },
        unit = {
            count_formula = "1.5^L*1000",
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "chemical-science-pack", 1 }, { "production-science-pack", 1 }, { "utility-science-pack", 1 }, { "space-science-pack", 1 }, { "agricultural-science-pack", 1 } },
            time = 60
        },
        max_level = "infinite",
        upgrade = true
    },
    ["research-productivity"] = {
        type = "technology",
        name = "research-productivity",
        icon = "__space-age__/graphics/technology/research-productivity.png",
        icon_size = 256,
        effects = { {
            type = "laboratory-productivity",
            modifier = 0.1
        } },
        prerequisites = { "promethium-science-pack" },
        unit = {
            count_formula = "1.2^L*1000",
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "military-science-pack", 1 }, { "chemical-science-pack", 1 }, { "production-science-pack", 1 }, { "utility-science-pack", 1 }, { "space-science-pack", 1 }, { "metallurgic-science-pack", 1 }, { "electromagnetic-science-pack", 1 }, { "agricultural-science-pack", 1 }, { "cryogenic-science-pack", 1 }, { "promethium-science-pack", 1 } },
            time = 120
        },
        max_level = "infinite",
        upgrade = true
    },
    ["processing-unit-productivity"] = {
        type = "technology",
        name = "processing-unit-productivity",
        icons = { {
            icon = "__space-age__/graphics/technology/processing-unit-productivity.png",
            icon_size = 256
        }, {
            icon = "__core__/graphics/icons/technology/constants/constant-recipe-productivity.png",
            icon_size = 128,
            scale = 0.5,
            shift = { 50, 50 },
            floating = true
        } },
        icon_size = 256,
        effects = { {
            type = "change-recipe-productivity",
            recipe = "processing-unit",
            change = 0.1
        } },
        prerequisites = { "electromagnetic-science-pack", "production-science-pack" },
        unit = {
            count_formula = "1.5^L*1000",
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "chemical-science-pack", 1 }, { "production-science-pack", 1 }, { "electromagnetic-science-pack", 1 } },
            time = 60
        },
        max_level = "infinite",
        upgrade = true
    },
    ["scrap-recycling-productivity"] = {
        type = "technology",
        name = "scrap-recycling-productivity",
        icons = { {
            icon = "__space-age__/graphics/technology/scrap-recycling-productivity.png",
            icon_size = 256
        }, {
            icon = "__core__/graphics/icons/technology/constants/constant-recipe-productivity.png",
            icon_size = 128,
            scale = 0.5,
            shift = { 50, 50 },
            floating = true
        } },
        icon_size = 256,
        effects = { {
            type = "change-recipe-productivity",
            recipe = "scrap-recycling",
            change = 0.1
        } },
        prerequisites = { "electromagnetic-science-pack", "production-science-pack" },
        unit = {
            count_formula = "1.5^L*500",
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "chemical-science-pack", 1 }, { "production-science-pack", 1 }, { "electromagnetic-science-pack", 1 } },
            time = 60
        },
        max_level = "infinite",
        upgrade = true
    },
    ["steel-plate-productivity"] = {
        type = "technology",
        name = "steel-plate-productivity",
        icons = { {
            icon = "__space-age__/graphics/technology/steel-plate-productivity.png",
            icon_size = 256
        }, {
            icon = "__core__/graphics/icons/technology/constants/constant-recipe-productivity.png",
            icon_size = 128,
            scale = 0.5,
            shift = { 50, 50 },
            floating = true
        } },
        icon_size = 256,
        effects = { {
            type = "change-recipe-productivity",
            recipe = "steel-plate",
            change = 0.1
        }, {
            type = "change-recipe-productivity",
            recipe = "casting-steel",
            change = 0.1
        } },
        prerequisites = { "production-science-pack" },
        unit = {
            count_formula = "1.5^L*1000",
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "chemical-science-pack", 1 }, { "production-science-pack", 1 } },
            time = 60
        },
        max_level = "infinite",
        upgrade = true
    },
    ["low-density-structure-productivity"] = {
        type = "technology",
        name = "low-density-structure-productivity",
        icons = { {
            icon = "__space-age__/graphics/technology/low-density-structure-productivity.png",
            icon_size = 256
        }, {
            icon = "__core__/graphics/icons/technology/constants/constant-recipe-productivity.png",
            icon_size = 128,
            scale = 0.5,
            shift = { 50, 50 },
            floating = true
        } },
        icon_size = 256,
        effects = { {
            type = "change-recipe-productivity",
            recipe = "low-density-structure",
            change = 0.1
        }, {
            type = "change-recipe-productivity",
            recipe = "casting-low-density-structure",
            change = 0.1
        } },
        prerequisites = { "production-science-pack", "metallurgic-science-pack" },
        unit = {
            count_formula = "1.5^L*1000",
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "chemical-science-pack", 1 }, { "production-science-pack", 1 }, { "metallurgic-science-pack", 1 } },
            time = 60
        },
        max_level = "infinite",
        upgrade = true
    },
    ["plastic-bar-productivity"] = {
        type = "technology",
        name = "plastic-bar-productivity",
        icons = { {
            icon = "__space-age__/graphics/technology/plastics-productivity.png",
            icon_size = 256
        }, {
            icon = "__core__/graphics/icons/technology/constants/constant-recipe-productivity.png",
            icon_size = 128,
            scale = 0.5,
            shift = { 50, 50 },
            floating = true
        } },
        icon_size = 256,
        effects = { {
            type = "change-recipe-productivity",
            recipe = "plastic-bar",
            change = 0.1
        }, {
            type = "change-recipe-productivity",
            recipe = "bioplastic",
            change = 0.1
        } },
        prerequisites = { "agricultural-science-pack", "production-science-pack" },
        unit = {
            count_formula = "1.5^L*1000",
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "chemical-science-pack", 1 }, { "production-science-pack", 1 }, { "agricultural-science-pack", 1 } },
            time = 60
        },
        max_level = "infinite",
        upgrade = true
    },
    ["rocket-fuel-productivity"] = {
        type = "technology",
        name = "rocket-fuel-productivity",
        icons = { {
            icon = "__space-age__/graphics/technology/rocket-fuel-productivity.png",
            icon_size = 256
        }, {
            icon = "__core__/graphics/icons/technology/constants/constant-recipe-productivity.png",
            icon_size = 128,
            scale = 0.5,
            shift = { 50, 50 },
            floating = true
        } },
        icon_size = 256,
        effects = { {
            type = "change-recipe-productivity",
            recipe = "rocket-fuel",
            change = 0.1
        }, {
            type = "change-recipe-productivity",
            recipe = "rocket-fuel-from-jelly",
            change = 0.1
        }, {
            type = "change-recipe-productivity",
            recipe = "ammonia-rocket-fuel",
            change = 0.1
        } },
        prerequisites = { "agricultural-science-pack", "production-science-pack" },
        unit = {
            count_formula = "1.5^L*1000",
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "chemical-science-pack", 1 }, { "production-science-pack", 1 }, { "agricultural-science-pack", 1 } },
            time = 60
        },
        max_level = "infinite",
        upgrade = true
    },
    ["rocket-part-productivity"] = {
        type = "technology",
        name = "rocket-part-productivity",
        icons = { {
            icon = "__space-age__/graphics/technology/rocket-part-productivity.png",
            icon_size = 256
        }, {
            icon = "__core__/graphics/icons/technology/constants/constant-recipe-productivity.png",
            icon_size = 128,
            scale = 0.5,
            shift = { 50, 50 },
            floating = true
        } },
        icon_size = 256,
        effects = { {
            type = "change-recipe-productivity",
            recipe = "rocket-part",
            change = 0.1
        } },
        prerequisites = { "cryogenic-science-pack" },
        unit = {
            count_formula = "1.5^L*2000",
            ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "chemical-science-pack", 1 }, { "production-science-pack", 1 }, { "cryogenic-science-pack", 1 } },
            time = 60
        },
        max_level = "infinite",
        upgrade = true
    }
}
