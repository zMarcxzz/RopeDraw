local module = {}
module.__index = module

local draw = Drawing.new

function module.new(points,position,distance)

    if points < 2 then return error('The min of points are 2') end
    
    local self = setmetatable({origin=position,points={}},module)
    
    for i = 1,points-1 do
        local new = draw('Line')
        
        new.From = position+(distance*i)
        new.To = position+(distance*(i+1))
        
        new.Visible = true
        
        self.points[i] = new
    end
        
    return self
end

function module:update(i,y)

    if not self.points[i] then return error('The point doesnt exists') end
    
    self.points[i].From = Vector2.new(self.origin.X,self.origin.Y+y)
    
    if self.points[i-1] then
        self.points[i-1].To = Vector2.new(self.origin.X,self.origin.Y+y)
    end
end

return module
