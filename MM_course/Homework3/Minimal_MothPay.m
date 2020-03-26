function [c] = Minimal_MothPay(a_0, r_m, D)
n = length(a_0);
c = ones(1,n);
temp = zeros(1,n)
for i= 1:n
    for j = 0:D(i)
        temp(i) = temp(i) + (1 + r_m(i))^j;
    end
end

c = (a_0.* (1+r_m).^D) ./ temp
end