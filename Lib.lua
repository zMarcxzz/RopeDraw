local module = {}
module.__index = module

local draw = Drawing.new

function module.new(points,position,distance,color)

    if points < 2 then return error('The min of points are 2') end
    
    local self = setmetatable({origin=position,distance=distance,points={}},module)
    
    for i = 1,points-1 do
        local new = draw('Line')
        
        new.Color = color
        new.From = position+(distance*i)
        new.To = position+(distance*(i+1))
        
        new.Visible = true
        
        self.points[i] = new
    end
        
    return self
end

function module:update(i,y)
    
    if self.points[i] then
        self.points[i].From = Vector2.new(self.origin.X,self.origin.Y-y) + (self.distance*i)
    end
    
    if self.points[i-1] then
        self.points[i-1].To = Vector2.new(self.origin.X,self.origin.Y-y) + (self.distance*(i))
    end
end

return module
