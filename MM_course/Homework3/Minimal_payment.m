function [N, TP] = Minimal_payment(BDP, c_0, r_m, c)
% Modified at Mar 17th
% The parameter could be vector except 

N = zeros(1, length(c_0));
TP = zeros(1, length(c_0)); 
for i = 1:length(BDP)
    a = BDP(i) - c_0(i)
    while a > 0 
        a = a*(1+r_m(i)) - c;
        N(i) = N(i)+1 
    end
    TP(i) = c_0(i) + N(i) * c + a
end
end