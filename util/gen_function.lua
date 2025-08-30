---Add graphics set for planet type like 
---@param name string : FluidID
---@param type string : light or heavy (juste one type by planet)
function sc_add_gazeous_field(type,name)
    table.insert(gp_gazeous_field[type],name)
end