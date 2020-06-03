V = [2.27 2.76 3.27 3.31 3.70 3.85 4.31 4.39 4.42]
P = [2500 365 23700 5491 14000 78200 70700 138000 304500]

V2 = [4.81 4.90 5.05 5.21 5.62 5.88]
P2 = [341948 49375 260200 867023 1340000 1092759]

p1 = expR(V,P)
p2 = logR(V,P)
legend('data', 'model 1', 'model 2')
hold off

function pa = expR(v, p)
plot(v,p, 'o')
y = log(p);
x = log(v);
x = [ones(length(x),1), x']

pa = regress(y',x)
hold on;
plot(v, exp(x*pa),'-.')
pa(1) = exp(pa(1))
end 

function pa = logR(v, p)
y = p
x = log(v);
x = [ones(length(x),1), x']

pa = regress(y',x)
y_ = pa(2) *log(v)+ pa(1)
plot(v, y_,'--')
end
