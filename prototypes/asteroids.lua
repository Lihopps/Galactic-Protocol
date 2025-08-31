

local function in_black_list(name)
    local blist={"promethium","parameter","planetary"}
    for _,black in pairs(blist) do
        if string.find(name,black,0,true) then
            return true
        end 
    end
    return false
end

local asteroids = {}

function asteroids.spawn_belt(gen)
    -- tous les types en big et huge
    -- beaucoup sans vitesse
    local spawn = {}
    for _, size in pairs({ "big", "huge" }) do
        for name, asteroid in pairs(data.raw["asteroid"]) do
            if string.find(name, size, 0, true) then
                table.insert(spawn, {
                    type = "entity",
                    asteroid = name,
                    probability = gen:random(0.0001, 0.0005), --0.0001 a 0.0005
                    speed = gen:random(0.01, 0.02),        --0.0166667, --
                    angle_when_stopped = gen:random(0, 1)
                })
            end
        end
    end
    return spawn
end

function asteroids.spawn_connection(gen, connection)
    local size = { "small", "medium", "big", "huge", "chunk" }
    local points_nb = gen:random(2, 5)
    local asteroids_data = { entity = {}, ["asteroid-chunk"] = {} }

    for k, v in pairs(data.raw["asteroid"]) do
        if not in_black_list(v.name) then
            table.insert(asteroids_data["entity"], v.name)
        end
    end
    for k, v in pairs(data.raw["asteroid-chunk"]) do
        if not in_black_list(v.name) then
            table.insert(asteroids_data["asteroid-chunk"], v.name)
        end
    end

    local spawn_def = {}

    for type, asteroid_list in pairs(asteroids_data) do
        for _, asteroid_name in pairs(asteroid_list) do
            if gen:random()<0.4 then
                local asteroid = {
                    type = type,
                    asteroid = asteroid_name,
                    spawn_points = {}
                }
                for i = 1, points_nb do
                    table.insert(asteroid.spawn_points, {
                        distance = i * (1 / points_nb),
                        probability = gen:random(0.0001, 0.0005), --0.0001 a 0.0005
                        speed = gen:random(0.01, 0.02),    --0.0166667, --
                        angle_when_stopped = gen:random(0, 1)
                    })
                end
                table.insert(spawn_def, asteroid)
            end
        end
    end

    return spawn_def
end

return asteroids
