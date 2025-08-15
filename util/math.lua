local util_math={}

function util_math.hash(str)
    local h = 0
    for i = 1, #str do
       h = h*32 + h + str:byte(i)
    end
    return h
end

function util_math.map(n, start1, stop1, start2, stop2)
  return ((n - start1) / (stop1 - start1)) * (stop2 - start2) + start2;
end

function util_math.distance(pos1,pos2)
  return math.sqrt(((pos2.x-pos1.x)*(pos2.x-pos1.x))+((pos2.y-pos1.y)*(pos2.y-pos1.y)))
end

function util_math.distance2(pointA,pointB)
  return util_math.distance(pointA.position,pointB.position)
end

function util_math.vector_from_pos(pos1,pos2)
  return {x=pos2.x-pos1.x,y=pos2.y-pos1.y}
end

function util_math.normalise_vector(vector)
  local norme=util_math.distance(vector,{x=0,y=0})
  return {x=vector.x/norme,y=vector.y/norme}
end

function util_math.scale_vector(vector,scale)
  return {x=vector.x*scale,y=vector.y*scale}
end

function util_math.add_vector(vector1,vector2)
  return {x=vector1.x+vector2.x,y=vector1.y+vector2.y}
end

function util_math.minus_vector(vector1,vector2)
  return {x=vector1.x-vector2.x,y=vector1.y-vector2.y}
end

function util_math.cart_to_pol(pos1,convert)
  local norme=util_math.distance(pos1,{x=0,y=0})
  local angle=(pos1.x==0 and 0) or math.atan(pos1.y/pos1.x)
  if convert then
    return {distance=norme,angle=angle}
  else
    return {distance=norme,angle=angle}
  end
end

function util_math.pol_to_cart(norme,angle) 
  return {x=norme*math.cos(angle),y=norme*math.sin(angle)}
end

function util_math.cart_to_fpol(pos)
 local theta = math.atan2(-pos.y, pos.x) -- invert y here too
    local angle = 0.25 - (theta / (2 * math.pi))
    angle = angle % 1
    local r = math.sqrt(pos.x^2 + pos.y^2)
    return {distance=r, orientation=angle}
end

function util_math.fpol_to_cart(pos)
    local angle=pos.angle or pos.orientation
    local theta = (0.25 - angle) * 2 * math.pi
    return {
        x = pos.distance * math.cos(theta),
        y = -pos.distance * math.sin(theta) -- invert to match Factorio map coords
    }
end

function util_math.sum_array(array,field)
  local sum=0
  if next(array) then
    for _,v in pairs(array) do
      sum=sum+v[field]
    end
  end
  return sum
end

function util_math.determiant(a,b,c,d,e,f,g,h,i)
    b=-b
    e=-e
    h=-h
    return a*e*i+b*f*g+c*d*h-c*e*g-b*d*i-a*f*h
end

function util_math.in_circle(sommet,circle_data)
    if util_math.distance2(sommet,circle_data) < circle_data.rayon then
        return true
    else
        return false
    end
end

return util_math