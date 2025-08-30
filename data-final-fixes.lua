require("util.randomlua")
local superbarrel=require("util.superbarrel")

require("final-fixes.collector")
--helpers.write_file("tech.json",helpers.table_to_json(data.raw["technology"]))
helpers.write_file("gpcoll.json",helpers.table_to_json(gpPlanetCollector))


--on gere les compat dans le collector (ex "maraxsis-trench")
require("compat.collector")



--on creer l'univers (star planet connection etc)
require("final-fixes.universe")



--- on met a jour le gp-tree pour avoir l'arbo
local spacelocationfinalupdate=require("final-fixes.spacelocation")
for planet_name, planet in pairs(data.raw["planet"]) do
   spacelocationfinalupdate.updateArbo(planet)
end
for planet_name, planet in pairs(data.raw["space-location"]) do
   if not string.find(planet_name,"space-location-unknown",0,true) and not string.find(planet_name,"shattered-planet",0,true) then
      if not string.find(planet_name,"gpstar-",0,true) and not string.find(planet_name,"-system-edge",0,true) then
         spacelocationfinalupdate.updateArbo(planet)
      end
   end
end

--on ajoute les recipes du harvester
--add harvesting light and heavy recipe and create super barrel
for _, h_fluid in pairs(gp_gazeous_field["heavy"]) do
  for _, l_fluid in pairs(gp_gazeous_field["light"]) do
    local h_temp = data.raw["fluid"][h_fluid].max_temperature or data.raw["fluid"][h_fluid].default_temperature
    local l_temp = data.raw["fluid"][l_fluid].max_temperature or data.raw["fluid"][l_fluid].default_temperature
    local name = "gp-harvesting-" .. h_fluid .. "-" .. l_fluid
    data:extend({
      {
        type = "recipe",
        name = name,
        enabled = lihop_debug,
        localised_name={"recipe-name.gazeous-planet-harvester"},
        surface_conditions = { { property = "gravity", min = 0, max = 0 } },
        category = "gp-harvesting",
        energy_required = 2,
        ingredients = {},
        subgroup = "fluid-recipes",
        order = "z",
        icons={
          {
            icon = "__zzz-GalacticProtocol__/graphics/entity/harvester/harvester-icon.png",
            scale=1.1
          },
          {
            icon = data.raw["fluid"][h_fluid].icon,
            shift={-15,15},
            scale=0.5
          },
          {
            icon =data.raw["fluid"][l_fluid].icon,
            shift={15,15},
            scale=0.5
          }
        },
        results = {
          { type = "fluid", fluidbox_index = 1, name = h_fluid, amount = 100, temperature = h_temp },
          { type = "fluid", fluidbox_index = 2, name = l_fluid, amount = 100, temperature = l_temp }
        }
      },
    })

    table.insert(data.raw.technology["gp-harvester-l"].effects, {
      type = "unlock-recipe",
      recipe = name
    })
  end
end

for type, fluids in pairs(gp_gazeous_field) do
  for _, h_fluid in pairs(fluids) do
    local fluidproto = data.raw["fluid"][h_fluid]
    local h_temp = data.raw["fluid"][h_fluid].max_temperature or data.raw["fluid"][h_fluid].default_temperature
    superbarrel.create_all(fluidproto, h_temp)
  end
end


-- rebuild du tech tree
require("final-fixes.technology-tree-builder").buildtree()

-- envoi vers control stage
data:extend({
   {
      type="mod-data",
      data_type="gptree",
      data=gptree,
      name="gptree"
   }
})

--on force le player a spawn sur nauvis avec les items de base


--- tout est fait on construit les placeholders
require("final-fixes.starmapCreator")

-- Enjoy :)