classdef Circle < Point
    properties
        radius
    end
    methods
        function obj = Circle(r,x,y)
            obj@Point(x,y)
            if nargin > 0
                obj.radius = r
            else
                obj.radius = 1
            end
        end
        function out = area(obj)
            out = pi* obj.radius^2
        end
        function out = distance(obj1,obj2)
        
            out = distance@Point(obj1, obj2)
        end
    end
end