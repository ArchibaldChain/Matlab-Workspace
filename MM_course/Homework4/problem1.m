T = [88 225 365 687 4329 10753 30600 60150];
r = [57.9 108.2 149.6 227.9 778.1 1428.2 2837.9 4488.9]
plot( r,T, 'o')

y = log(T)
x = log(r)
x = [ones(length(x),1), x']

p = regress(y',x)
plot(r,T,'o', r, exp(x*p),'-')
