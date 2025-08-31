local util_math=require("util.math")
local asteroids=require("prototypes.asteroids")

for name, prototype in pairs(data.raw["space-connection"]) do
    local gen = mwc(util_math.hash(name))
    local from = data.raw["space-location"][prototype.from] or data.raw["planet"][prototype.from]
    if not from then log(prototype.name.." not :"..prototype.from) end
    
    local to = data.raw["space-location"][prototype.to] or data.raw["planet"][prototype.to]
    if not to then log(prototype.name.." not :"..prototype.to) end
    
    if (not prototype.icon) and (not prototype.icons) and from and (from.icon or from.icons[1].icon) and to and (to.icon or to.icons[1].icon) then
        local from_size = from.icon_size or 64
        local from_tint = from.tint or { r = 1, g = 1, b = 1, a = 1 }
        if from.icons then
            from_size = from.icons[1].icon_size or 64
            from_tint = from.icons[1].tint
        end

        local to_size = to.icon_size or 64
        local to_tint = to.tint or { r = 1, g = 1, b = 1, a = 1 }
        if to.icons then
            to_size = to.icons[1].icon_size or 64
            to_tint = to.icons[1].tint
        end
        prototype.icons =
        {
            { icon = "__space-age__/graphics/icons/planet-route.png" },
            { icon = from.icon or from.icons[1].icon,                tint = from_tint, icon_size = from_size, scale = 0.333 * (64 / (from_size)), shift = { -6, -6 } },
            { icon = to.icon or to.icons[1].icon,                    tint = to_tint,   icon_size = to_size,   scale = 0.333 * (64 / (to_size)),   shift = { 6, 6 } }
        }
    else
        log("attention : "..prototype.name)
    end

    if not prototype.length then
        prototype.length=gen:random(15,35)*1000
    end

    if prototype.need_spanwdef and from and to then
        prototype.asteroid_spawn_definitions = asteroids.spawn_connection(gen,prototype)
    end


    --pour aller plus vite en mode debug
    if lihop_debug then
        prototype.length=3000
    end
end
