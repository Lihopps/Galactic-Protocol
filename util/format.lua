local util_format={}

function util_format.seconds_to_readable_times(time)
    local hours = math.floor(math.fmod(time, 86400)/3600)
    local minutes = math.floor(math.fmod(time,3600)/60)
    local seconds = math.floor(math.fmod(time,60))
    if hours>0 and minutes>0 and seconds>0 then
        return {"description.hms",tostring(hours),tostring(minutes),tostring(seconds)}
    elseif minutes>0 and seconds>0 then
        return {"description.ms",tostring(minutes),tostring(seconds)}
    elseif minutes>0 then
        return {"description.mm",tostring(minutes)}
    else
        return {"surface-property-unit.day-night-cycle",tostring(seconds)}
    end
end

function util_format.en_to_fr(str)
    return str:gsub(","," ")
end

return util_format