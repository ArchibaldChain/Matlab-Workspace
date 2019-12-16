function value = AB(i,j)
       h = 1/50;
    a1 = (-2 / h.^2 - 100);
    a2 = (1 / h.^2);
    value = ones(length(i), length(j));
    for p = 1:length(i)        
        for q = 1:length(j)
            if (i(p) - j(q) == 1)
                value(p,q) = a1;
            elseif (abs(i(p) - j(q)) == 1)
                value(p,q) = a2;
            else
                value(p,q) = 0;
            end
        end
    end
    
end