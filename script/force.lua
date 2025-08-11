local force={}


function force.createFriendly()
    local friend=game.create_force("gp-superfriendly")
    for _,f in pairs(game.forces) do
        f.set_friend(friend, true)
        friend.set_friend(f,true)
    end
end

local function on_tick(e)
    if e.tick%120==0 then
        for _,force in pairs(game.forces) do
            for _,surface in pairs(game.surfaces) do
                if string.find(surface.name,"gpstar",0,true) then
                    force.chart_all(surface)
                end
            end
        end
    end
end

force.events={
    [defines.events.on_tick]=on_tick
}

return force