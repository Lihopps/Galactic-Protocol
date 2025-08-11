require("final-fixes.star")


--- on met a jour le factoriopedia_description pour avoir l'arbo
local spacelocationfinalupdate=require("final-fixes.spacelocation")
for planet_name, planet in pairs(data.raw["planet"]) do
   spacelocationfinalupdate.updateArbo(planet)
end


--- tout est fait on construit les placeholders
require("final-fixes.starmapCreator")