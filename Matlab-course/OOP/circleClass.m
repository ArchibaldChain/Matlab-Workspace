classdef circleClass
    properties
        rad
    end
    methods
        function obj = circleClass(r)
             if nargin > 0
             obj.rad = r
             else
            obj.rad = 1
             end 
        end
        function area = cirArea(obj)
            area = pi * obj.rad * obj.rad
        end
        function cum = cirCircum(obj)
            cum = 2*pi*obj.rad
        end
    end
end