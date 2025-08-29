lihop_debug=true
if data.raw.planet["nauvis"] then
    data.raw.planet["nauvis"].surface_properties =
    {
      ["day-night-cycle"] = 7 * minute,
      ["magnetic-field"] = 90,
      pressure = 1000,
      ["solar-power"] = 100,
      gravity = 10
    }
end
gpbackers=table.deepcopy(require("backers"))
gptree={}
gpmoontracker={}


gazeous_graphics=1

require("categories.category")
require("prototypes.platformPH")
require("prototypes.technology")
require("prototypes.sprite")