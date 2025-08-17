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
for planet_name, planet in pairs(data.raw["space-location"]) do
   if not string.find(planet_name,"space-location-unknown",0,true) and not string.find(planet_name,"shattered-planet",0,true) then
      if not string.find(planet_name,"gpstar-",0,true) and not string.find(planet_name,"-system-edge",0,true) then
         spacelocationfinalupdate.updateArbo(planet)
      end
   end
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