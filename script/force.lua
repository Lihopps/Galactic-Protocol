local starmap=require("script.starmap.starmap")
local playerScript=require("script.player")

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

local function on_research_finished(e)
    if e.research.name=="space-platform-thruster" then
        if not game.surfaces[e.research.name] then
            --add button starsystem
            for _,player in pairs(e.research.force.players) do
                playerScript.create_starSystem_button(player)
            end
        end
    elseif string.find(e.research.name,"gpstar-",0,true) then
        if not game.surfaces[e.research.name] then
            starmap.createSystem(e.research.name)
            for _,player in pairs(e.research.force.players) do
                playerScript.create_starUniverse_button(player)
            end
        end
    end
end

force.events={
    [defines.events.on_tick]=on_tick,
    [defines.events.on_research_finished]=on_research_finished
}

return force