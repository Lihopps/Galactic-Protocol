local gazeous_fiel={
    water="heavy",
    ["sulfuric-acid"]="heavy",
    ["lithium-brine"]="heavy",
    
    steam="light",
    ammonia="light",
    fluorine="light",
   
}
for name,type in pairs(gazeous_fiel) do
    sc_add_gazeous_field(type,name)
end