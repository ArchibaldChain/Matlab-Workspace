P = [341948 1092759 5491 49375 1340000 365 2500 78200 867023 ...
    14000 23700 70700 304500 138000 2602000];
V = [4.81 5.88 3.31 4.90 5.62 2.76 2.27 3.85...
    5.21 3.70 3.27 4.31 4.42 4.39 5.05]
n = length(P)
m = [P',V']
m = sortrows(m,1);
lm = log(m)
plot(lm(:,1), lm(:,2), 'o')
hold on
x = lm(:,1);
y = lm(:,2);
p = polyfit(lm(:,1), lm(:,2),1);
f = polyval(p,lm(:,1));
plot(x,f,'-')

x_1 = log(P)
M = ones(n,3)
M(:,1) = uint8(1:n)'
M(:,2) = V'
M(:, 3) = exp(polyval(p, x_1))

p = polyfit(lm(:,1), lm(:,2),14);
f = polyval(p,lm(:,1));
plot(x,f,'-')