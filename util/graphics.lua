local util_graphics={}

function util_graphics.sptechnology_icon_constant_planet(star_icons)
  
  local icons = table.deepcopy(star_icons)
  table.insert(icons,
    {
      icon = "__core__/graphics/icons/technology/constants/constant-planet.png",
      icon_size = 128,
      scale = 0.5,
      shift = {50, 50}
    }
  )
  return icons
end


return util_graphics