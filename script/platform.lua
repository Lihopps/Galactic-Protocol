local function change_state_plasma_havester(platforme,state)
    local filter={ name = {"lihop-harvester-plasma"}}
    local harvesters=platforme.surface.find_entities_filtered(filter) 
    if not harvesters then return end
    for _,harvester in pairs(harvesters) do
        harvester.active=state
    end
end

local function set_recipe(platforme,n,type)
    local filter={ name = {"gp-harvester"}}
    if not platforme.surface then return end
    local harvesters=platforme.surface.find_entities_filtered(filter) 
    if not harvesters then return end
    --game.print("ici")
    for _,harvester in pairs(harvesters) do
        if n==0 then
            --game.print(platforme.space_location.localised_description)
            if type=="lihopstar" then
                if harvester.force.technologies["gp-harvester-h"].researched then
                    harvester.set_recipe("gp-harvesting-fusion-plasma")
                end
            elseif type=="lihopgazeous" then
                if harvester.force.technologies["gp-harvester-l"].researched then
                    local field=prototypes.mod_data["gptree"].data[platforme.space_location.name].field

                    local recipe_name="gp-harvesting-" ..field.heavy.."-"..field.light
                    harvester.set_recipe(recipe_name)
                end
            end
        else
            harvester.clear_fluid_inside()
            harvester.set_recipe()
        end
    end

end

local function on_space_platform_changed_state(e)
    local platforme=e.platform
    if not platforme then return end
    if platforme.space_location then 
        if prototypes.mod_data["gptree"].data[platforme.space_location.name] then
            if prototypes.mod_data["gptree"].data[platforme.space_location.name].field then
                if string.find(platforme.space_location.name,"gpstar-",0,true) then
                    set_recipe(platforme,0,"lihopstar")
                    return true
                else
                    set_recipe(platforme,0,"lihopgazeous")
                    return true
                end
            end
        end
        set_recipe(platforme,1)
    else
        --reset factories
        set_recipe(platforme,1)
    end
end

local function cargo_pod_creation(e)
    local proxy = e.spawned_container
    if proxy and proxy.valid then
        local marked=proxy.order_deconstruction(proxy.force)
    end
end


local plateform={}


plateform.events={
	[defines.events.on_space_platform_changed_state]=on_space_platform_changed_state,
    [defines.events.on_cargo_pod_delivered_cargo ] = cargo_pod_creation,
}


return plateform