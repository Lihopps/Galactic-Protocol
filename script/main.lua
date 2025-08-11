local starmap=require("script.starmap.starmap")
local force=require("script.force")

local main={}

function main.on_init()
    if not storage.gpplatform then storage.gpplatform ={} end
    if not storage.gpuniverse then storage.gpuniverse ={} end
    if not storage.players_custom_tooltip then storage.players_custom_tooltip ={} end
    force.createFriendly()
    starmap.createUniverse()
end

function main.on_configuration_changed(e)
    --migrations.on_configuration_changed(e)
    
end

main.events={

}

return main