local techbase=require("util.techsave")
local techbuild={}


local function gpstar_integrated(tech_mod)
    for name,techdata in pairs(tech_mod) do
        if string.find(name,"gpstar-",0,true) then
            table.insert(techdata.prerequisites,"space-platform-thruster")
            data:extend({techdata})
            tech_mod[name]=nil
        end
    end
end

local function space_location_integrated(tech_mod)
    for name,techdata in pairs(tech_mod) do
        for i,effect in ipairs(techdata.effects) do
            if string.find(effect.type,"unlock-space-location",0,true) then
                --on decourvre qqchose avec cette tech

                --on cherche dans quelle gpstar
                local star_name=nil
                for corps,data in pairs(gptree) do
                    for _,child_name in pairs(data.child) do
                        if child_name==effect.space_location then
                            star_name=corps
                            break
                        end
                        if gptree[child_name] then
                            if gptree[child_name].child then
                                for _,moon_name in pairs(gptree[child_name].child)do
                                    if moon_name==effect.space_location then
                                        star_name=corps
                                        break
                                    end
                                end
                            end
                        end
                    end
                end
                if not star_name then return end
                --on lui met en prerequis
                table.insert(techdata.prerequisites,star_name)

                data:extend({techdata})
                tech_mod[name]=nil
                table.remove(techdata.effects,i)
            end
        end
    end
end

function techbuild.buildtree()

    -- reset tech comme si juste space age et elevated rails et quality
    local tech=table.deepcopy(data.raw["technology"])
    data.raw["technology"]=nil
    for name,techdata in pairs(techbase) do
        data:extend({techdata})
    end


    --on detect toutes les tech de mods
    local tech_mod={}
    for name,techdata in pairs(tech) do
        if not data.raw["technology"][name] then
            tech_mod[name]=techdata
        end
    end


    --ajout des gpstar dans le tech tree
    gpstar_integrated(tech_mod)

    --on insert les tech avec discovery dedans
    space_location_integrated(tech_mod)


    --on injecte les tech qui reste
    for name,techdata in pairs(tech_mod) do
        data:extend({techdata})
    end

end


return techbuild
