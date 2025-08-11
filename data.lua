lihop_debug=false
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

require("prototypes.platformPH")