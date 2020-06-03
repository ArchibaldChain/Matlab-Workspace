classdef Point
    properties
        x=0;
        y= 0;
    end
    methods
        function obj = Point(xc, yc)
            if nargin == 2
                obj.x = xc;
                obj.y = yc;
            end
        end
        function out = area(obj)
            out = 0;
        end
        function out = distance(obja, objb)
            out = sqrt((objb.x - obja.x) ^2 + ...
                (objb.y - obja.y)^2);
        end
    end
end
