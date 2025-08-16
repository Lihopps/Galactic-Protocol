require("util.randomlua")
require("final-fixes.collector")
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


-- envoi vers control stage
data:extend({
   {
      type="mod-data",
      data_type="gptree",
      data=gptree,
      name="gptree"
   }
})

--- tout est fait on construit les placeholders
require("final-fixes.starmapCreator")