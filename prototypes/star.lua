local util_math = require("util.math")

local star = {}

---defines solar power from temp
---@param temperature any
---@return unknown
local function star_power(temperature)
    return util_math.map(temperature, 100, 300, 600, 1500)
end

---defines color from temp
---@param temperature number :temperature of the star
---@return Color : rgb color tint
local function star_color(temperature)
    local step = (300 - 100) / 4
    if temperature >= 100 + 0 * step and temperature < 100 + 1 * step then
        return { r = 1, g = util_math.map(temperature, 100 + 0 * step, 100 + 1 * step, 0, 1), b = 0, a = 1 }
    elseif temperature >= 100 + 1 * step and temperature < 100 + 2 * step then
        return { r = 1, g = 1, b = util_math.map(temperature, 100 + 1 * step, 100 + 2 * step, 0, 1), a = 1 }
    elseif temperature >= 100 + 2 * step and temperature < 100 + 3 * step then
        return { r = util_math.map(temperature, 100 + 2 * step, 100 + 3 * step, 1, 0), g = 1, b = 1, a = 1 }
    elseif temperature >= 100 + 3 * step and temperature < 100 + 4 * step then
        return { r = 0, g = util_math.map(temperature, 100 + 3 * step, 100 + 4 * step, 1, 0), b = 1, a = 1 }
    end
end


---defines size from temperature
---@param temperature number : temperature of the star
---@return number : size of the star
local function star_size(temperature)
    return util_math.map(temperature, 100, 300, 1, 9)
end


---create a star for system
---@param name string : star name
---@param temperature number : star temperature [100:300] (for tint solar power etc)
---@param position table : {distance=number,orientation=number}
function star.create_star(name, temperature, position)
    local etoile = {

        type = "space-location",
        name = "gpstar-" .. name,
        localised_name = (name == "calidus" and "Calidus") or name,
        icons = {
            {
                icon = "__zzz-GalacticProtocol__/graphics/starmap/star/starmap-star.png",
                tint = star_color(temperature),
                icon_size = 512,
            }
        },
        magnitude = star_size(temperature),
        starmap_icons = {
            {
                icon = "__zzz-GalacticProtocol__/graphics/starmap/star/starmap-star.png",
                tint = star_color(temperature),
                icon_size = 512,
            }
        },
        order = "0",
        subgroup = "gpstar-" .. name,
        draw_orbit = false,
        gravity_pull = 20 * star_size(temperature),
        solar_power_in_space = star_power(temperature),
        auto_save_on_first_trip = false,
        distance = position.distance,
        orientation = position.orientation or position.angle,
        label_orientation = 0.15,
        position = util_math.fpol_to_cart(position),
        fly_condition=true,
        field = { plasma = "fusion-plasma" }
    }
    if mods["visible-planets"] then
        vp_override_planet_scale(etoile.name, etoile.magnitude*2)
        gp_create_planet_sprite_prototype(etoile,vp_get_planet_overrides())
    end
    return etoile
end

return star
