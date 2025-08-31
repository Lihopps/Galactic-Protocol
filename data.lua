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
gp_gazeous_field={light={},heavy={}}


gazeous_graphics=1
require("util.gen_function")

require("categories.category")
require("prototypes.platformPH")
require("prototypes.technology")
require("prototypes.resource")
require("prototypes.entities.entities")
require("prototypes.sprite")
require("prototypes.style")